package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.city.watch.entity.Issue;
import com.city.watch.entity.User;

public class IssueDaoImpl implements IssueDao{
	
	private Connection conn;

	public IssueDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addIssue(Issue issue) {
		boolean f=false;
		try {
			String query="INSERT INTO issues(title,description,photo,type,userId) VALUES(?,?,?,?,?)";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,issue.getTitle());
			stmt.setString(2, issue.getDescription());
			stmt.setString(3,issue.getPhoto());
			stmt.setString(4, issue.getType());
			stmt.setInt(5, issue.getUserId());
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Map<String, Object>> getPublicIssues() {
	    List<Map<String, Object>> list = new ArrayList<>();
	    String query = "SELECT i.*, u.name, u.mobile, u.uid " +
	                   "FROM issues i " +
	                   "INNER JOIN users u ON i.userId = u.uid";
	    try (PreparedStatement stmt = conn.prepareStatement(query)) {
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            Issue is = new Issue();
	            is.setId(rs.getInt(1));
	            is.setTitle(rs.getString(2));
	            is.setDescription(rs.getString(3));
	            is.setPhoto(rs.getString(4));
	            is.setType(rs.getString(5));
	            is.setDate(rs.getTimestamp(6));
	            is.setStatus(rs.getString(7));
	            is.setUserId(rs.getInt(8));
	            
	            User user = new User();
	            user.setName(rs.getString("name"));
	            user.setMobile(rs.getString("mobile"));
	            user.setUid(rs.getInt("uid"));
	        
	            Map<String, Object> publicIssue = new HashMap<>();
	            publicIssue.put("issue", is);
	            publicIssue.put("user", user);

	            list.add(publicIssue);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	@Override
	public List<Issue> getIssuesByUserId(int userId) {
		List<Issue> list=new ArrayList<Issue>();
		Issue is=null;
	    try {
			String query="SELECT * FROM issues WHERE userId=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, userId);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
			  is=new Issue();
				 is.setId(rs.getInt(1));
		         is.setTitle(rs.getString(2));
		         is.setDescription(rs.getString(3));
		         is.setPhoto(rs.getString(4));
		         is.setType(rs.getString(5));
		         is.setDate(rs.getTimestamp(6));
	             is.setStatus(rs.getString(7));
	             is.setUserId(rs.getInt(8));
				list.add(is);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public boolean deleteIssueByIdandUserId(int id, int userId) {
		boolean f=false;
		try {
			String query="DELETE FROM issues WHERE id=? AND userId=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, id);
			stmt.setInt(2, userId);
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
		 e.printStackTrace();
		}
		return f;
	}

	@Override
	public Issue getIssueById(int id) {
		Issue is=null;
		try {
			String query="SELECT * FROM issues WHERE id=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, id);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
				 is=new Issue();
				 is.setId(rs.getInt(1));
		         is.setTitle(rs.getString(2));
		         is.setDescription(rs.getString(3));
		         is.setPhoto(rs.getString(4));
		         is.setType(rs.getString(5));
		         is.setDate(rs.getTimestamp(6));
	             is.setStatus(rs.getString(7));
	             is.setUserId(rs.getInt(8));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return is;
	}

	@Override
	public boolean updateIssueProgrss(int id,String progress) {
		boolean f=false;
		try {
			String query="UPDATE issues SET status=? WHERE id=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, progress);
			stmt.setInt(2, id);
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
