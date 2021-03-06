package iii.team05.Employee.model;

import iii.team05.event.model.EventDAO;
import iii.team05.event.model.EventVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
@WebServlet("/employee/EmployeeJSONServlet")
public class EmployeeJSONServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmployeeJSONServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/ht"
				+ "ml; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if (session.getAttribute("EmpNO") == null)
			return;
		int emp = Integer
				.parseInt(String.valueOf(session.getAttribute("EmpNO")));// 利用ession取得考官編號

		EventDAO edao = new EventDAO();
		List<EventVO> elists = edao.getEmpEvent(emp);

		JSONArray jary = new JSONArray(); // 增加json的大括號"["開始
		for (EventVO eventVO : elists) { // 強化行迴圈輸出
			JSONObject obj = new JSONObject(); // json轉型
			obj.put("id", eventVO.getEventid()); // "id"為辨識字串,"eventVO.getEventid"取得event裡的"id"
			obj.put("start", eventVO.getStarttime());
			obj.put("end", eventVO.getEndtime());
			obj.put("color", eventVO.getBgcolor());
			obj.put("ecno", eventVO.getEcno());
			obj.put("title", eventVO.getTitle());
			jary.put(obj); // 強化行迴圈結束
		}
		out.print(jary); // 增加json的括號"]"結束

		// System.out.println(jary); //測試"{}"裡的json

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	//	EmployeeDAO empdao=new EmployeeDAO();
		EventDAO eventDAO=new EventDAO();
		Integer empno=(Integer) request.getSession().getAttribute("EmpNO") ;
		if (empno== null)
			return;
		//EmployeeVO empVO=empdao.findByPrimaryKey(emp);
		
		EventVO eventVO = new EventVO();
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
	//	System.out.println(end);
		try {
			SimpleDateFormat dateFormat =new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssX");
			Date parsedDate = dateFormat.parse(start);

			eventVO.setStarttime(new java.sql.Timestamp(parsedDate.getTime()));

			parsedDate = dateFormat.parse(end);
			eventVO.setEndtime(new java.sql.Timestamp(parsedDate.getTime()));
			eventVO.setTitle("預約額滿");
			eventVO.setEmpno(empno);
			eventDAO.insert(eventVO);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
