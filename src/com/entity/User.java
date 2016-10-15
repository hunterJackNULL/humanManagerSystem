package com.entity;

import java.io.Serializable;

public class User implements Serializable{
	private String id;
	private String userName;
	private String userPassword;
	private int role;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public int getRole() {
		return role;
	}
	public User(String userName, String userPassword, int role) {
		super();
		this.userName = userName;
		this.userPassword = userPassword;
		this.role = role;
	}
	public User() {
		// TODO Auto-generated constructor stub
	}
	public void setRole(int role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", userPassword=" + userPassword + ", role=" + role + "]";
	}
}
