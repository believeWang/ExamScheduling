package iii.team05.exam.controller;

import iii.team05.exam.model.ExamService;
import iii.team05.exam.model.ExamVO;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.w3c.dom.Document;

/**
 * Servlet implementation class TakeExam
 */
@WebServlet("/TakeExam")
public class TakeExam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ExamService examService = new ExamService();

		// 取得考試科目名稱
		String examno = request.getParameter("test");

		// 查看是否登入
		// System.out.println(request.getSession().getAttribute("ecno"));

		// response.sendRedirect("/login");

		// 抓到考試科目細節
		examService.putExamDetailInRequest(examno, request);

		//轉交到jsp顯示
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/WEB-INF/quiz_front/quizDetails.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
