package iii.team05.examinee.ecmodel;

import java.util.List;

public interface ECDao_interface {
	public void insert(ECVO examineeCatVO);
    public void update(ECVO examineeCatVO);
    public void delete(String ecno);
    public ECVO findByPrimaryKey(String ecno);
    public List<ECVO> getAll();
}
