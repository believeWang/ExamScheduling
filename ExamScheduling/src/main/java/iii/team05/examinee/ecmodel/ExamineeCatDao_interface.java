package iii.team05.examinee.ecmodel;

import java.util.List;

public interface ExamineeCatDao_interface {
	public void insert(ExamineeCatVO examineecatVO);
    public void update(ExamineeCatVO examineecatVO);
    public void delete(String ecno);
    public ExamineeCatVO findByPrimaryKey(String ecno);
    public List<ExamineeCatVO> getAll();
}
