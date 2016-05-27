package iii.team05.setting.model;

import java.util.List;

public interface STDao_interface {
	public void insert(STVO stvo);
    public void update(STVO stvo);
    public void delete(String setid);
    public STVO findByPrimaryKey(String setid);
    public List<STVO> getAll();

}
