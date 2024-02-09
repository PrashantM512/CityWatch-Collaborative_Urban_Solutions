package com.city.watch.dao;

import java.util.List;
import java.util.Map;

import com.city.watch.entity.Issue;

public interface IssueDao {
    
	public boolean addIssue(Issue issue);
	public List<Map<String, Object>> getPublicIssues();
	public List<Issue> getIssuesByUserId(int userId);
	
}
