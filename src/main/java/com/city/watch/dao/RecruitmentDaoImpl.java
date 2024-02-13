package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.city.watch.entity.Recruitment;

public class RecruitmentDaoImpl implements RecruitmentDao {
	private Connection conn;

	public RecruitmentDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addRecruitment(Recruitment recruitment) {
		boolean f=false;
		try {
			String query="INSERT INTO recruitment(job_title, description, application_end_date) VALUES(?,?,?)";
		    PreparedStatement stmt=conn.prepareStatement(query);
		    stmt.setString(1,recruitment.getJobTitle());
		    stmt.setString(2,recruitment.getDescription());
		    stmt.setString(3,recruitment.getApplicationEndDate());
		    stmt.executeUpdate();
		    f=true;
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
