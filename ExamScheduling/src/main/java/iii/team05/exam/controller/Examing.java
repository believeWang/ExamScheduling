package iii.team05.exam.controller;

import iii.team05.exam.model.ExamDetailVO;
import iii.team05.exam.model.OptionsVO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

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
		HttpSession session = request.getSession();
		// 下一個題號
		String targetQuestion = request.getParameter("targetQuestion");
		// 現在的題號
		String currentQuestion = request.getParameter("currentQuestion");
		// 選擇的選項
		// String selected = request
		// .getParameter("selected[]");
		String[] selected = request.getParameterValues("selected[]");
		// if(selected!=null)
		// System.out.println("currentQuestion:"+currentQuestion+",selected"+selected[0]+","+selected.length);
		// else
		// System.out.println("currentQuestion:"+currentQuestion+",selected:null");

		// 如果沒有下一個題號
		if (targetQuestion == null) {
			// 如果有現在的題號跟選項
			if (currentQuestion != null) {

				// System.out.println("selected"+selected);

				// 這題沒寫就不做事情
				if (selected != null)
					// 結束 按下FINALL 有寫
					putAnswerToList(session, Integer.parseInt(currentQuestion),
							selected);

				request.getRequestDispatcher("/ExamResult").forward(request,
						response);
			} else {
				// 初始第一次進來
				initExam(session, request);
				request.getRequestDispatcher("/WEB-INF/quiz_front/exam.jsp")
						.forward(request, response);
			}

		} else {
			// System.out.println("selected"+selected);
			// 正常有寫的狀況
			if (selected != null && currentQuestion != null) {
				// System.out.println("put"+(currentQuestion)+","+(selected));
				putAnswerToList(session, Integer.parseInt(currentQuestion),
						selected);
			}
			questionToJSON(session, response, Integer.parseInt(targetQuestion));
		}

	}

	// 初始化
	public void initExam(HttpSession session, HttpServletRequest request) {
		ServletContext context = getServletContext();
		// 取得選擇得考試
		// String examno=(String)session.getAttribute("examno");
		// 測試用
		String examno = "Java1";

		// 考題列表
		@SuppressWarnings("unchecked")
		List<ExamDetailVO> questionList = (List<ExamDetailVO>) context
				.getAttribute(examno);

		// 第幾題
		ExamDetailVO question = questionList.get(0);

		// 題名
		request.setAttribute("title", question.getQuestion());
		// System.out.println(request.getAttribute("title"));

		// 題型
		request.setAttribute("questionType", question.getQuestionType());

		// 各選項

		Set<OptionsVO> optionsSet = question.getOptions();
		String[] options = new String[optionsSet.size()];
		int index = 0;
		for (OptionsVO option : optionsSet)
			options[index++] = option.getOptionsName();
		request.setAttribute("options", toJavascriptArray(options));

		// 考生答案
		Map<Long, boolean[]> answerMap = new HashMap<Long, boolean[]>();
		session.setAttribute("answerMap", answerMap);
		session.setAttribute("currentQuestion", 1);

	}

	public void questionToJSON(HttpSession session,
			HttpServletResponse response, int targetQuestion)
			throws IOException {
		ServletContext context = getServletContext();
		// String examno=(String)session.getAttribute("examno");
		String examno = "Java1";
		@SuppressWarnings("unchecked")
		List<ExamDetailVO> questionList = (List<ExamDetailVO>) context
				.getAttribute(examno);
		ExamDetailVO question = questionList.get(targetQuestion - 1);

		Set<OptionsVO> options = question.getOptions();

		JSONObject obj = new JSONObject();
		obj.put("title", question.getQuestion());
		int cnt = 1;
		for (OptionsVO option : options) {
			obj.put("option" + cnt++, option.getOptionsName());
		}
		obj.put("questionType", question.getQuestionType());
		response.getWriter().print(obj);
		// array.put(obj);

	}

	public void putAnswerToList(HttpSession session, int currentQuestion,
			String[] selected) {

		@SuppressWarnings("unchecked")
		Map<Long, boolean[]> answerMap = (Map<Long, boolean[]>) session
				.getAttribute("answerMap");
		boolean[] options = new boolean[4];
		for (int i = 0; i < 4; i++) {

			options[i] = false;
		}

		for (int i = 0, max = selected.length; i < max; i++) {
			options[Integer.parseInt(selected[i]) - 1] = true;
		}
		answerMap.put(currentQuestion - 1l, options);
		session.setAttribute("answerMap", answerMap);

		// test
		// for(int i=0;i<4;i++){
		//
		// System.out.println(i+":"+options[i]);
		// }

	}

	public static String toJavascriptArray(String[] arr) {
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for (int i = 0; i < arr.length; i++) {
			sb.append("\"").append(arr[i]).append("\"");
			if (i + 1 < arr.length) {
				sb.append(",");
			}
		}
		sb.append("]");
		return sb.toString();
	}

}
