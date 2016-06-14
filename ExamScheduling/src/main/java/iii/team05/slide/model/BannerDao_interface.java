package iii.team05.slide.model;

import java.util.List;

public interface BannerDao_interface {
	public void insert(BannerVO stvo);
    public void update(BannerVO stvo);

    public void delete(Integer slideid);
    public BannerVO findByPrimaryKey(String setid);
    public List<BannerVO> getAll();
	
}
