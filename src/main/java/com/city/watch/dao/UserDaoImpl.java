package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

	@Override
	public boolean checkUserWithEmail(String email) {
		boolean f=false;
		try {
			String query="SELECT * FROM users WHERE email=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,email);
			ResultSet rs=stmt.executeQuery();
			if (rs.next()) {
	            f = true;
	        }
			
		} catch (Exception e) {
		  e.printStackTrace();
		}
		return f;
	}

	@Override
	public User loginUser(String email, String password) {
		User user=null;
		try {
			String query="SELECT * FROM users WHERE email=? AND password=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, email);
			stmt.setString(2, password);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
				user=new User();
				user.setUid(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setMobile(rs.getString(4));
				user.setGender(rs.getString(5));
				user.setAddress(rs.getString(6));
				user.setAadhar(rs.getString(7));
				user.setZone(rs.getString(8));
				user.setUsertype(rs.getString(10));
				user.setHouse_id(rs.getString(11));
				user.setWard_no(rs.getString(12));
				user.setProperty_id(rs.getString(13));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

	@Override
	public User getUserById(int uid) {
		User user=null;
		try {
			String query="SELECT * FROM users WHERE uid=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, uid);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
				user=new User();
				user.setUid(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setMobile(rs.getString(4));
				user.setGender(rs.getString(5));
				user.setAddress(rs.getString(6));
				user.setAadhar(rs.getString(7));
				user.setZone(rs.getString(8));
				user.setPassword(rs.getString(9));
				user.setUsertype(rs.getString(10));
				user.setHouse_id(rs.getString(11));
				user.setWard_no(rs.getString(12));
				user.setProperty_id(rs.getString(13));
			}
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		
		return user;
	}

	@Override
	public boolean updateUserById(int uid, User user) {
	    boolean f = false;
	    try {
	        String query = "UPDATE users SET name=?, email=?, mobile=?, gender=?,address=?, aadhar=?, zone=?, ward_no=?, property_id=?, house_id=? WHERE uid=?";
	        PreparedStatement stmt = conn.prepareStatement(query);
	        stmt.setString(1, user.getName());
	        stmt.setString(2, user.getEmail());
	        stmt.setString(3, user.getMobile());
	        stmt.setString(4, user.getGender());
	        stmt.setString(5, user.getAddress());
	        stmt.setString(6, user.getAadhar());
	        stmt.setString(7, user.getZone());
	        stmt.setString(8, user.getWard_no());
	        stmt.setString(9, user.getProperty_id());
	        stmt.setString(10, user.getHouse_id());
	        stmt.setInt(11, uid);

	        int rowsUpdated = stmt.executeUpdate();
	        if (rowsUpdated > 0) {
	            f = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return f;
	}

	@Override
	public List<User> getAllUsers() {
		List<User> list=new ArrayList<User>();
		User user=null;
		try {
			String query="SELECT * FROM users";
			PreparedStatement stmt=conn.prepareStatement(query);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
			user=new User();
			user.setUid(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setEmail(rs.getString(3));
			user.setMobile(rs.getString(4));
			user.setGender(rs.getString(5));
			user.setAddress(rs.getString(6));
			user.setAadhar(rs.getString(7));
			user.setZone(rs.getString(8));
			user.setPassword(rs.getString(9));
			user.setUsertype(rs.getString(10));
			user.setHouse_id(rs.getString(11));
			user.setWard_no(rs.getString(12));
			user.setProperty_id(rs.getString(13));
			list.add(user);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deleteUserById(int uid) {
		boolean f=false;
		try {
			String query="DELETE FROM users WHERE uid=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, uid);
			stmt.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public List<User> getAllAdmins() {
		List<User> list=new ArrayList<User>();
		User user=null;
		try {
			String query="SELECT * FROM users WHERE usertype=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,"Admin");
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
				user=new User();
				user.setUid(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setMobile(rs.getString(4));
				user.setGender(rs.getString(5));
				user.setAddress(rs.getString(6));
				user.setAadhar(rs.getString(7));
				user.setZone(rs.getString(8));
				user.setPassword(rs.getString(9));
				user.setUsertype(rs.getString(10));
				user.setHouse_id(rs.getString(11));
				user.setWard_no(rs.getString(12));
				user.setProperty_id(rs.getString(13));
				list.add(user);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean updateUserByEmail(String Email, String usertype) {
		boolean f=false;
		try {
			String query="UPDATE users SET usertype=? WHERE email=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, usertype);
			stmt.setString(2, Email);
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


}
