package iii.team05.exam.controller;

import iii.team05.exam.model.ExamDetailVO;
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

		checkAnswer(request);

		request.getRequestDispatcher("/WEB-INF/quiz_front/result.jsp").forward(
				request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	public void checkAnswer(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ServletContext context = getServletContext();
		@SuppressWarnings("unchecked")
		Map<Long, boolean[]> answerMap = (Map<Long, boolean[]>) session
				.getAttribute("answerMap");

		String examno = (String) session.getAttribute("examno");
		// 測試用
		if (examno == null) {
			examno = "Java1";
		}
		@SuppressWarnings("unchecked")
		List<ExamDetailVO> questionList = (List<ExamDetailVO>) context
				.getAttribute(examno);
		int rightCnt = 0;
		// for(ExamDetailVO questions:questionList){
		for (int i = 0, size = questionList.size(); i < size; i++) {
			ExamDetailVO questions = questionList.get(i);
			String rightAnswer = "";
			for (OptionsVO options : questions.getOptions()) {
				rightAnswer += options.getIsAnswer();
			}
			//System.out.print(rightAnswer+" ");
			String studentAnswer = "";

		
			//System.out.println("answerMapget" + answerMap.get(new Long(i)));

				//如果沒寫這題  為空NULL
			if (answerMap.get(new Long(i)) != null) {
				for (Boolean bo : answerMap.get(new Long(i))) {

					studentAnswer += bo.toString();
				}
				if (rightAnswer.equals(studentAnswer))
					rightCnt++;
			}
			//System.out.println(studentAnswer);
			// System.out.println("-------------");
		}
		request.setAttribute("rightCnt", rightCnt);

	}

}
