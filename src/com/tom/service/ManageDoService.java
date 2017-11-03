package com.tom.service;

import java.util.List;

import com.tom.pojo.BDAllInfo;
import com.tom.pojo.ClassBDInfo;
import com.tom.pojo.ClassClass;
import com.tom.pojo.Major;
import com.tom.pojo.MajorBDInfo;
import com.tom.pojo.Manage;
import com.tom.pojo.PYCCBDInfo;
import com.tom.pojo.Student;
import com.tom.pojo.TCRelation;
import com.tom.pojo.Teacher;

public interface ManageDoService {
	//输入学生姓名可查询当前
		public Student selectOneStudentInfo(String name);
		
	//修改报道状态根据传入身份证id
		public String updateOneStudentInfo(String s_id_card);
	
	//查询出所有班级
		public List<ClassClass> queryClassList();
	//查询出所有专业
		public List<Major> queryMajorList();
	//查询各类报表
		//1.查询总览报表
		public List<MajorBDInfo> queryMajorBDInfo();
		public List<ClassBDInfo> quaryClassBDInfo();
		public List<PYCCBDInfo> quaryPYCCBDInfo();
		public List<BDAllInfo> quaryAllReportForm();
	//超级管理员登陆
		public Manage checkManage(Manage manage);
	//分页查询学生信息
		public List<Student> queryStudentListFY(int nowpage,int pagesize);
	//根据老师ID查询出其所管班级list
		public List<ClassClass> queryTeaClassList(int ma_teacherid);
	//修改密码
		public String xgPwd(String pwd,String oldPwd,String ma_name);
	//查询出所有教师信息
		public List<Teacher> queryTeacher();
	//查询出所有非超级管理员信息
		public List<Manage> queryManage();
	//添加管理员信息
		public String addManage(Manage manage);
	//添加教师信息
		public String addTeacher(Teacher teacher);
	//添加教师班级关系
		public String addTC(int t_id,int c_id);
	//查询出所有教师班级关系
		public List<TCRelation> queryTC();
		public void delTC(int t_id);
	//查询出所有专业
		public List<Major> queryMajorAll();
	//添加专业
		public String insertMajor(Major major);
	//查询班级
		public List<ClassClass> queryClassAll();
	//添加班级
		public String insertClass(ClassClass classClass);
	//根据专业id查询出班级信息
		public List<ClassClass> queryClassWM(int majorid);
	//根据id查询学生信息
		public Student queryStudentOne(String id);
	//重置学生信息根据身份证号重置学生信息
		public String resStudentState(String idcard);
}
