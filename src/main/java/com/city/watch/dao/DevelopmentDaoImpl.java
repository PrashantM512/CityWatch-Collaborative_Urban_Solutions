package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.city.watch.entity.Development;

public class DevelopmentDaoImpl implements DevelopmentDao{
	
	private Connection conn;
	public DevelopmentDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}


	@Override
	public boolean uploadDevelopment(Development dev) {
		boolean f=false;
		try {
			String query="INSERT INTO developments(title,description,location,sDate,eDate,status,need,photo) VALUES(?,?,?,?,?,?,?,?)";
	        PreparedStatement stmt=conn.prepareStatement(query);
	        stmt.setString(1,dev.getTitle());
	        stmt.setString(2,dev.getDescription());
	        stmt.setString(3,dev.getLocation());
	        stmt.setString(4,dev.getsDate());
	        stmt.setString(5,dev.geteDate());
	        stmt.setString(6,dev.getStatus());
	        stmt.setString(7,dev.getNeed());
	        stmt.setString(8,dev.getPhoto());
	        stmt.executeUpdate();
	        f=true;
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
