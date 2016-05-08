package iii.team05.exam.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ExamService {
	ExamDAO examDAO;

	public ExamService() {
		examDAO = new ExamDAO();
	}
    public ExamVO getExam(String examno){
    	return examDAO.findByPrimaryKey(examno);
    }
	
	public void putExamDetailInRequest(String examno, HttpServletRequest request) {
		HttpSession session=request.getSession();
		ExamVO examVO = examDAO.findByPrimaryKey(examno);
		session.setAttribute("examno", examno);
		session.setAttribute("examtitle", examVO.getExamTitle());
		session.setAttribute("totalNumberOfQuizQuestions",
				examVO.getQuantities());
		session.setAttribute("quizDuration", examVO.getDuration());
		session.setAttribute("min", examVO.getDuration());
		session.setAttribute("sec", 0);

	}


}
