package iii.team05.Section.model;

import java.util.*;
import iii.team05.Event.model.EventVO;

public interface SectionDAO_interface {
	      public void insert(SectionVO sectionVO);  //新增
          public void update(SectionVO sectionVO);  //修改
          public void delete(java.sql.Time sectiontime);  //刪除
          public SectionVO findByPrimaryKey(java.sql.Time sectiontime);  //查詢一筆
	      public List<SectionVO> getAll();  //查詢ALL
	      
}
