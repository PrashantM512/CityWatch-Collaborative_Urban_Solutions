package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public boolean getApplicationByRidAndUid(long recruitmentId, int userId) {
		boolean f=false;
		try {
			String query="SELECT * FROM job_applications WHERE recruitmentId=? AND userId=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setLong(1, recruitmentId);
			stmt.setInt(2, userId);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	@Override
	public List<Map<String, Object>> getJobApplicationsDetails() {
	    List<Map<String, Object>> jobApplicationsDetails = new ArrayList<>();

	    String query = "SELECT u.name, u.mobile, u.gender, u.address, u.cv, " +
	               "r.job_title, r.description, r.criteria, r.cv_need, " +
	               "ja.applicationDate, ja.applicationId " +
	               "FROM job_applications ja " +
	               "INNER JOIN users u ON ja.userId = u.uid " +
	               "INNER JOIN recruitment r ON ja.recruitmentId = r.recruitment_id";


	    try (PreparedStatement stmt = conn.prepareStatement(query)) {
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            Map<String, Object> applicationDetails = new HashMap<>();
	            applicationDetails.put("name", rs.getString("name"));
	            applicationDetails.put("mobile", rs.getString("mobile"));
	            applicationDetails.put("gender", rs.getString("gender"));
	            applicationDetails.put("address", rs.getString("address"));
	            applicationDetails.put("cv", rs.getString("cv"));
	            applicationDetails.put("job_title", rs.getString("job_title"));
	            applicationDetails.put("description", rs.getString("description"));
	            applicationDetails.put("criteria", rs.getString("criteria"));
	            applicationDetails.put("cv_need", rs.getString("cv_need"));
	            applicationDetails.put("applicationDate", rs.getTimestamp("applicationDate")); 
	            applicationDetails.put("applicationId",rs.getInt("applicationId"));
	                
	            jobApplicationsDetails.add(applicationDetails);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return jobApplicationsDetails;
	}

	@Override
	public boolean deleteJobApplicationById(int id) {
		boolean f=false;
		try {
			String query="DELETE FROM job_applications WHERE applicationId=?";
		    PreparedStatement stmt=conn.prepareStatement(query);
		    stmt.setInt(1, id);
		    stmt.executeUpdate();
		    f=true;
			
		} catch (Exception e) {
			
		}
		return f;
	}

}
