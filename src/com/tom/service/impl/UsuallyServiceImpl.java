package com.tom.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import sun.misc.BASE64Encoder;

import com.tom.pojo.Politicsstatus;
import com.tom.service.UsuallyService;
import com.tom.utils.DataBase;
public class UsuallyServiceImpl implements UsuallyService {
	private DataBase db =new DataBase();
	private Connection conn=null;
	private Statement  stmt=null;
	private String sqlStr="";
	public String selectClassname(int id) {
		String className="";
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			sqlStr="select c_name from class where c_id="+id;
			ResultSet rs1=stmt.executeQuery(sqlStr);
			if(rs1.next()){
				className=rs1.getString("c_name");
			}
			if(conn!=null){
				conn.close();
			}
			if(stmt!=null){
				stmt.close();
			}
			if(rs1!=null){
				rs1.close();
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			
		return className;
	}
	// 接收对象并检查对象
		public String checkRequestStr(HttpServletRequest request, String str) {
			String temp = request.getParameter(str) == null ? "" : (request
					.getParameter(str).trim());
			return temp;
		}
		//插入数据库前，进行数据替换
		public String replaceStringByData(String str){
			if(str==null || "".equals(str)){
				return "";
			}
			str=str.replace("'", "''");
			str=str.replace("\\", "\\\\");  
			return str.trim();
		}
		public String crsSql(HttpServletRequest request, String str){
			String temp = request.getParameter(str) == null ? "" : (request.getParameter(str).trim());
			temp=this.replaceStringByData(temp);
			return temp;
		}
		public String getMD5(InputStream fis) {
			try {
				MessageDigest md = MessageDigest.getInstance("MD5");
				byte[] buffer = new byte[2048];
				int length = -1;
				while ((length = fis.read(buffer)) != -1) {
					md.update(buffer, 0, length);
				}
				return bytesToString(md.digest());
			} catch (Exception ex) {
				ex.printStackTrace();
				return null;
			} finally {
				try {
					fis.close();
				} catch (IOException ex) {
					ex.printStackTrace();
				}
			}
		}
		/**
		 * 字节2字符串
		 * 
		 * @param data
		 * @return String
		 */
		private static String bytesToString(byte[] data) {
			char hexDigits[] = { '9', '8', '7', '6', '5', '4', '3', '2', '1', '0',
					'a', 'b', 'c', 'd', 'e', 'f' };
			char[] temp = new char[data.length * 2];
			for (int i = 0; i < data.length; i++) {
				byte b = data[i];
				temp[i * 2] = hexDigits[b >>> 4 & 0x0f];
				temp[i * 2 + 1] = hexDigits[b & 0x0f];
			}
			return new String(temp);
		}
		public List<Politicsstatus> queryPoliticsstatus() {
			List<Politicsstatus> politicsstatuslist=new ArrayList<Politicsstatus>();;
			sqlStr="select p_id,p_political_status from politicsstatus";
			try {
				conn=db.Connection();
				stmt=conn.createStatement();
				ResultSet rs1=stmt.executeQuery(sqlStr);
				while(rs1.next()){
					Politicsstatus politicsstatus=new Politicsstatus();
					politicsstatus.setP_id(rs1.getInt(1));
					politicsstatus.setP_p_political_status(rs1.getString(2));
					politicsstatuslist.add(politicsstatus);
				}
				if(conn!=null){
					conn.close();
				}
				if(stmt!=null){
					stmt.close();
				}
				if(rs1!=null){
					rs1.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return politicsstatuslist;
		}
		public String selectStatename(int id) {
			String className="";
			
			
			sqlStr="select st_name from state where st_id="+id;
			try {
				conn=db.Connection();
				stmt=conn.createStatement();
				ResultSet rs1=stmt.executeQuery(sqlStr);
				if(rs1.next()){
					className=rs1.getString("st_name");
				}
				if(conn!=null){
					conn.close();
				}
				if(stmt!=null){
					stmt.close();
				}
				if(rs1!=null){
					rs1.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return className;
		}
		public String EncoderByMd5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException{
			MessageDigest md5=MessageDigest.getInstance("MD5");
			BASE64Encoder base64en = new BASE64Encoder();
			String newstr=base64en.encode(md5.digest(str.getBytes("utf-8")));
			return newstr;
		}
}
