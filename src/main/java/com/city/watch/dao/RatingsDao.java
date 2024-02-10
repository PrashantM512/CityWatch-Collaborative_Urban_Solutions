package com.city.watch.dao;

import java.util.List;
import java.util.Map;

import com.city.watch.entity.Rating;

public interface RatingsDao {
        
	public boolean giveRatings(Rating rate);
	public boolean checkFeedback(int pid, int uid);
	public List<Rating> getAllRatings();
	public List<Map<String, Object>> getFeedbackDetails();
	public boolean deleteRatingById(int rid);
}
