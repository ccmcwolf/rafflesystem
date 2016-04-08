package email;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entity.UserLoginData;
import security.MD5Encription;
import util.HibernateUtil;

/**
 * Servlet implementation class AddNewUsertoDB
 */
@WebServlet("/AddNewUsertoDB")
public class AddNewUsertoDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewUsertoDB() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession httpSession = null;
		RequestDispatcher requestDispatcher = null;
		Session session = null;
		Transaction transaction = null;
		String user_email =(String) request.getParameter("user_email");
		String usrnm =(String) request.getParameter("user_name");
		String pass = (String) request.getParameter("pass");
		String crypt_password = null;
		PrintWriter out = response.getWriter();
		try {
			crypt_password = new MD5Encription().crypto(pass);
		} catch (NoSuchAlgorithmException e) {
			out.println("Internal Error occured !" + e.getMessage());
			e.printStackTrace();
		}
		
			
		SessionFactory sessionFactory = HibernateUtil.getSessionFactotry();
		session = sessionFactory.openSession();
		transaction = session.beginTransaction();
		
		UserLoginData userLoginData = new UserLoginData();
		userLoginData.setUser_name(usrnm);
		userLoginData.setUser_type("USER");
		userLoginData.setUser_email(user_email);
		userLoginData.setUser_password(crypt_password);
		session.save(userLoginData);
		transaction.commit();
		session.close();
		response.sendRedirect("index.jsp");
	}

}
