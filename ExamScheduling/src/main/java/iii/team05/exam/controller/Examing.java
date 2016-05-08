package iii.team05.exam.controller;

import iii.team05.exam.model.ExamDetailVO;
import iii.team05.exam.model.OptionsVO;

import java.io.IOException;
import java.util.List;
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

		String currentQuestionByParameter = request
				.getParameter("currentQuestion");

		if (currentQuestionByParameter == null) {

			initExam(session, request);
			request.getRequestDispatcher("/WEB-INF/quiz_front/exam.jsp")
					.forward(request, response);
		} else {
			
			questionToJSON(session, response, Integer.parseInt(currentQuestionByParameter));
		}

	}

	public void initExam(HttpSession session, HttpServletRequest request) {
		ServletContext context = getServletContext();
		// String examno=(String)session.getAttribute("examno");
		// 測試用
		String examno = "Java1";
		List<ExamDetailVO> questionList = (List<ExamDetailVO>) context
				.getAttribute(examno);
		ExamDetailVO question = questionList.get(1);
		request.setAttribute("title", question.getQuestion());
		//Set<OptionsVO> options = question.getOptions();

		request.setAttribute("options", question.getOptions());

		session.setAttribute("currentQuestion", 1);

	}
	public void questionToJSON(HttpSession session,HttpServletResponse response,int currentQuestion) throws IOException{
		ServletContext context = getServletContext();
		// String examno=(String)session.getAttribute("examno");
		String examno = "Java1";
		List<ExamDetailVO> questionList = (List<ExamDetailVO>) context
				.getAttribute(examno);
		ExamDetailVO question = questionList.get(currentQuestion-1);
	
		Set<OptionsVO> options = question.getOptions();
		JSONArray array=new JSONArray();
		 JSONObject obj = new JSONObject();
		 obj.put("title", question.getQuestion());
		 int cnt=1;
		 for(OptionsVO option:options){
			 obj.put("option"+cnt++, option.getOptionsName());
		 }
		 response.getWriter().print(obj);
		// array.put(obj);
		 
	}

}
