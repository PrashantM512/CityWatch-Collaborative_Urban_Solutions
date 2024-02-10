package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.city.watch.entity.Rating;

public class RatingsDaoImpl implements RatingsDao {
	
	private Connection conn;

	public RatingsDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean giveRatings(Rating rate) {
		boolean f=false;
		try {
			String query="INSERT INTO ratings(stars,feedback,pid,uid) VALUES(?,?,?,?)";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1,rate.getStars());
			stmt.setString(2, rate.getFeedback());
			stmt.setInt(3, rate.getPid());
			stmt.setInt(4, rate.getUid());
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean checkFeedback(int pid, int uid) {
		boolean f=false;
		try {
			String query="SELECT * FROM ratings WHERE pid=? AND uid=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, pid);
			stmt.setInt(2, uid);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Rating> getAllRatings() {
		List<Rating> list =new ArrayList<Rating>();
		Rating rt=null;
		try {
			String query="SELECT * FROM ratings";
			PreparedStatement stmt=conn.prepareStatement(query);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
				rt=new Rating();
				rt.setRid(rs.getInt(1));
				rt.setStars(rs.getInt(2));
				rt.setFeedback(rs.getString(3));
				rt.setDate(rs.getTimestamp(4));
				rt.setPid(rs.getInt(5));
				rt.setUid(rs.getInt(6));
				list.add(rt);
			}
			
		} catch (Exception e) {
	        e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
    public List<Map<String, Object>> getFeedbackDetails() {
	        List<Map<String, Object>> feedbackDetailsList = new ArrayList<>();
	        String query = "SELECT f.*, u.*, d.* " +
	                "FROM ratings f " +
	                "INNER JOIN users u ON f.uid = u.uid " +
	                "INNER JOIN developments d ON f.pid = d.pid";
	        try (PreparedStatement stmt = conn.prepareStatement(query)) {
	            ResultSet rs = stmt.executeQuery();
	            while (rs.next()) {
	                Map<String, Object> feedbackDetails = new HashMap<>();

	                int rid = rs.getInt("rid");
	                int stars = rs.getInt("stars");
	                String feedback = rs.getString("feedback");
	                Timestamp date = rs.getTimestamp("date");

	                int uid = rs.getInt("u.uid");
	                String name = rs.getString("name");
	                String email = rs.getString("email");
	                String mobile = rs.getString("mobile");
	               
	                int pid = rs.getInt("d.pid");
	                String title = rs.getString("title");
	                String description = rs.getString("description");
	                String location = rs.getString("location");
	               
	                feedbackDetails.put("rid", rid);
	                feedbackDetails.put("stars", stars);
	                feedbackDetails.put("feedback", feedback);
	                feedbackDetails.put("date", date);

	                Map<String, Object> userDetails = new HashMap<>();
	                userDetails.put("uid", uid);
	                userDetails.put("name", name);
	                userDetails.put("email", email);
	                userDetails.put("mobile", mobile);
	                
	                Map<String, Object> developmentDetails = new HashMap<>();
	                developmentDetails.put("pid", pid);
	                developmentDetails.put("title", title);
	                developmentDetails.put("description", description);
	                developmentDetails.put("location", location);
	                
	                feedbackDetails.put("user", userDetails);
	                feedbackDetails.put("development", developmentDetails);

	                feedbackDetailsList.add(feedbackDetails);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return feedbackDetailsList;
	    }
	}
	
