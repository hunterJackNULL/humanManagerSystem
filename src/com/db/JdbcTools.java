package com.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;


public class JdbcTools {
	private static ComboPooledDataSource cpds = null;
	static{
		cpds = new ComboPooledDataSource("mysql");
		/*cpds = new ComboPooledDataSource();
		Properties properties = new Properties();
		try {
			properties.load(JdbcTools.class.getClassLoader().getResourceAsStream("c3p0.properties"));
		cpds.setUser(properties.getProperty("user"));
		cpds.setPassword(properties.getProperty("password"));
		cpds.setAcquireIncrement(Integer.parseInt(properties.getProperty("acquireIncrement")));
		cpds.setDriverClass(properties.getProperty("driverClass"));
		cpds.setJdbcUrl(properties.getProperty("jdbcUrl"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
	public static Connection getConnection() {
		try {
			return cpds.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static void begin(Connection conn) throws SQLException{
		conn.setAutoCommit(false);//取消自动提交
	}
	public static void commit(Connection conn) throws SQLException{
		conn.commit();
	}
	public static void rollBack(Connection conn) throws SQLException{
		conn.rollback();//回滚事务
	}
	public static void releaseDB(Connection conn , Statement st, ResultSet rs){
		try {
			if(rs != null)
				rs.close();
			if(st != null)
				st.close();
			if(conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
