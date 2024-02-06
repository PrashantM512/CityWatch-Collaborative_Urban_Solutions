package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.city.watch.entity.Pins;

public class PinsDaoImpl implements PinsDao {
   private Connection conn;
	
	public PinsDaoImpl(Connection conn) {
	super();
	this.conn = conn;
}

	@Override
	public boolean addPin(Pins pin) {
		boolean f=false;
		
		try {
			String query="INSERT INTO pins(name,category,location,link) VALUES(?,?,?,?)";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, pin.getName());
			stmt.setString(2, pin.getCategory());
			stmt.setString(3, pin.getLocation());
			stmt.setString(4, pin.getLink());
			stmt.executeUpdate();
			f=true;
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	
}
