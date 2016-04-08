package raffle_uti;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.google.gson.Gson;

import entity.DynamicRafData;
import entity.Raffle;
import util.HibernateUtil;

/**
 * Servlet implementation class DisplayRaffles
 */
@WebServlet("/DisplayRaffles")
public class DisplayRaffles extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayRaffles() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		response.setContentType("application/json");
		
		try {
			SessionFactory factory = HibernateUtil.getSessionFactotry();
            Session session = factory.openSession();
            Transaction tx = session.beginTransaction();
            
			SQLQuery query = session.createSQLQuery("SELECT * FROM raffle_campaign WHERE raffle_count > 0;");
			query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			List list = query.list();
			
			Gson gson = new Gson();
			ArrayList dataList = (ArrayList) list;
			String data = gson.toJson(dataList);
			writer.print("{\"ExistingRaffleData\":"+data+"}");
            
            tx.commit();
            session.close();
		} finally {
			writer.close();
		}
	}

}
