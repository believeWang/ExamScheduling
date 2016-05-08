package iii.team05.exam.controller;

import iii.team05.exam.model.ExamDetailVO;
import iii.team05.exam.model.ExamService;
import iii.team05.exam.model.ExamVO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		String currentQuestionByParameter=request.getParameter("currentQuestion");
	

		if(currentQuestionByParameter==null){
			System.out.println("init");
			initExam(session);
			
		}else if(currentQuestionByParameter!=null){
			System.out.println("currentQuestion"+currentQuestionByParameter);
			session.setAttribute("currentQuestion",Integer.parseInt( currentQuestionByParameter));
			
		}
	
		request.getRequestDispatcher("/WEB-INF/quiz_front/exam.jsp").forward(request,response);
		
		
	}
	public void initExam(HttpSession session){
		// String examno=(String)session.getAttribute("examno");
		//測試用
		String examno="Java1";
		 ExamService service =new ExamService();
		 ExamVO examVO=service.getExam(examno);
	//測試用
		 session.setAttribute("totalNumberOfQuizQuestions",
					examVO.getQuantities());
		 List<ExamDetailVO> questionAry=new ArrayList<ExamDetailVO>();
		 questionAry.addAll( examVO.getExamDetils());
		
		 session.setAttribute("questionAry", questionAry);
		 session.setAttribute("currentQuestion", 0);
		 
		 
		
	}

}
