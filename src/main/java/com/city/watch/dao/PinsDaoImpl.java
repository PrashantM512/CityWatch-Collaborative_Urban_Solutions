package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

	@Override
	public List<Pins> getPinByCategory(String category) {
		List<Pins> list=new ArrayList<Pins>();
		Pins pn=null;
		try {
			String query="SELECT * FROM pins WHERE category=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,category);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
			   pn=new Pins();
			   pn.setId(rs.getInt(1));
			   pn.setName(rs.getString(2));
			   pn.setCategory(rs.getString(3));
			   pn.setLocation(rs.getString(4));
			   pn.setLink(rs.getString(5));
			   list.add(pn);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Pins> getSearchedPins(String key) {
		List<Pins> list=new ArrayList<Pins>();
		Pins pin=null;
		try {
			String query = "SELECT * FROM pins WHERE name LIKE ? OR category LIKE ?";
            PreparedStatement stmt=conn.prepareStatement(query);
            stmt.setString(1, "%" + key + "%");
            stmt.setString(2, "%" + key + "%");
            ResultSet rs= stmt.executeQuery();
            while(rs.next()) {
            	pin=new Pins();
            	pin.setId(rs.getInt(1));
            	pin.setName(rs.getString(2));
            	pin.setCategory(rs.getString(3));
            	pin.setLocation(rs.getString(4));
            	pin.setLink(rs.getString(5));
            	list.add(pin);
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Pins> getAllPins() {
		List<Pins> list=new ArrayList<Pins>();
		Pins pn=null;
		try {
			String query="SELECT * FROM pins ORDER BY id DESC";
			PreparedStatement stmt=conn.prepareStatement(query);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
			   pn=new Pins();
			   pn.setId(rs.getInt(1));
			   pn.setName(rs.getString(2));
			   pn.setCategory(rs.getString(3));
			   pn.setLocation(rs.getString(4));
			   pn.setLink(rs.getString(5));
			   list.add(pn);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deletePinById(int id) {
		boolean f=false;
		try {
			String query="DELETE FROM pins WHERE id=?";
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
