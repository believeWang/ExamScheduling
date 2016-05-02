package iii.team05.examinee.ecmodel;

import java.util.List;

public interface ScoreDao_interface {
	public void insert(ScoreVO scoreVO);
    public void update(ScoreVO scoreVO);
    public void delete(String ecno);
    public ScoreVO findByPrimaryKey(String ecno);
    public List<ScoreVO> getAll();
}
