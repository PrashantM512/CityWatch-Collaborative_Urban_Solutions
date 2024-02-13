package com.city.watch.dao;

import java.util.List;
import java.util.Map;

public interface JobApplicationDao {
      public boolean applayForJob(int recruitmentId , int userId);
      public boolean getApplicationByRidAndUid(long recruitmentId , int userId);
      public List<Map<String, Object>> getJobApplicationsDetails();
      public boolean deleteJobApplicationById(int id);
      
} 
