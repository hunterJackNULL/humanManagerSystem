package com.dao.impl;

import java.sql.SQLException;
import java.util.List;
import com.dao.DAO;
import com.dao.PersonDao;
import com.entity.Person;

public class PersonDaoImpl extends DAO<Person> implements PersonDao{

	@Override
	public Person getPerson(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Person getPerson(int id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM personinfo WHERE id = ?";
		Person person = null;
		try {
			person = get(sql, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return person;
	}



	
	@Override
	public void updatePerson(Person person) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatePerson(int workId, String name, String introduction,int id) {
		// TODO Auto-generated method stub
		String sql = "update personinfo set workId = ?,name=?,introduction=? where id=?";
		try {
			update(sql, workId,name,introduction,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		String sql = "delete from personinfo where id = ?";
		try {
			update(sql, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<Person> getPersonsList() {
		// TODO Auto-generated method stub
		List<Person> personsList = null;
		String sql = "SELECT * FROM personInfo ";
		try {
			personsList = getForList(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return personsList;
	}

	@Override
	public void addPerson(Person person) {
		// TODO Auto-generated method stub
		String sql = "insert into personinfo(name,workId,introduction)"
				+ "values(?,?,?)";
		try {
			update(sql, person.getName(),person.getWorkId(),person.getIntroduction());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<Person> getPersonsListByMessage(String message) {
		// TODO Auto-generated method stub
		List<Person> personsList = null;
		String sql = "SELECT * FROM personInfo where workId  LIKE '%"+message+"%' "
				+ "OR name LIKE '%"+message+"%' OR introduction LIKE '%"+message+"%'";
		try {
			personsList = getForList(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return personsList;
	}


}
