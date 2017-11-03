package com.tom.utils;
import java.sql.*;
import java.util.*;
public class splitPage extends splitPageDataBase
{
	//定义数据库连接对象和结果集对象
	private Connection con=conn;
	
	
	private ResultSetMetaData rsmd=null;
	//SQL查询语句
	
	//总记录数目
	private int rowCount=0;
	//所分的逻辑页数
	private int pageCount=0;
	//每页显示的记录数目
	private int pageSize=0;	
	//设置参数值
	public void setCon(Connection con)
	{
		this.con=con;
		if (this.con == null)
		{
			System.out.println("Failure to get a connection!");
		}
		else
		{
			System.out.println("Success to get a connection!");
		}
	}	
	//初始化,获取数据表中的信息
	public void initialize(String sqlStr,int pageSize,int ipage)
	{		
		int irows = pageSize*(ipage-1);
		this.sqlStr=sqlStr;
		this.pageSize=pageSize;
		try
		{ 
			stmt=this.con.createStatement(); 
			rs=stmt.executeQuery(this.sqlStr);		
			if (rs!=null)
			{
				rs.last();
				this.rowCount = rs.getRow();
				rs.first();
				this.pageCount = (this.rowCount - 1) / this.pageSize + 1; 
			} 
			this.sqlStr=sqlStr+" limit "+irows+","+pageSize;
			stmt=this.con.createStatement(); 
			rs=stmt.executeQuery(this.sqlStr); 
			rsmd=rs.getMetaData(); 
			
		} 
		catch(SQLException e)
		{
			System.out.println(e.toString()); 
		}}
		     // if(stmt!= null)
			/*	try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}*/ 		
	//将显示结果存到Vector集合类中
	public Vector getPage()
	{ 
		Vector vData=new Vector();
		try
		{
			if (rs!=null)
			{
				while(rs.next())
				{
					String[] sData=new String[20];
					for(int j=0;j<rsmd.getColumnCount();j++)
					{
						sData[j]=rs.getString(j+1);
					}
					vData.addElement(sData);									
				}			
			}
			if(rs!=null){
				rs.close();
			}
			if(stmt!=null){
				stmt.close();
			}
			if(con!=null){
				con.close();
			}
		} 
		catch(SQLException e)
		{
			System.out.println(e.toString());
		} 
		
		return vData; 
	} 	
	//获得页面总数
	public int getPageCount()
	{
		return this.pageCount;
	}	
	//获取数据表中记录总数
	public int getRowCount()
	{
		return this.rowCount;
	}
}

