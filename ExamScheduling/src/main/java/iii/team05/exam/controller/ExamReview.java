package iii.team05.exam.controller;

import iii.team05.exam.model.ExamDetailVO;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ExamReview
 */
@WebServlet("/ExamReview")
public class ExamReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		initReview(request);
		request.getRequestDispatcher("/WEB-INF/quiz_front/examReview.jsp")
				.forward(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	private void initReview(HttpServletRequest request) {
		String examno = (String) request.getSession().getAttribute("examno");
		// 測試用
		// String examno = "Java1";
		
		//題目放到request屬性中
		@SuppressWarnings("unchecked")
		List<ExamDetailVO> questionList = (List<ExamDetailVO>) request
				.getServletContext().getAttribute(examno);
		request.setAttribute("questionList", questionList);
		// for test
		// Map<Long,boolean []>answerMap=( Map<Long,boolean []>)
		// request.getSession().getAttribute("answerMap");
		// System.out.println(answerMap.keySet().toString());
		// for(boolean [] ary:answerMap.values()){
		//
		// for(boolean b:ary){
		// System.out.print(b+" ");
		// }
		// System.out.println("---");
		// }

	}
}
