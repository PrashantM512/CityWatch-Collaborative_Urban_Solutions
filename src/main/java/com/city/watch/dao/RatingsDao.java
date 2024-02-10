package com.city.watch.dao;

import com.city.watch.entity.Rating;

public interface RatingsDao {
        
	public boolean giveRatings(Rating rate);
	public boolean checkFeedback(int pid, int uid);
}
