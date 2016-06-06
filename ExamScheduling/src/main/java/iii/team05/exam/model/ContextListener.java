package iii.team05.exam.model;

import iii.team05.exam.model.ExamDetailVO;
import iii.team05.exam.model.ExamService;
import iii.team05.exam.model.ExamVO;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListener implements ServletContextListener {
	

	@Override
	public void contextDestroyed(ServletContextEvent event) {
	
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		//把每一個考試都放到Context的屬性中
		ServletContext context=event.getServletContext();
		 ExamService service =new ExamService();
		 List<ExamVO>exams=service.getAll();
		 Map<String,String>examsMap=new HashMap<String, String>();
		 
		 for(ExamVO exam:exams){
			 examsMap.put(exam.getExamno(), byteTobase64(exam.getExamImg()));
			 List<ExamDetailVO>questionList=new ArrayList<ExamDetailVO>();
			 questionList.addAll(exam.getExamDetils());
			 context.setAttribute(exam.getExamno(), questionList);
		 }
		 context.setAttribute("examsMap", examsMap);
		
	}
	private String byteTobase64(byte[] imageByteArray){
		if(imageByteArray==null)return null;
		StringBuilder sb = new StringBuilder();
		sb.append("data:image/png;base64,");
		
		try {
			sb.append(new String(Base64.getEncoder().encode(imageByteArray),"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		return sb.toString();
	}

}
