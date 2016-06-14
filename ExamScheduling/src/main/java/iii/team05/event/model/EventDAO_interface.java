package iii.team05.event.model;


import java.sql.Timestamp;
import java.util.*;

import iii.team05.event.model.EventVO;

public interface EventDAO_interface {
	      public void insert(EventVO eventVO);  //新增
          public void update(EventVO eventVO);  //修改
          public void delete(Integer eventid);  //刪除
          public EventVO findByPrimaryKey(Integer eventid);  //查詢一筆
	      public List<EventVO> getAll();  //查詢ALL
	      public List<EventVO> getAll_score();
	      public List<EventVO> getEmpEvent(Integer empno);
		 
	    

	      
}
