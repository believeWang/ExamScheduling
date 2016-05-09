package iii.team05.Job.model;

import java.util.*;
import iii.team05.Event.model.EventVO;

public interface JobDAO_interface {
	      public void insert(JobVO jobVO);  //新增
          public void update(JobVO jobVO);  //修改
          public void delete(Integer jobid);  //刪除
          public JobVO findByPrimaryKey(Integer jobid);  //查詢一筆
	      public List<JobVO> getAll();  //查詢ALL
	      
}
