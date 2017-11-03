package com.tom.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.tom.service.BasicinfoService;
import com.tom.utils.DataBase;

public class BasicinfoServiceImpl implements BasicinfoService{
	private DataBase db =new DataBase();
	private Connection conn=null;
	private Statement  stmt=null;;
	private ResultSet rs=null;
	private String sqlStr="";
	public List<String[]> basicinfo() {
		//查询出学生信息list
		sqlStr="call `新生基本信息统计表`";
		//System.out.println(sqlStr);
		List<String[]> stringslist=new ArrayList<String[]>();
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sqlStr);
			while (rs.next()) {
				String[] strings=new String[21];
				for (int i=0;i<strings.length;i++){
					if(i==5||i==19){
						strings[i]=rs.getInt(i+1)+"";
					}else{
						strings[i]=rs.getString(i+1);
					}
				}
				stringslist.add(strings);
			}
			if(conn!=null){
				conn.close();
			}
			if(stmt!=null){
				stmt.close();
			}
			if(rs!=null){
				rs.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stringslist;
	}

}
