package com.tom.service;

import com.tom.pojo.Guardian;
import com.tom.pojo.Student;

public interface StudentDoService {
	//学生根据考生号和姓名查找学生信息
	public Student selectOneStudentInfo(String s_exam_number,String studentname);
	
	//插入学生联系方式
	public String insertGuardian(Guardian guardian);
	
	//学生填入需要填写的信息，此时状态为4，表示还未审核通过
	public String updateOneStudentInfo(Student student);
	
	
	
	//根据学生身份证号查询学生当前报道状态
	public String queryState(String s_id_card);
}
