package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.city.watch.entity.Suggestion;

public class SuggestionDaoImpl implements SuggestionDao{
 
	private Connection conn;
	
	public SuggestionDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}


	@Override
	public boolean addSuggestion(Suggestion sug) {
		boolean f=false;
		
		try {
			String query="INSERT INTO suggestions(uid,title,description,age,education) VALUES(?,?,?,?,?)";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1,sug.getUid());
			stmt.setString(2,sug.getTitle());
			stmt.setString(3, sug.getDescription());
			stmt.setInt(4, sug.getAge());
			stmt.setString(5,sug.getEducation());
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
