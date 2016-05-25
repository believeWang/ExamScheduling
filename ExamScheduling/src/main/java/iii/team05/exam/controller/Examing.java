package iii.team05.exam.controller;

import iii.team05.exam.model.ExamService;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Exam
 */
@WebServlet("/Examing")
public class Examing extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		ExamService service =new ExamService();
		HttpSession session = request.getSession();
		//如果寫完
		String isFinished=(String) session.getAttribute("status");
		if("finished".equals(isFinished)){
			response.sendRedirect("ExamResult");
			return;
		}
			
		// 下一個題號
		String targetQuestion = request.getParameter("targetQuestion");
		// 現在的題號
		String currentQuestion = request.getParameter("currentQuestion");
		// 選擇的選項
	
		String[] selected = request.getParameterValues("selected[]");
		// if(selected!=null)
		// System.out.println("currentQuestion:"+currentQuestion+",selected"+selected[0]+","+selected.length);
		// else
		// System.out.println("currentQuestion:"+currentQuestion+",selected:null");

		// 如果沒有下一個題號
		if (targetQuestion == null) {
			// 如果有現在的題號跟選項
			if (currentQuestion != null) {

				

				// 這題沒寫就不做事情
				if (selected != null)
					// 結束 按下FINALL 有寫
					service.putAnswerToList(session, Integer.parseInt(currentQuestion),
							selected);
				response.sendRedirect("ExamResult");
			
			} else {
				// 初始第一次進來
				service.initExam(session, request,getServletContext(),response);
				request.getRequestDispatcher("/WEB-INF/quiz_front/exam.jsp")
						.forward(request, response);
			}

		} else {
			// System.out.println("selected"+selected);
			// 正常有寫的狀況
			if (selected != null && currentQuestion != null) {
				// System.out.println("put"+(currentQuestion)+","+(selected));
				service.putAnswerToList(session, Integer.parseInt(currentQuestion),
						selected);
			}
			service.questionToJSON(session, response, Integer.parseInt(targetQuestion),getServletContext());
		}

	}

	
}
