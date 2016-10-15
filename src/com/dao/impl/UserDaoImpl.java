package com.dao.impl;

import java.sql.SQLException;

import com.dao.DAO;
import com.dao.UserDao;
import com.entity.*;

public class UserDaoImpl extends DAO<User> implements UserDao{

	@Override
	/**
	 * return 0:密码错误
	 * return 1:密码正确
	 * return -1:用户不存在
	 */
	public int checkUser(String userName, String userPassword, int role) {
		// TODO Auto-generated method stub
		int result = -1;
		String password = null;
		String sql = "SELECT userpassword FROM user WHERE username = ? AND role = ?";
		try {
			password = getForValue(sql, userName,role);
			System.out.println(password);
			if(password == null){
				result = -1;
			}else if(password.equals(userPassword)){
				result = 1;
			}else{
				result = 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	@Override
	public boolean userNameExists(String userName){
		boolean userNameExists = false;
		String sql = "SELECT count(*) FROM user WHERE username = ?";
		long count;
		try {
			count = getForValue(sql, userName);
			System.out.println("count:"+count);
			if(count != 0){
				userNameExists = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userNameExists;
	}
	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		String sql = "insert into user(username,userpassword,role) "
				+ "values(?,?,?)";
		try {
			update(sql, user.getUserName(),user.getUserPassword(),user.getRole());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public void changePassword(String userName, String newPwd) {
		// TODO Auto-generated method stub		
		String sql = "update user set userpassword = ? where username = ?";
		try {
			update(sql, newPwd,userName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}





}
