package com.dao;

import java.lang.reflect.ParameterizedType;
import com.db.*;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

public class DAO <T>{
	private Class<T> clazz;
	Connection conn = JdbcTools.getConnection();
	QueryRunner queryRunner = new QueryRunner();//DBUtils ºËÐÄÀà
	public  DAO(){
		Type superClass = getClass().getGenericSuperclass();
		if(superClass instanceof ParameterizedType){
			ParameterizedType parameterizedType = (ParameterizedType) superClass;
			Type [] typeArgs = parameterizedType.getActualTypeArguments();
			if(typeArgs != null && typeArgs.length > 0){
				if(typeArgs[0] instanceof Class){
					clazz = (Class<T>)typeArgs[0];
				}
			}
		}
	}
	public void update(String sql,Object...objects) throws SQLException{
	
		queryRunner.update(conn, sql,objects);
	}
	public void updateBatch(String sql,Object[][]objects) throws SQLException{
		queryRunner.batch(conn, sql, objects);
	}
	public List<T> getForList(String sql,Object...objects) throws SQLException{
		return queryRunner.query(conn, sql, new BeanListHandler<T>(clazz), objects);
	}
	public T get(String sql,Object...objects) throws SQLException{
		return (T) queryRunner.query(conn, sql, new BeanHandler(clazz), objects);
	}
	public <E> E getForValue(String sql,Object...objects) throws SQLException{
		return (E) queryRunner.query(conn, sql, new ScalarHandler(), objects);
	}
}
