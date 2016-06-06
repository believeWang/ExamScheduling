package iii.team05.examinee.ecmodel;

import java.util.List;

public interface ESDao_interface {
	public void insert(ESVO examineeSubVO);
    public void update(ESVO examineeSubVO);
    public void delete(String ecno);
    public ESVO findByPrimaryKey(String ecno);
    public List<ESVO> getAll();
}
