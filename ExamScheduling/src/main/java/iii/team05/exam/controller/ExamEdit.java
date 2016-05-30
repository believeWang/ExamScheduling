package iii.team05.exam.controller;

import iii.team05.exam.model.ExamDetailVO;
import iii.team05.exam.model.ExamService;
import iii.team05.exam.model.ExamVO;
import iii.team05.exam.model.OptionsVO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
		
		putParameterInExamVO(request);
		
		
		
	}
	public void putParameterInExamVO(HttpServletRequest request){
//		String paramAry[]={"exam_name","examno","exam_explanation","quantity","numberOfQuestion"};
//		for(int i=0,max=paramAry.length;i<max;i++){
//			System.out.print(paramAry[i]+":");
//			System.out.println(request.getParameter(paramAry[i]));
//		}
		ExamVO examVO=new ExamVO();
		String exam_name=request.getParameter("exam_name");
		String examno=request.getParameter("examno");
		Integer duration=Integer.valueOf(request.getParameter("duration"));
		Integer numberOfQuestion=Integer.valueOf(request.getParameter("numberOfQuestion"));
		
		
		examVO.setExamTitle(exam_name);	
		examVO.setExamno(examno);
		examVO.setDuration(duration);;	
		examVO.setExamTitle(exam_name);	
		examVO.setQuantities(numberOfQuestion);
		
		Set<ExamDetailVO>questions=new HashSet<ExamDetailVO>();
		ExamDetailVO examDetailVO=null;
		
		
		
		for(int i=1,max=numberOfQuestion;i<=max;i++){
			examDetailVO=new ExamDetailVO();
			
			String tempTitle=request.getParameter("title"+i);
			Integer questionType=Integer.valueOf(request.getParameter("questiontype"+i));

			examDetailVO.setQuestion(tempTitle);
			examDetailVO.setQuestionType(questionType);
			examDetailVO.setExamVO(examVO);
			
			Set<OptionsVO>options=new HashSet<OptionsVO>();
			OptionsVO option =null;
			String[]valueAry=request.getParameterValues("question"+i);
			String[] whichIsTrue=request.getParameterValues("type"+i);
			
			for(int j=0;j<valueAry.length;j++){
				//System.out.println("j:"+valueAry[j]);
				option=new OptionsVO();
				option.setOptionsno(j);
				
				option.setOptionsName(valueAry[j]);
				option.setExamDetail(examDetailVO);
				option.setIsAnswer(false);
				for(int k=0,maxK=whichIsTrue.length;k<maxK;k++){
					if(whichIsTrue[k].equals(""+(j+1))){
						option.setIsAnswer(true);
						break;
					}
				}
				options.add(option);
				
			}
			examDetailVO.setOptions(options);
			questions.add(examDetailVO);
		}
		examVO.setExamDetils(questions);
		new ExamService().insetExam(examVO);
		//System.out.println(examVO);
	}

}
