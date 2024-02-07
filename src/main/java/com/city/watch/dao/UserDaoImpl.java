package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.city.watch.entity.User;

public class UserDaoImpl implements UserDao{
    private Connection conn;
    
	public UserDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean registerUser(User user) {
		boolean f=false;
		try {
			String query="INSERT INTO users(name,email,mobile,gender,aadhar,zone,password) VALUES(?,?,?,?,?,?,?)";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,user.getName());
			stmt.setString(2,user.getEmail());
			stmt.setString(3,user.getMobile());
			stmt.setString(4,user.getGender());
			stmt.setString(5,user.getAadhar());
			stmt.setString(6,user.getZone());
			stmt.setString(7,user.getPassword());
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	

}
