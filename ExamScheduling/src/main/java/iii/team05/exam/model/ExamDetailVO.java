package iii.team05.exam.model;

import java.util.LinkedHashSet;
import java.util.Set;

public class ExamDetailVO implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer detailno;
	private Integer questionType;
	private String question;
	private String examno;
	private ExamVO examVO;
	private Set<OptionsVO> options = new LinkedHashSet<OptionsVO>();
	
	
	public ExamVO getExamVO() {
		return examVO;
	}
	public void setExamVO(ExamVO examVO) {
		this.examVO = examVO;
	}
	public Set<OptionsVO> getOptions() {
		return options;
	}
	public void setOptions(Set<OptionsVO> options) {
		this.options = options;
	}
	public Integer getDetailno() {
		return detailno;
	}
	public void setDetailno(Integer detailno) {
		this.detailno = detailno;
	}
	public Integer getQuestionType() {
		return questionType;
	}
	public void setQuestionType(Integer questionType) {
		this.questionType = questionType;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getExamno() {
		return examno;
	}
	public void setExamno(String examno) {
		this.examno = examno;
	}
	@Override
	public String toString(){
		String str="\nquestionType:"+questionType+" question:"+question;
		str+="{"+options+"}";
				
		return str;
	}

}
