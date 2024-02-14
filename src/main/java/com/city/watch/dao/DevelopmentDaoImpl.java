package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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


	@Override
	public Development getDevelopmentById(int pid) {
		Development dev=null;
		try {
			String query="SELECT * FROM developments WHERE pid=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, pid);
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
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dev;
	}


	@Override
	public boolean updateDevelopmentById(int pid, Development dev) {
		boolean f=false;
		try {
			String query="UPDATE developments SET title=?,description=?,location=?,sDate=?,eDate=?,status=?,need=?,photo=? WHERE pid=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,dev.getTitle());
			stmt.setString(2,dev.getDescription());
			stmt.setString(3,dev.getLocation());
			stmt.setString(4,dev.getsDate());
			stmt.setString(5,dev.geteDate());
			stmt.setString(6,dev.getStatus());
			stmt.setString(7,dev.getNeed());
			stmt.setString(8,dev.getPhoto());
			stmt.setInt(9,dev.getPid());
			stmt.executeUpdate();
			f=true;
		
		} catch (Exception e) {
		  e.printStackTrace();
		}
		return f;
	}


	@Override
	public boolean deleteDevelopmentById(int pid) {
		boolean f=false;
		try {
			String query="DELETE FROM developments WHERE pid=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, pid);
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	@Override
	public List<Development> getAllDevelopmentsWithDonationCounts() {
	    List<Development> developments = new ArrayList<>();
	    
	    String FETCH_DEVELOPMENTS_QUERY = 
	        "SELECT d.pid, d.title, d.description, d.location, d.sDate, d.eDate, d.status, d.need, d.photo, COUNT(do.amount) AS donation_count " +
	        "FROM developments d " +
	        "LEFT JOIN donations do ON d.pid = do.pid " +
	        "GROUP BY d.pid, d.title, d.description, d.location, d.sDate, d.eDate, d.status, d.need, d.photo";

	    try (PreparedStatement stmt = conn.prepareStatement(FETCH_DEVELOPMENTS_QUERY);
	         ResultSet rs = stmt.executeQuery()) {
	        while (rs.next()) {
	            Development development = new Development();
	            development.setPid(rs.getInt("pid"));
	            development.setTitle(rs.getString("title"));
	            development.setDescription(rs.getString("description"));
	            development.setLocation(rs.getString("location"));
	            development.setsDate(rs.getString("sDate"));
	            development.seteDate(rs.getString("sDate"));
	            development.setStatus(rs.getString("status"));
	            development.setNeed(rs.getString("need"));
	            development.setPhoto(rs.getString("photo"));
	            development.setDonationCount(rs.getInt("donation_count"));

	            developments.add(development);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return developments;
	}

}
