package loginAuth;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entity.UserLoginData;
import security.MD5Encription;
import util.HibernateUtil;
import util.PageRedirectCode;

/**
 * Servlet implementation class LoginAuthenticatorAdmin
 */
@WebServlet("/LoginAuthenticatorAdmin")
public class LoginAuthenticatorAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger sys_logger = Logger.getLogger(LoginAuthenticator.class.getName());
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginAuthenticatorAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String user_name = request.getParameter("username");
		String user_password = request.getParameter("password");
		String crypt_password = null;

		try {
			crypt_password = new MD5Encription().crypto(user_password);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		PrintWriter out = response.getWriter();
		Cookie userCookie = null;
		HttpSession httpSession = null;
		RequestDispatcher requestDispatcher = null;
		Session session = null;
		Transaction transaction = null;

		boolean isDataOk = false;
		if ((user_name != null) && (user_password != null)) {
			isDataOk = true;
		} else {
			redirectPages(PageRedirectCode.INCOMPLETE_FORM, requestDispatcher, out, request, response);
		}
		try {
			SessionFactory sessionFactory = HibernateUtil.getSessionFactotry();
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();

			Query query = session.createQuery("from entity.UserLoginData where user_name = :user_name");
			query.setParameter("user_name", user_name);
			List<UserLoginData> list = query.list();

			if (isDataOk & (!list.isEmpty())) {
				if (crypt_password != null) {
					for (int i = 0; i < list.size(); i++) {
						UserLoginData loginData = list.get(i);
						if ((loginData.getUser_name().equals(user_name))
								& (loginData.getUser_password().equals(crypt_password))) {
							httpSession = request.getSession();
							httpSession.setAttribute("user", loginData.getUser_name());
							httpSession.setMaxInactiveInterval(30 * 60);

							userCookie = new Cookie("user", loginData.getUser_name());
							userCookie.setMaxAge(30 * 60);

							response.addCookie(userCookie);
							response.sendRedirect("index.jsp");
						} else {
							redirectPages(PageRedirectCode.LOGIN_DATA_MIS_MATCH, requestDispatcher, out, request,
									response);
						}
					}
				} else {
					redirectPages(PageRedirectCode.INTERNAL_ERROR, requestDispatcher, out, request, response);
				}
			} else {
				redirectPages(PageRedirectCode.USER_NOT_FOUND_IN_DIRECTORY, requestDispatcher, out, request, response);
			}
			transaction.commit();
		} finally {
			if (session != null) {
				session.close();
			}
			if (out != null) {
				out.close();
			}
		}
	}

	private void redirectPages(int redirect_type, RequestDispatcher requestDispatcher, PrintWriter out,
			HttpServletRequest request, HttpServletResponse response) {
		sys_logger.warn("This is a warn message");
		requestDispatcher = getServletContext().getRequestDispatcher("/index.jsp");

		switch (redirect_type) {
		case PageRedirectCode.INTERNAL_ERROR:
			out.print(
					"<h3><font color=red>We've got into a trouble, please reload the page and try again.</font></h3>");
			break;
		case PageRedirectCode.LOGIN_DATA_MIS_MATCH:
			out.print("<h3><font color=red>User name or password is wrong.</font></h3>");
			break;
		case PageRedirectCode.USER_NOT_FOUND_IN_DIRECTORY:
			out.print(
					"<h3><font color=red>We couldn't find any account associated with this name,<br> If you are a new user, please <a class='btn-demo-d' href='#signup'>Signup</a></font></h3>");
			break;
		case PageRedirectCode.INCOMPLETE_FORM:
			out.print("<h3><font color=red>Please provide required details.</font></h3>");
			break;
		}

		try {
			requestDispatcher.include(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
			sys_logger.error(e);
		}
	}
}
