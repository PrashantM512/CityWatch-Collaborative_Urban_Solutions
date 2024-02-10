package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
	

}
