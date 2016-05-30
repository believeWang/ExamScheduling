package iii.team05.abouteditor;

import java.util.List;

public interface AbouteditorInterface {
	public void insert(AbouteditorVO abouteditorVO);
	public void update(AbouteditorVO abouteditorVO);
	public void delete(Integer abouteditorVO);
	public AbouteditorVO findByPrimaryKey(Integer aboutid);
	public List<AbouteditorVO> getAll();
}
