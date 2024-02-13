package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

	@Override
	public List<Recruitment> getAllRecruitments() {
       List<Recruitment> list=new ArrayList<Recruitment>();
       Recruitment rc=null;
       try {
		String query="SELECT * FROM recruitment";
		PreparedStatement stmt=conn.prepareStatement(query);
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			rc=new Recruitment();
			rc.setRecruitmentId(rs.getInt(1));
			rc.setJobTitle(rs.getString(2));
			rc.setDescription(rs.getString(3));
			rc.setApplicationEndDate(rs.getString(4));
			rc.setCreatedAt(rs.getTimestamp(5));
			list.add(rc);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
       
		return list;
	}

	@Override
	public boolean deleteRecruitmentById(int id) {
		boolean f=false;
		try {
			String query="DELETE FROM recruitment WHERE recruitment_id=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, id);
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
