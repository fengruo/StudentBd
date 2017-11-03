package com.tom.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnectionManager
{
	private String DriverName;
	//private String url="jdbc:mysql://localhost:3306/studentrxdb?useUnicode=true&characterEncoding=utf-8&useSSL=true";
	//private String user="root";
	//private String password="123456";
	 private static final String[] mysqlmessage=Mysqlread.message;
	public String getDriverName() {
		return DriverName;
	}
	public void setDriverName(String driverName) {
		DriverName = driverName;
	}
	
	public Connection getConnection()
	{
		try
		{
			System.out.println(mysqlmessage[0]+"--"+mysqlmessage[1]+"--"+mysqlmessage[2]);
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(mysqlmessage[0],mysqlmessage[1],mysqlmessage[2]);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}

}
