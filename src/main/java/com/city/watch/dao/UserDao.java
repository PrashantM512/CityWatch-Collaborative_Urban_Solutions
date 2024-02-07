package com.city.watch.dao;

import com.city.watch.entity.User;

public interface UserDao {
     
	public boolean registerUser(User user);
	public boolean checkUserWithEmail(String email);
}
