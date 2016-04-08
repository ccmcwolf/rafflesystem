package raffle_uti;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entity.Raffle;
import entity.RaffleCampaign;
import util.HibernateUtil;

/**
 * Servlet implementation class AddRaffleServlet
 */
@WebServlet("/AddRaffleServlet")
public class AddRaffleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddRaffleServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String campaign_name = request.getParameter("cmp_name");
		String organizer_name = request.getParameter("org_name");
		String contact_email = request.getParameter("cont_email");
		double min_price = Double.parseDouble(request.getParameter("min_price"));
		double max_price = Double.parseDouble(request.getParameter("max_price"));
		int raffle_count = Integer.parseInt(request.getParameter("raf_count"));
		String start_date = request.getParameter("start_dt");
		String end_date = request.getParameter("end_dt");
		int raffle_number = 0;

		if ((campaign_name != null) && (organizer_name != null) && (contact_email != null) && (start_date != null)
				&& (end_date != null) && (request.getParameter("min_price") != null)
				&& (request.getParameter("max_price") != null)) {
			PrintWriter writer = response.getWriter();
			response.setContentType("text/html");
			try {
				SessionFactory factory = HibernateUtil.getSessionFactotry();
				Session session = factory.openSession();
				Transaction tx = session.beginTransaction();

				RaffleCampaign campaign = new RaffleCampaign();
				campaign.setCampaign_name(campaign_name);
				campaign.setOrganizer_name(organizer_name);
				campaign.setContact_email(contact_email);
				campaign.setRaffle_count(raffle_count);
				campaign.setStart_date(start_date);
				campaign.setEnd_date(end_date);
				campaign.setMin_price(min_price);
				campaign.setRaffle_image_preview_path("xxxx");

				writer.write("campaign name: " + campaign_name + "<br>");
				writer.write("organizer_name: " + organizer_name + "<br>");
				writer.write("email: " + contact_email + "<br>");
				writer.write("raffle_count: " + raffle_count + "<br>");
				writer.write("start_date: " + start_date + "<br>");
				writer.write("end_date: " + end_date + "<br>");
				writer.write("min_price: " + min_price + "<br>");
				session.save(campaign);

				for (int i = 0; i < raffle_count; i++) {
					Raffle raffle = new Raffle();
					raffle.setRaffle_no(raffle_number);
					raffle.setIs_exists("true");

					raffle.setCampaign(campaign);
					campaign.getRaffles().add(raffle);

					session.save(raffle);

				}

				tx.commit();
				session.close();
			} finally {
				writer.close();
			}
		} else {
			
		}

	}

}
