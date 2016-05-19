package iii.team05.exam.controller;

import iii.team05.exam.model.ExamDetailVO;
import iii.team05.exam.model.ExamService;
import iii.team05.exam.model.OptionsVO;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ExamResult
 */
@WebServlet("/ExamResult")
public class ExamResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//檢查答案
		new ExamService().checkAnswer(request,getServletContext());

		request.getRequestDispatcher("/WEB-INF/quiz_front/result.jsp").forward(
				request, response);

	}

	

	
}
