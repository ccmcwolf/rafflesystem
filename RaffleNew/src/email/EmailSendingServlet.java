package email;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entity.UserLoginData;
import entity.UserSignUp;
import util.HibernateUtil;
import util.PageRedirectCode;

/**
 * Servlet implementation class EmailSendingServlet
 */
@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// reads form fields
		PrintWriter printWriter = response.getWriter();
		String recipient = request.getParameter("recipient");

		Session session = null;
		Transaction transaction = null;

		boolean sendEmail = false;

		System.out.print(recipient);

		SessionFactory sessionFactory = HibernateUtil.getSessionFactotry();
		session = sessionFactory.openSession();
		transaction = session.beginTransaction();
		Query query = session.createQuery("from UserSignUp where user_email = :user_email");
		query.setParameter("user_email", recipient);

		List<UserSignUp> list = query.list();

		boolean checked = checkInTemp(list, recipient);

		if (!checked) {
			sendEmail = checkinExDB(request, response, recipient, printWriter);

		} else {
			printWriter.print("User sign up already sent");
		}

		transaction.commit();
		session.close();

		if (sendEmail) {
			String resultMessage = "";
			try {
				String veriID = EmailUtility.sendEmail(host, port, user, pass, recipient);
				HibernateSaveUser.saveuserTemp(veriID, recipient);
				resultMessage = "The e-mail was sent successfully Please check your inbox <br> <a href='index.jsp'>Click here to return</a>";
				
			} catch (Exception ex) {
				ex.printStackTrace();
				resultMessage = "There were an error: " + ex.getMessage();
			} finally {
				request.setAttribute("Message", resultMessage);
				getServletContext().getRequestDispatcher("/result.jsp").forward(request, response);
			}
		} else {

			printWriter.print("Already Registered user Please sign in");
		}
	}

	private boolean checkinExDB(HttpServletRequest request, HttpServletResponse response, String recipient,
			PrintWriter printWriter) throws IOException {

		boolean isFoundonExusers = true;
		Session session = null;
		Transaction transaction = null;

		SessionFactory sessionFactory = HibernateUtil.getSessionFactotry();
		session = sessionFactory.openSession();
		transaction = session.beginTransaction();

		Query query = session.createQuery("from UserLoginData where user_email = :user_email");
		query.setParameter("user_email", recipient);
		List<UserLoginData> list = query.list();

		for (int i = 0; i < list.size(); i++) {
			UserLoginData loginData = list.get(i);
			if ((loginData.getUser_name().equals(recipient))) {
				isFoundonExusers = false;
				printWriter.print("User already Confirmed Please login");
				printWriter.print("<a href='loginpage.jsp'>Click here to goto login page</a>");
			}
		}
		return isFoundonExusers;
	}

	protected boolean checkInTemp(List<UserSignUp> list, String recipient) {
		boolean isok = false;
		for (int i = 0; i < list.size(); i++) {
			UserSignUp usrsignUp = list.get(i);
			if (usrsignUp.getUser_email().equalsIgnoreCase(recipient)) {
				isok = true;
				break;
			}
		}

		return isok;

	}
}