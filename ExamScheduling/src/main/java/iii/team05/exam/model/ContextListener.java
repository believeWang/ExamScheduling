package iii.team05.exam.model;


import iii.team05.exam.model.ExamService;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListener implements ServletContextListener {
	

	@Override
	public void contextDestroyed(ServletContextEvent event) {
	
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		//把每一個考試都放到Context的屬性中
		
		new ExamService().putAllExamToContex(event.getServletContext());
		 
		
	}
	


}
