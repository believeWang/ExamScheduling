package iii.team05.Event.model;

import java.util.*;
import iii.team05.Event.model.EventVO;

public interface EventDAO_interface {
	      public void insert(EventVO eventVO);  //新增
          public void update(EventVO eventVO);  //修改
          public void delete(Integer eventid);  //刪除
          public EventVO findByPrimaryKey(Integer eventid);  //查詢一筆
	      public List<EventVO> getAll();  //查詢ALL
	      
}
