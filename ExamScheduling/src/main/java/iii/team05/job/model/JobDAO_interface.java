package iii.team05.job.model;

import java.util.*;

public interface JobDAO_interface {
	      public void insert(JobVO jobVO);  //新增
          public void update(JobVO jobVO);  //修改
          public void delete(Integer jobid);  //刪除
          public JobVO findByPrimaryKey(Integer jobid);  //查詢一筆
	      public List<JobVO> getAll();  //查詢ALL
	      public int insert_return_id(JobVO jobVO);  //新增
	      public void delete_VO(JobVO jobVO);
}
