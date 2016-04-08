package raffle_uti;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entity.Temp_Reservation;
import util.HibernateUtil;

/**
 * Servlet implementation class Reserve
 */
@WebServlet("/Reserve")
public class Reserve extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Reserve() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		// Map<String, String> values = new HashMap<>();
		// String[] select = request.getParameterValues("select");
		// String[] useValue = request.getParameterValues("useValue");

		try (PrintWriter out = response.getWriter()) {
			// int id_count = 0;
			// if (select.length == useValue.length) {
			// for (int i = 0; i < select.length; i++) {
			// values.put(useValue[i], select[i]);
			// }
			// }

			// out.print(values.size());
			// for (int j = 0; j < values.size(); j++) {
			// System.out.println(values.get(useValue[j]).toString());
			// }

			SessionFactory factory = HibernateUtil.getSessionFactotry();
			Session session = factory.openSession();
			HttpSession session2 = request.getSession();
			Transaction tx = session.beginTransaction();

			Set<Temp_Reservation> res = new HashSet<>();
			for (int i = 0; i < request.getParameterValues("select").length; i++) {
				Temp_Reservation reservation = new Temp_Reservation();
				reservation.setUser_id(Integer.parseInt(session2.getAttribute("user_id").toString()));
				reservation.setReffle_id((Integer.parseInt(request.getParameterValues("select")[i].toString())));
				session.save(reservation);
				
				out.print(request.getParameterValues("select")[i].toString() + "<br/>");
			}

			tx.commit();
			session.close();
		}
	}

}
