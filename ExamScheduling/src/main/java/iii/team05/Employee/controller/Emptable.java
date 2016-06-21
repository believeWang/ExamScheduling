package iii.team05.Employee.controller;

import iii.team05.Employee.model.EmployeeDAO;
import iii.team05.Employee.model.EmployeeService;
import iii.team05.Employee.model.EmployeeVO;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/emp/emptable.do")                                                                                                                                                      
public class Emptable extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8"); 
		
		String button = req.getParameter("button");
		
		
		
		if ("select".equals(button)) { // 來自addEmp.jsp的請求
		PrintWriter out = res.getWriter();
		
		EmployeeDAO edao = new EmployeeDAO();
		List<EmployeeVO> empall = edao.getAllEmp();
		
		JSONArray jary= new JSONArray();			//增加json的大括號"["開始
		for (EmployeeVO empVO : empall) {			//強化行迴圈輸出
			JSONObject obj = new JSONObject();		//json轉型
			obj.put("Name", empVO.getEmpname());	//"id"為辨識字串,"eventVO.getEventid"取得event裡的"id"
			obj.put("Number", empVO.getEmpno());
			obj.put("Email", empVO.getEmpemail());
			obj.put("Position", empVO.getPosition()+1);
			jary.put(obj);							//強化行迴圈結束
		}
		out.print(jary);		
		
		
		}
		

	
		
		
		
		if ("insert".equals(button)) { // 來自addEmp.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			
				String empname = req.getParameter("Name").trim();
				String empemail = req.getParameter("Email").trim();
				Integer position = new Integer(req.getParameter("Position").trim());
				String token = null;
				EmployeeVO empVO = new EmployeeVO();
				empVO.setEmpname(empname);
				empVO.setEmpemail(empemail);
				empVO.setPosition(position);
				empVO.setToken(token);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("empVO", empVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/emp/addEmp.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				EmployeeService empSvc = new EmployeeService();
				empVO = empSvc.addEmp( empname, empemail, position,token);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/emp/addEmp.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("delete".equals(button)) { // 來自listAllEmp.jsp
			List<String> errorMsgs = new LinkedList<String>();
						req.setAttribute("errorMsgs", errorMsgs);
			try {
				Integer empno = new Integer(req.getParameter("Number"));
				EmployeeService empSvc = new EmployeeService();
				empSvc.deleteEmp(empno);
				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				
				
//				String url = "/employee/test.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
//				successView.forward(req, res);
				//res.sendRedirect(res.encodeRedirectURL("url"));

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/employee/test.jsp");
				failureView.forward(req, res);
				
				
			}
		}
			if ("Update".equals(button)) { // 來自listAllEmp.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				
				Integer empno = new Integer(req.getParameter("Number"));
				String empname = req.getParameter("Name");
				String empemail = req.getParameter("Email");
				Integer position = new Integer(req.getParameter("Position"));
				/*************************** 2.開始查詢資料 ****************************************/
				EmployeeService empSvc = new EmployeeService();
				//EmployeeVO empVO = empSvc.updateEmp2(empno, position-1);
				EmployeeVO empVO = empSvc.updateEmp(empno, empname, empemail, position-1);
				
				
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/employee/update_emp_input.jsp");
				failureView.forward(req, res);
				
			}
		} 



	}


}
