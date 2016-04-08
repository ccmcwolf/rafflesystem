package raffle_uti;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.google.gson.Gson;

import entity.DynamicRafData;
import util.HibernateUtil;

/**
 * Servlet implementation class ReserveRaffleSerlet
 */
@WebServlet("/ReserveRaffleServlet")
public class ReserveRaffleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReserveRaffleServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		System.out.println("STEP1");

		try {
			SessionFactory factory = HibernateUtil.getSessionFactotry();
			Session session = factory.openSession();
			HttpSession session2 = request.getSession();
			Transaction tx = session.beginTransaction();

			SQLQuery query = session.createSQLQuery(
					"select raffle_count, raffle_id, is_exists, start_date, end_date from raffle natural join raffle_campaign where raffle.campaign_id = raffle_campaign.campaign_id and is_exists='true' and campaign_id="
							+ request.getParameter("id") + ";");
			query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			List<Object> list = query.list();

			int raffle_count = 0;
			String start_date = null;
			String end_date = null;
			ArrayList<Integer> raffleID_list = new ArrayList<>();

			for (Object object : list) {
				Map row = (Map) object;
				raffle_count = Integer.valueOf(row.get("raffle_count").toString());
				start_date = row.get("start_date").toString();
				end_date = row.get("end_date").toString();
				raffleID_list.add(Integer.valueOf(row.get("raffle_id").toString()));
			}
			
			session2.setAttribute("raffle_count_exists", raffle_count);
			session2.setAttribute("startDate", start_date);
			session2.setAttribute("endDate", end_date);
			session2.setAttribute("raffle_count_and_ids", raffleID_list);
			
			RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/orders.jsp");
			requestDispatcher.include(request, response);
			tx.commit();
			session.close();
		} finally {
			writer.close();
		}
	}

}
