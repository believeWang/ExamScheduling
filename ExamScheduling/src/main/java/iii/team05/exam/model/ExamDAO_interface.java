package iii.team05.exam.model;



import java.util.List;

public interface ExamDAO_interface {
	public void insert(ExamVO examVO);
    public void update(ExamVO examVO);
    public void delete(String examno);
    public ExamVO findByPrimaryKey(String examno);
    public List<ExamVO> getAll();
}
