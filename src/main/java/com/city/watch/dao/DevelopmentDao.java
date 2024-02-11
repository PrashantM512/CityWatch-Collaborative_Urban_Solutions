package com.city.watch.dao;

import java.util.List;

import com.city.watch.entity.Development;

public interface DevelopmentDao {
        
	public boolean uploadDevelopment(Development dev);
	public List<Development> getAlldevelopments();
	public Development getDevelopmentById(int pid);
	public boolean updateDevelopmentById(int pid,Development dev);
	public boolean deleteDevelopmentById(int pid);
	
}
