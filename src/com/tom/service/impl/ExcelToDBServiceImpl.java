package com.tom.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tom.pojo.Student;
import com.tom.service.ExcelToDBService;
import com.tom.utils.DataBase;

public class ExcelToDBServiceImpl implements ExcelToDBService {
	private DataBase db =new DataBase();
	//批量导入学生信息
	public void insertExcel(String sql, List<Student> studentList) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			for (int i=0;i<studentList.size()-1;i++) {
				sql=sql+"(?,?,?,?,?,?,?),";
			}
			sql=sql+"(?,?,?,?,?,?,?)";
			conn =db.Connection();
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			int k=0;
			for (Student student2 : studentList) {
				ps.setString(k+1, student2.getS_exam_number());
				ps.setString(k+2, student2.getS_name());
				ps.setString(k+3, student2.getS_sex());
				ps.setString(k+4, student2.getS_province());
				ps.setString(k+5, student2.getS_train_level());
				ps.setInt(k+6, student2.getS_class_id());
				ps.setString(k+7, student2.getS_dormitory_id());
				k=k+7;
			}
			k=0;
			boolean flag = ps.execute();
			String sqlStr="call updateSS";
			ps = conn.prepareStatement(sqlStr);
			flag=ps.execute();
			if(!flag){
				System.out.println("123");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}

	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List selectOne(String sql, Student student) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List list = new ArrayList();
		try {
			conn =db.Connection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				if(rs.getString("s_exam_number").equals(student.getS_exam_number())){
					list.add(1);
				}else{
					list.add(0);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return list;

	}

	public ResultSet selectAll(String sql) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn =db.Connection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return rs;
	}

}
