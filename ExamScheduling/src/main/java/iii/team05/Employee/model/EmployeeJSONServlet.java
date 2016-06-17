package iii.team05.Employee.model;

import iii.team05.event.model.EventDAO;
import iii.team05.event.model.EventVO;

import java.io.IOException;
import java.io.PrintWriter;
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
	if(session.getAttribute("EmpNO")==null)return;
		int emp = Integer.parseInt(String.valueOf(session.getAttribute("EmpNO")));//利用ession取得考官編號
	
		EventDAO edao = new EventDAO();
		List<EventVO> elists = edao.getEmpEvent(emp);
		
		JSONArray jary= new JSONArray();			//增加json的大括號"["開始
		for (EventVO eventVO : elists) {			//強化行迴圈輸出
			JSONObject obj = new JSONObject();		//json轉型
			obj.put("id", eventVO.getEventid());	//"id"為辨識字串,"eventVO.getEventid"取得event裡的"id"
			obj.put("start", eventVO.getStarttime());
			obj.put("end", eventVO.getEndtime());
			obj.put("color", eventVO.getBgcolor());
			obj.put("ecno", eventVO.getEcno());
			obj.put("title", eventVO.getTitle());
			jary.put(obj);							//強化行迴圈結束
		}
		out.print(jary);							//增加json的括號"]"結束

		//System.out.println(jary);					//測試"{}"裡的json

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
	
		
		
		
		
	}

}
