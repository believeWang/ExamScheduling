package iii.team05.exam.model;

public class OptionsVO implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private int optionsno;
	private String optionsName;
	private Boolean isAnswer;
	private Integer detailno;
	private ExamDetailVO examDetail;
	private ExamVO examVO;
	public ExamDetailVO getExamDetail() {
		return examDetail;
	}
	public void setExamDetail(ExamDetailVO examDetail) {
		this.examDetail = examDetail;
	}
	public int getOptionsno() {
		return optionsno;
	}
	public void setOptionsno(int optionsno) {
		this.optionsno = optionsno;
	}
	public String getOptionsName() {
		return optionsName;
	}
	public void setOptionsName(String optionsName) {
		this.optionsName = optionsName;
	}
	public Boolean getIsAnswer() {
		return isAnswer;
	}
	public void setIsAnswer(Boolean isAnswer) {
		this.isAnswer = isAnswer;
	}
	public Integer getDetailno() {
		return detailno;
	}
	public void setDetailno(Integer detailno) {
		this.detailno = detailno;
	}
	@Override
	public String toString(){
		String str="optionsName:"+optionsName+" isAnswer:"+isAnswer;
		
				
		return str;
	}
	public ExamVO getExamVO() {
		return examVO;
	}
	public void setExamVO(ExamVO examVO) {
		this.examVO = examVO;
	}

}
