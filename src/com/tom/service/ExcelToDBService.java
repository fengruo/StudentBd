package com.tom.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.tom.pojo.Student;

public interface ExcelToDBService {
	public void insertExcel(String sql,List<Student> studentList) throws SQLException;
	public List selectOne(String sql,Student student) throws SQLException;
	public ResultSet selectAll(String sql) throws SQLException;
}
