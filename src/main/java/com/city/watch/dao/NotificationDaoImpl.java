package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.city.watch.entity.Notification;

public class NotificationDaoImpl implements NotificationDao {
	
	private Connection conn;
	public NotificationDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean sendNotification(Notification noti) {
		boolean f=false;
		try {
			String query="INSERT INTO notifications(title,description,frm,target) VALUES(?,?,?,?)";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,noti.getTitle());
			stmt.setString(2,noti.getDescription());
			stmt.setString(3,noti.getFrm());
			stmt.setString(4,noti.getTarget());
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		return f;
	}
	
	@Override
	public List<Notification> getNotificationByTarget(String target) {
       List<Notification> list=new ArrayList<Notification>();
       Notification noti=null;
       try {
		 String query="SELECT * FROM notifications WHERE target=? OR target=?";
		 PreparedStatement stmt=conn.prepareStatement(query);
		 stmt.setString(1, target);
		 stmt.setString(2, "All");
		 
		 ResultSet rs=stmt.executeQuery();
		 while(rs.next()) {
			 noti=new Notification();
			 noti.setId(rs.getInt(1));
			 noti.setTitle(rs.getString(2));
			 noti.setDescription(rs.getString(3));
			 noti.setFrm(rs.getString(4));
			 noti.setDate(rs.getTimestamp(5));
			 noti.setTarget(rs.getString(6));
			 list.add(noti);
		 }
    	   
	   } catch (Exception e) {
	    	e.printStackTrace();
	   }

		return list;
	}

}
