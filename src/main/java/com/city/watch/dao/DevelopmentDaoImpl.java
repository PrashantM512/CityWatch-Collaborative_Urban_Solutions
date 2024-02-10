package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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


	@Override
	public List<Development> getAlldevelopments() {
		List<Development> list=new ArrayList<Development>();
		Development dev=null;
		try {
			String query="SELECT * FROM developments";
			PreparedStatement stmt=conn.prepareStatement(query);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
				dev=new Development();
				dev.setPid(rs.getInt(1));
				dev.setTitle(rs.getString(2));
				dev.setDescription(rs.getString(3));
				dev.setLocation(rs.getString(4));
				dev.setsDate(rs.getString(5));
				dev.seteDate(rs.getString(6));
				dev.setStatus(rs.getString(7));
				dev.setNeed(rs.getString(8));
				dev.setPhoto(rs.getString(9));
				list.add(dev);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
