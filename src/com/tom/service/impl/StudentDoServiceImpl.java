package com.tom.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tom.pojo.BDAllInfo;
import com.tom.pojo.Guardian;
import com.tom.pojo.Student;
import com.tom.service.StudentDoService;
import com.tom.service.UsuallyService;
import com.tom.utils.DataBase;

public class StudentDoServiceImpl extends DataBase implements StudentDoService{
	private UsuallyService usuallyService=new UsuallyServiceImpl();
	private DataBase db =new DataBase();
	private Connection conn=null;
	private Statement  stmt=null;;
	private ResultSet rs=null;
	private String sqlStr="";
	//根据学生号学生姓名查询一条学生信息
	public Student selectOneStudentInfo(String s_exam_number,String studentname) {
		Student student=new Student();
		sqlStr="select s_class_id,s_dormitory_id,s_state_id,s_id_card from student where " +
				"s_exam_number=\""+s_exam_number+"\" and s_name=\""+studentname+"\"";
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			
			System.out.println(sqlStr);
			rs= stmt.executeQuery(sqlStr);
			if(rs.next()){
				UsuallyService us=new UsuallyServiceImpl();
				student.setS_class_id(rs.getInt(1));
				student.setC_name(us.selectClassname(rs.getInt(1)));
				System.out.println(rs.getString(1));
				if(rs.getString(2).equals("0")){
					student.setS_dormitory_id("暂未分配");
				}else{
				student.setS_dormitory_id(rs.getString(2));
				}
				student.setS_state_id(rs.getInt(3));
				student.setS_id_card(rs.getString(4));
				student.setS_name(studentname);
				student.setS_exam_number(s_exam_number);
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
		return student;
	}
	//学生信息录入
	public String updateOneStudentInfo(Student student) {
		int flag=0;
		sqlStr="update student set " +
				"s_email='"+student.getS_email()+"' ,s_exam_number='"+student.getS_exam_number()+"' ,s_note='"+student.getS_note()+"' ,s_age='"+student.getS_age()+"' ,s_student_number='"+student.getS_student_number()+
				"' ,s_nation='"+student.getS_nation()+"' ,s_dormitory_id='"+student.getS_dormitory_id()+
				"' ,s_native_place='"+student.getS_native_place()+"' ,s_riding_section='"+student.getS_riding_section()+
				"' ,s_address='"+student.getS_address()+"' ,s_family_population='"+student.getS_family_population()+
				"' ,s_p_id='"+student.getS_p_id()+"' ,s_tel='"+student.getS_tel()+"' ,s_id_card='"+student.getS_id_card()+"'"+
				"where s_exam_number='"+student.getS_exam_number()+"'";
		System.out.println(sqlStr);
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			
			flag=stmt.executeUpdate(sqlStr);
			System.out.println(flag);
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
		if(flag==0){
			return "提交失败";
		}
		return "提交成功";
	}
	//插入学生联系人信息
	public String insertGuardian(Guardian guardian) {
		int flag=0;
		sqlStr="insert into guardian(g_id_card,g_name1,g_tel1,g_name2,g_tel2) " +
				"values('"+guardian.getG_id_card()+"','"+guardian.getG_name1()+"','"+guardian.getG_tel1()+"','"+guardian.getG_name2()+"','"+guardian.getG_tel2()+"')";
		System.out.println(sqlStr);
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			
			flag=stmt.executeUpdate(sqlStr);
			System.out.println(flag);
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
		if(flag==0){
			return "监护人信息提交失败";
		}
		return "监护人信息提交成功";
	}
	//查询学生状态
	public String queryState(String s_id_card) {
		String s_state_id="";
		int flag=4;
		sqlStr="select s_state_id from student where s_id_card='"+s_id_card+"'";
		System.out.println(sqlStr);
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			 rs=stmt.executeQuery(sqlStr);
			if(rs.next()){
				flag=rs.getInt("s_state_id");
				System.out.println(flag);
			}
			s_state_id=usuallyService.selectStatename(flag);
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
			e.printStackTrace();
		}
		return s_state_id;
	}

	

}
