package iii.team05.exam.controller;

import iii.team05.exam.model.ExamDetailVO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ExamEdit
 */
@WebServlet("/ExamEdit")
public class ExamEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/WEB-INF/quiz_back/exam_edit.jsp");
		dispatcher.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String paramAry[]={"exam_name","examno","exam_explanation","quantity","numberOfQuestion",};
		
//		String exam_name=request.getParameter("exam_name");
//		String examno=request.getParameter("examno");
//		String exam_explanation=request.getParameter("exam_explanation");
//		String quantity=request.getParameter("quantity");
//		String numberOfQuestion=request.getParameter("numberOfQuestion");
		
		for(int i=0,max=paramAry.length;i<max;i++){
			System.out.print(paramAry[i]+":");
			System.out.println(request.getParameter(paramAry[i]));
		}
		List<ExamDetailVO>questionList=new ArrayList<ExamDetailVO>();
		for(int i=1,max=3;i<=max;i++){
			String tempTitle=request.getParameter("title"+i);
			System.out.println(tempTitle);
			String[]tempAry=request.getParameterValues("question1");
			for(int j=0;j<tempAry.length;j++){
				System.out.println(tempAry[i]);
			}
		}
		
		
		
		
	}

}
