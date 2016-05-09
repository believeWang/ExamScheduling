package iii.team05.exam.model;

import iii.team05.exam.model.ExamDetailVO;
import iii.team05.exam.model.ExamService;
import iii.team05.exam.model.ExamVO;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListener implements ServletContextListener {
	

	@Override
	public void contextDestroyed(ServletContextEvent event) {
	
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		
		ServletContext context=event.getServletContext();
		 ExamService service =new ExamService();
		 List<ExamVO>exams=service.getAll();
		 for(ExamVO exam:exams){
			 List<ExamDetailVO>questionList=new ArrayList<ExamDetailVO>();
			 questionList.addAll(exam.getExamDetils());
			 context.setAttribute(exam.getExamno(), questionList);
		 }
		
	}

}
