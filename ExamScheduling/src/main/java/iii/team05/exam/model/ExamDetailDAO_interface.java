package iii.team05.exam.model;



import java.util.List;

public interface ExamDetailDAO_interface {
	public void insert(ExamDetailVO examDetailVO);
    public void update(ExamDetailVO examDetailVO);
    public void delete(String detailno);
    public ExamDetailVO findByPrimaryKey(String detailno);
    public List<ExamDetailVO> getAll();
}
