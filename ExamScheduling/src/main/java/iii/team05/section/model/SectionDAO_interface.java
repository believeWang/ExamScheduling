package iii.team05.section.model;

import java.util.*;

public interface SectionDAO_interface {
	      public void insert(SectionVO sectionVO);  //新增
          public void update(SectionVO sectionVO);  //修改
          public void delete(Integer sectionid);  //刪除
          public SectionVO findByPrimaryKey(Integer sectionid);  //查詢一筆
	      public List<SectionVO> getAll();  //查詢ALL
	      
}
