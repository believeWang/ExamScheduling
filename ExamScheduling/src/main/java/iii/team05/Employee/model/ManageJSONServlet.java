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
@WebServlet("/employee/ManageJSONServlet")
public class ManageJSONServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ManageJSONServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8"); 
		String selected = request.getParameter("selected");
		
		
		PrintWriter out = response.getWriter();
		
		EmployeeDAO edao = new EmployeeDAO();
		List<EmployeeVO> empall = edao.getAll();
		
		JSONArray jary= new JSONArray();			//增加json的大括號"["開始
		for (EmployeeVO empVO : empall) {			//強化行迴圈輸出
			JSONObject obj = new JSONObject();		//json轉型
			obj.put("Name", empVO.getEmpname());	//"id"為辨識字串,"eventVO.getEventid"取得event裡的"id"
			obj.put("Number", empVO.getEmpno());
			obj.put("Email", empVO.getEmpemail());
			obj.put("Position", empVO.getPosition());
			jary.put(obj);							//強化行迴圈結束
		}
		out.print(jary);							//

		//System.out.println(jary);					//測試"{}"裡的json

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
