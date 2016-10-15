package com.dao;

import com.entity.User;

public interface UserDao {
	public int checkUser(String userName,String userPassword,int role);
	public void addUser(User user);
	public boolean userNameExists(String userName);
	public void changePassword(String userName,String newPwd);
}
