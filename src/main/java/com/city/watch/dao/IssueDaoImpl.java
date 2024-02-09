package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.city.watch.entity.Issue;

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

}
