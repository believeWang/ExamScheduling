package iii.team05.exam.controller;

import iii.team05.exam.model.ExamService;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ExamList
 */
@WebServlet("/ExamList")
public class ExamList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
		
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/WEB-INF/quiz_back/exam_list.jsp");
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String examno=request.getParameter("examno");
		ExamService service=new ExamService();
		
		service.deleteExam(examno);
		new ExamService().putAllExamToContex(getServletContext());
	}

}
