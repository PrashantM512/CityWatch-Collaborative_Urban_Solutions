package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.city.watch.entity.Suggestion;
import com.city.watch.entity.User;

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


	@Override
	public List<Suggestion> getSuggestionsById(int uid) {
		List<Suggestion> list=new ArrayList<Suggestion>();
		Suggestion sug=null;
		try {
			String query="SELECT * FROM suggestions WHERE uid=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, uid);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
				sug=new Suggestion();
				sug.setId(rs.getInt(1));
				sug.setUid(rs.getInt(2));
				sug.setTitle(rs.getString(3));
				sug.setDescription(rs.getString(4));
				sug.setDate(rs.getTimestamp(5));
				sug.setAge(rs.getInt(6));
				sug.setEducation(rs.getString(7));
				list.add(sug);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public boolean deleteSuggestionByIdandUid(int id, int uid) {
		boolean f=false;
		try {
			String query="DELETE FROM suggestions WHERE id=? AND uid=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, id);
			stmt.setInt(2, uid);
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
		   e.printStackTrace();
		}
		return f;
	}


	@Override
	public List<Map<String, Object>> getAllSuggestionsWithUserDetails() {
	    List<Map<String, Object>> list = new ArrayList<>();
	    String query = "SELECT s.*, u.name, u.mobile " +
	                   "FROM suggestions s " +
	                   "INNER JOIN users u ON s.uid = u.uid";
	    try (PreparedStatement stmt = conn.prepareStatement(query)) {
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            Suggestion suggestion = new Suggestion();
	            suggestion.setId(rs.getInt("id"));
	            suggestion.setUid(rs.getInt("uid"));
	            suggestion.setTitle(rs.getString("title"));
	            suggestion.setDescription(rs.getString("description"));
	            suggestion.setDate(rs.getTimestamp("date"));
	            suggestion.setAge(rs.getInt("age"));
	            suggestion.setEducation(rs.getString("education"));

	            User user = new User();
	            user.setName(rs.getString("name"));
	            user.setMobile(rs.getString("mobile"));

	            Map<String, Object> suggestionWithUser = new HashMap<>();
	            suggestionWithUser.put("suggestion", suggestion);
	            suggestionWithUser.put("user", user);

	            list.add(suggestionWithUser);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}


}
