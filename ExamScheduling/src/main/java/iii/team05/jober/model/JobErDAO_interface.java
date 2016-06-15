package iii.team05.jober.model;

import java.util.*;

public interface JobErDAO_interface {
	      public void insert(JobErVO jobVO);  //新增
          public void update(JobErVO jobVO);  //修改
          public void delete(Integer jobid) ;  //刪除
          public JobErVO findByPrimaryKey(Integer jobid);  //查詢一筆
	      public List<JobErVO> getAll();  //查詢ALL
	      
}
