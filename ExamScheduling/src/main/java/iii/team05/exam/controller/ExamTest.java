package iii.team05.exam.controller;



import iii.team05.exam.model.ExamDAO;
import iii.team05.exam.model.ExamDetailVO;
import iii.team05.exam.model.ExamVO;
import iii.team05.exam.model.OptionsVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ExamTest
 */
@WebServlet("/ExamTest")
public class ExamTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//testHibernateInsert(response);
		//testHibernateUpdate(response);
		//testHibernateDelete(response);
		testHibernateGetAll(response);
	}
	//新增
	private void testHibernateInsert(HttpServletResponse res)throws ServletException, IOException {
		//res.setContentType("text/html; charset=UTF-8");
		//PrintWriter out = res.getWriter();
		
		ExamDAO examDAO=new ExamDAO();
		ExamVO examVO = new ExamVO();
		Set<ExamDetailVO> examDetailSet = new HashSet<ExamDetailVO>();
		examVO.setExamDetils(examDetailSet);
		examVO.setExamno("Css1");
		examVO.setExamTitle("CSS quiz");
		examVO.setQuantities(2);
		examVO.setDuration(10);
		
		ExamDetailVO eDVO =new ExamDetailVO();
		Set<OptionsVO> optionsSet = new HashSet<OptionsVO>();
		eDVO.setOptions(optionsSet);
		eDVO.setQuestionType(0);
		eDVO.setQuestion("What does CSS stands for ?");
		eDVO.setExamno("Css1");
		eDVO.setExamVO(examVO);
		
		OptionsVO optionsVO =new OptionsVO();
		optionsVO.setOptionsno(1);
		optionsVO.setOptionsName("Cascaded simple Sheets");
		optionsVO.setIsAnswer(false);
		optionsVO.setExamDetail(eDVO);
		
		OptionsVO optionsVO2 =new OptionsVO();
		optionsVO2.setOptionsno(2);
		optionsVO2.setOptionsName("Cascaded Style Sheets");
		optionsVO2.setIsAnswer(true);
		optionsVO2.setExamDetail(eDVO);
		
		optionsSet.add(optionsVO);
		optionsSet.add(optionsVO2);
		
		examDetailSet.add(eDVO);
		
		examDAO.insert(examVO);
		
		
		
		
		
		
		
		
		
	}
	private void testHibernateUpdate(HttpServletResponse res)throws ServletException, IOException {
		ExamDAO examDAO=new ExamDAO();
		ExamVO examVO = new ExamVO();
		Set<ExamDetailVO> examDetailSet = new HashSet<ExamDetailVO>();
		examVO.setExamDetils(examDetailSet);
		examVO.setExamno("Css1");
		examVO.setExamTitle("CSS test");
		examVO.setQuantities(2);
		examVO.setDuration(10);
		
		ExamDetailVO eDVO =new ExamDetailVO();
		Set<OptionsVO> optionsSet = new HashSet<OptionsVO>();
		eDVO.setDetailno(8);
		eDVO.setOptions(optionsSet);
		eDVO.setQuestionType(0);
		eDVO.setQuestion("What does CSS stands for ?!?!");
		eDVO.setExamno("Css1");
		eDVO.setExamVO(examVO);
		
		OptionsVO optionsVO =new OptionsVO();
		optionsVO.setOptionsno(1);
		optionsVO.setOptionsName("Cascaded simple Sheets...");
		optionsVO.setIsAnswer(false);
		optionsVO.setExamDetail(eDVO);
		
		OptionsVO optionsVO2 =new OptionsVO();
		optionsVO2.setOptionsno(2);
		optionsVO2.setOptionsName("Cascaded Style Sheets...");
		optionsVO2.setIsAnswer(true);
		optionsVO2.setExamDetail(eDVO);
		
		optionsSet.add(optionsVO);
		optionsSet.add(optionsVO2);
		
		examDetailSet.add(eDVO);
		examDAO.update(examVO);
	}
	private void testHibernateDelete(HttpServletResponse res)throws ServletException, IOException {
		//res.setContentType("text/html; charset=UTF-8");
		//PrintWriter out = res.getWriter();
		
		ExamDAO examDAO=new ExamDAO();
		
	
		
		examDAO.delete("Css1");
	}
	private void testHibernateGetAll(HttpServletResponse res)throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		ExamDAO examDAO=new ExamDAO();
		List<ExamVO>list=examDAO.getAll();
		for(ExamVO eVO :list){
			out.println(eVO.getExamno()+" "+eVO.getExamTitle()+"<br/>");
			for(ExamDetailVO eDVO :eVO.getExamDetils()){
				out.println(eDVO.getQuestion()+"<br/>");
				for(OptionsVO optionVO :eDVO.getOptions()){
					out.println(optionVO.getOptionsName()+"<br/>");
				}
			}
		}
	
		
		
	}
}
