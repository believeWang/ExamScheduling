package iii.team05.Employee.controller;

import iii.team05.Employee.model.EmployeeService;
import iii.team05.Employee.model.EmployeeVO;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/emp/emp.do")                                                                                                                                                      
public class EmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				
				Integer empno = new Integer(req.getParameter("empno"));
				/*************************** 2.開始查詢資料 ****************************************/
				EmployeeService empSvc = new EmployeeService();
				EmployeeVO empVO = empSvc.getOneEmp(empno);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("employeeVO", empVO); // 資料庫取出的empVO物件,存入req
				
				String url = "/employee/update_emp_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交
			
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/employee/update_emp_input.jsp");
				
				failureView.forward(req, res);
				
			}
		} // 來自listAllEmp.jsp的請求 結束標籤
		
		
		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				Integer empno = new Integer(req.getParameter("empno").trim());

				String empname = req.getParameter("empname").trim();
				String empemail = req.getParameter("empemail").trim();

				Integer position = null;
				try {
					position = new Integer(req.getParameter("position").trim());
				} catch (NumberFormatException e) {
					position = 0;
					errorMsgs.add("請填數字.");
				}
				EmployeeVO empVO = new EmployeeVO();
				empVO.setEmpno(empno);
				empVO.setEmpname(empname);
				empVO.setEmpemail(empemail);
				empVO.setPosition(position);

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
				empVO = empSvc.addEmp(empno, empname, empemail, position);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/employee/ExaminerTable.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/emp/addEmp.jsp");
				failureView.forward(req, res);
			}
		}
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer empno = new Integer(req.getParameter("empno"));

				/*************************** 2.開始刪除資料 ***************************************/
				EmployeeService empSvc = new EmployeeService();
				empSvc.deleteEmp(empno);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/employee/Emptable.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				//res.sendRedirect(res.encodeRedirectURL("url"));

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/employee/Emptable.jsp");
				failureView.forward(req, res);
				
				
				//res.sendRedirect(res.encodeRedirectURL("/employee/Emptable.jsp"));
			}
		}
		if ("delete1".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer empno = new Integer(req.getParameter("empno"));

				/*************************** 2.開始刪除資料 ***************************************/
				EmployeeService empSvc = new EmployeeService();
				empSvc.deleteEmp(empno);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/employee/Examiner.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/employee/Examiner.jsp");
				failureView.forward(req, res);
				
				
				
			}
		}


if ("update1".equals(action)) { // 來自update_emp_input.jsp的請求

			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer empno = new Integer(req.getParameter("empno").trim());
			//	Integer position = new Integer(req.getParameter("position").trim());				
				EmployeeVO empVO = new EmployeeVO();
				empVO.setEmpno(empno);
				int position = 0;
				empVO.setPosition(position);				
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("empVO", empVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/employee/update_emp_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				EmployeeService empSvc = new EmployeeService();
				//empVO = empSvc.updateEmp2( empno,position);
				empVO = empSvc.updateEmp2(empno,position);
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("employeeVO", empVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/employee/Examiner2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/employee/update_emp_input.jsp");
				failureView.forward(req, res);
			}
		}
if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
	
	List<String> errorMsgs = new LinkedList<String>();
	// Store this set in the request scope, in case we need to
	// send the ErrorPage view.
	req.setAttribute("errorMsgs", errorMsgs);

	try {
		/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
		Integer empno = new Integer(req.getParameter("empno").trim());
	//	Integer position = new Integer(req.getParameter("position").trim());				
		EmployeeVO empVO = new EmployeeVO();
		empVO.setEmpno(empno);
		int position = 1;
		empVO.setPosition(position);				
		
		// Send the use back to the form, if there were errors
		if (!errorMsgs.isEmpty()) {
			req.setAttribute("empVO", empVO); // 含有輸入格式錯誤的empVO物件,也存入req
			RequestDispatcher failureView = req
					.getRequestDispatcher("/employee/update_emp_input.jsp");
			failureView.forward(req, res);
			return; // 程式中斷
		}

		/*************************** 2.開始修改資料 *****************************************/
		EmployeeService empSvc = new EmployeeService();
		//empVO = empSvc.updateEmp2( empno,position);
		empVO = empSvc.updateEmp2(empno,position);
		/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
		req.setAttribute("employeeVO", empVO); // 資料庫update成功後,正確的的empVO物件,存入req
		String url = "/employee/Emptable2.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
		successView.forward(req, res);

		/*************************** 其他可能的錯誤處理 *************************************/
	} catch (Exception e) {
		errorMsgs.add("修改資料失敗:" + e.getMessage());
		RequestDispatcher failureView = req
				.getRequestDispatcher("/employee/update_emp_input.jsp");
		failureView.forward(req, res);
	}
}

	}
	
}
