package com.dao;

import java.util.List;

import com.entity.Person;


public interface PersonDao {
	public Person getPerson(String name);
	public Person getPerson(int id);
	public void addPerson(Person person);
	public List<Person> getPersonsList();
	public List<Person> getPersonsListByMessage(String message);
	public void updatePerson(Person person);
	public void updatePerson(int workId,String name,String introduction,int id);
	public void deleteById(int id);
}
