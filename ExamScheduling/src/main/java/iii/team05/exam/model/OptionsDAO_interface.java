package iii.team05.exam.model;



import java.util.List;

public interface OptionsDAO_interface {
	public void insert(OptionsVO optionsVO);
    public void update(OptionsVO optionsVO);
    public void delete(String optionsno);
    public OptionsVO findByPrimaryKey(String optionsno);
    public List<OptionsVO> getAll();
}
