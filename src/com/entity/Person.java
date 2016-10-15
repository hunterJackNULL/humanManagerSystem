package com.entity;

import java.io.Serializable;

public class Person implements Serializable{
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private int workId;
	private String name;
	private String introduction;
	public int getWorkId() {
		return workId;
	}
	public void setWorkId(int workId) {
		this.workId = workId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	@Override
	public String toString() {
		return "Person [id=" + id + ", workId=" + workId + ", name=" + name + ", introduction=" + introduction + "]";
	}

	
	
}
