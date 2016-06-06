package iii.team05.Employee.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import iii.team05.examinee.ecmodel.ECService;
import iii.team05.examinee.ecmodel.ESHibernateDAO;
import iii.team05.examinee.ecmodel.ESVO;
import iii.team05.examinee.ecmodel.ScoreService;
import iii.team05.examinee.ecmodel.ScoreVO;
import iii.team05.examinee.ecmodel.ScoreHibernateDAO;
import iii.team05.examinee.ecmodel.ECVO;
import iii.team05.examinee.ecmodel.ECHibernateDAO;
import iii.team05.section.model.SectionDAO;
import iii.team05.section.model.SectionVO;
import iii.team05.event.model.EventDAO;
import iii.team05.event.model.EventVO;

 @WebServlet("/sco/sco.do")
public class Student_select extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Student_select() {
        super();
         }
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
	 
		if ("score_Update".equals(action)) { // 從學生表格去搜尋分數
			
			List<String> errorMsgs = new LinkedList<String>();
		
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數****************************************/
				String ecno = new String(req.getParameter("ecno"));
				
				/***************************2.開始查詢資料****************************************/
				ScoreService empSvc = new ScoreService();
				ScoreVO scoreVO = empSvc.getOneEmp(ecno);
				req.setAttribute("scoreVO", scoreVO);      
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				//req.setAttribute("list", list);         // 資料庫取出的empVO物件,存入req
				String url = "/employee/score_listAllEmp.jsp";
				
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 score_listAllEmp.jsp
				System.out.print(successView);				
				successView.forward(req, res);				
		  		return;
				

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
			
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/employee/student_upd.jsp");
				failureView.forward(req, res);
			}
		}
		/***********************************分數修改**************************************/
			if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				
				String ecno = req.getParameter("ecno").trim();
				Integer lab = new Integer(req.getParameter("lab").trim());
				Integer interview = new Integer(req.getParameter("interview").trim());
				Integer onlineex = new Integer(req.getParameter("onlineex").trim());
				Integer labtime = new Integer(req.getParameter("labtime").trim());;	
				ScoreVO scoVO = new ScoreVO();
				scoVO.setEcno(ecno);
				scoVO.setLab(lab);
				scoVO.setInterview(interview);
				scoVO.setLabtime(labtime);
				scoVO.setOnlineex(onlineex);

			

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("scoVO", scoVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/employee/score_listAllEmp.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				ScoreService scorSvc = new ScoreService();
				
				
				scoVO = scorSvc.updateSco(ecno,lab, interview,labtime, onlineex);
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("scoreVO", scoVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/employee/calender.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/employee/score_listAllEmp.jsp");
				failureView.forward(req, res);
			}
		}

		
		
	}
}
