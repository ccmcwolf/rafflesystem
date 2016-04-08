package email;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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

/**
 * Servlet implementation class Verifyuser
 */
@WebServlet("/Verifyuser")
public class Verifyuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String userName;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Verifyuser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String veri_token = request.getParameter("token");
		String user_email = request.getParameter("user");
		PrintWriter printWriter = response.getWriter();
		
		HttpSession httpSession = null;
		RequestDispatcher requestDispatcher = null;
		Session session = null;
		Transaction transaction = null;
		RequestDispatcher dispatcher = null;
		boolean isDataOk = false;
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactotry();
		session = sessionFactory.openSession();
		transaction = session.beginTransaction();
		
		Query query = session.createQuery("from UserSignUp where user_email = :user_email");
		query.setParameter("user_email", user_email);
		System.out.println(user_email);
		List<UserSignUp> list = query.list();
		
		for (int i = 0; i < list.size(); i++) {
			UserSignUp usrsignUp =  list.get(i);
			System.out.println("MOST OUTER"+usrsignUp.getVeri_token());
			if(usrsignUp.getUser_email().equalsIgnoreCase(user_email)){
				System.out.println("User found"+usrsignUp.getUser_email()+"Veification code for this is"+usrsignUp.getVeri_token()+"Very token from Param is"+veri_token);
				if(usrsignUp.getVeri_token().equals(veri_token)){
					isDataOk = true;
					printWriter.write("User verified");
					//delete user from temporary table
					
					userName = usrsignUp.getUser_email();
					session.delete(usrsignUp);
					
				}else{
					System.out.println("User TOKEN INVALID");
				}
			}else{
				printWriter.write("");
			}
		}
		request.setAttribute("user_email", user_email);
		getServletContext().getRequestDispatcher("/setuserpass.jsp").forward(request, response);
		transaction.commit();
		session.close();
		printWriter.close();
		
		//forward to jsp to enter password
		
		
		
	}

	

}
