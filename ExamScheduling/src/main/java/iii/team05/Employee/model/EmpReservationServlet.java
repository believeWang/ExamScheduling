package iii.team05.Employee.model;

import iii.team05.event.model.EventDAO;
import iii.team05.event.model.EventVO;
import iii.team05.examinee.ecmodel.ECHibernateDAO;
import iii.team05.examinee.ecmodel.ECVO;
import iii.team05.examinee.ecmodel.ESHibernateDAO;
import iii.team05.examinee.ecmodel.ESVO;

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

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Servlet implementation class EventShowServlet
 */
@WebServlet("/emp/EmpEventServlet")
public class EmpReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmpReservationServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		int emp = Integer.parseInt(String.valueOf(session.getAttribute("EmpNO")));//利用ession取得考官編號
		
		EventDAO eventDAO = new EventDAO();
		List<EventVO> eventVOlists = eventDAO.getEmpEvent(emp);
		
		ECHibernateDAO ecDAO = new ECHibernateDAO();
		List<ECVO> ecVOlists = ecDAO.getAll();
		
		request.setAttribute("eventVOlists", eventVOlists);
		request.setAttribute("ecVOlists", ecVOlists);
		
		RequestDispatcher failureView = request.getRequestDispatcher("/WEB-INF/emp/emp_event.jsp");
		failureView.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		// TODO Auto-generated method stub
	}

}
