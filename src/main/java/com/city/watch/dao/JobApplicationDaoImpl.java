package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JobApplicationDaoImpl implements JobApplicationDao{
	private Connection conn;
	
	public JobApplicationDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean applayForJob(int recruitmentId, int userId) {
		boolean f=false;
		try {
			String query="INSERT INTO job_applications(recruitmentId, userId) VALUES(?,?)";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, recruitmentId);
			stmt.setInt(2, userId);
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	

}
