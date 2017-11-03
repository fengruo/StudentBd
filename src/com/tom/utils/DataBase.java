package com.tom.utils;

import java.sql.Connection;
public class DataBase 
{
	public Connection Connection()
	{
		Connection conn=null;
		try 
		{
			DBConnectionManager dbc=new DBConnectionManager();
			conn=dbc.getConnection();
			System.out.println("数据库连接成功");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("数据库连接失败");
		}
		return conn;
	}
}
	
	
 


