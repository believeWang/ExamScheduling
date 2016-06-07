package iii.team05.exam.controller;

import iii.team05.exam.model.ExamDetailVO;
import iii.team05.exam.model.ExamService;
import iii.team05.exam.model.ExamVO;
import iii.team05.exam.model.OptionsVO;

import java.io.IOException;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.poi.util.IOUtils;

/**
 * Servlet implementation class ExamEdit
 */
@WebServlet("/ExamEdit")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)   // 50MB
public class ExamEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding( "UTF-8" );
		String editno=request.getParameter("editno");
	
		if(editno!=null&&editno.trim().length()!=0){
			ExamService service=new ExamService();
			@SuppressWarnings("unchecked")
			Map<String,ExamVO>allExams=(Map<String, ExamVO>) getServletContext().getAttribute("allExams");
			ExamVO examVO=allExams.get(editno);
			@SuppressWarnings("unchecked")
			List<ExamDetailVO> questionList = (List<ExamDetailVO>) getServletContext()
					.getAttribute(editno);
			request.setAttribute("editMode", true);
			request.setAttribute("examVO", examVO);
			request.setAttribute("questionList", questionList);
		
		}
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/WEB-INF/quiz_back/exam_edit.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding( "UTF-8" );
		String userExamno=request.getParameter("userExamno");
	
		ExamService service=new ExamService();
		if(userExamno!=null&&userExamno.trim().length()!=0){
			ExamVO examvo= service.getExam(userExamno);
			
			if(examvo!=null){
			
				response.getWriter().write("false");;
			}else{
				
				response.getWriter().write("true");;
			}
		}else{
			putParameterInExamVO(request,service);
			response.sendRedirect("ExamList");
		}

		

	}

	public void putParameterInExamVO(HttpServletRequest request,ExamService service) throws IOException, ServletException {
		// String
		// paramAry[]={"exam_name","examno","exam_explanation","quantity","numberOfQuestion"};
		// for(int i=0,max=paramAry.length;i<max;i++){
		// System.out.print(paramAry[i]+":");
		// System.out.println(request.getParameter(paramAry[i]));
		// }
		ExamVO examVO = new ExamVO();
		String exam_name = request.getParameter("exam_name");
		String examno = request.getParameter("examno");
		Integer duration = Integer.valueOf(request.getParameter("duration"));
		Integer numberOfQuestion = Integer.valueOf(request
				.getParameter("numberOfQuestion"));
	
		Part filePart = request.getPart("image"); // Retrieves <input type="file"	
	
		examVO.setExamTitle(exam_name);
		examVO.setExamno(examno);
		examVO.setDuration(duration);
		examVO.setExamTitle(exam_name);
		if(filePart!=null&&filePart.getSize()!=0)		
			examVO.setExamImg(IOUtils.toByteArray(filePart.getInputStream()));
		else{
			System.out.println(examVO.getExamno());
			ExamVO oldVO=service.getExam(examVO.getExamno());
			if(oldVO!=null&&oldVO.getExamImg()!=null)
				examVO.setExamImg(oldVO.getExamImg());
		}
		
			
		
	
		
		
		Set<ExamDetailVO> questions = new HashSet<ExamDetailVO>();
		ExamDetailVO examDetailVO = null;
		int realNum=0;
		for (int i = 1, max = numberOfQuestion; i <= max; i++) {
			examDetailVO = new ExamDetailVO();

			String tempTitle = request.getParameter("title" + i);
			if(tempTitle==null)continue;
			realNum++;
			Integer questionType = Integer.valueOf(request
					.getParameter("questiontype" + i));
			examDetailVO.setDetailno(realNum);
			examDetailVO.setQuestion(tempTitle);
			System.out.println(tempTitle);
			examDetailVO.setQuestionType(questionType);
			examDetailVO.setExamVO(examVO);

			Set<OptionsVO> options = new HashSet<OptionsVO>();
			OptionsVO option = null;
			String[] valueAry = request.getParameterValues("question" + i);
			String[] whichIsTrue = request.getParameterValues("group" + i);

			for (int j = 0; j < valueAry.length; j++) {
				option = new OptionsVO();
				option.setOptionsno(j);
				option.setOptionsName(valueAry[j]);
				option.setExamDetail(examDetailVO);
				option.setIsAnswer(false);
				if(whichIsTrue==null){
					options.add(option);
					continue;
				}
				for (int k = 0, maxK = whichIsTrue.length; k < maxK; k++) {
					
					if (whichIsTrue[k].equals("" + (j + 1))) {
						option.setIsAnswer(true);
						break;
					}
				}
				options.add(option);

			}
			examDetailVO.setOptions(options);
			questions.add(examDetailVO);
		}
		examVO.setQuantities(realNum);
		examVO.setExamDetils(questions);
		service.insetExam(examVO);
		new ExamService().putAllExamToContex(getServletContext());
	//	 System.out.println(examVO);

	}

}
