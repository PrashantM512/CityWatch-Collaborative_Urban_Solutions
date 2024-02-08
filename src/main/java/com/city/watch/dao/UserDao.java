package com.city.watch.dao;

import java.util.List;

import com.city.watch.entity.User;

public interface UserDao {
     
	public boolean registerUser(User user);
	public boolean checkUserWithEmail(String email);
	public User loginUser(String email,String Password);
	public User getUserById(int uid);
	public boolean updateUserById(int uid, User user); 
	public List<User> getAllUsers();
	public boolean deleteUserById(int uid);
	public List<User> getAllAdmins();
	public boolean updateUserByEmail(String Email,String usertype);
}
