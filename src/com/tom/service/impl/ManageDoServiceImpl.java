package com.tom.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tom.pojo.BDAllInfo;
import com.tom.pojo.ClassBDInfo;
import com.tom.pojo.ClassClass;
import com.tom.pojo.Guardian;
import com.tom.pojo.Major;
import com.tom.pojo.MajorBDInfo;
import com.tom.pojo.Manage;
import com.tom.pojo.PYCCBDInfo;
import com.tom.pojo.Student;
import com.tom.pojo.TCRelation;
import com.tom.pojo.Teacher;
import com.tom.service.ManageDoService;
import com.tom.service.UsuallyService;
import com.tom.utils.DataBase;

public class ManageDoServiceImpl extends DataBase implements ManageDoService {
	private DataBase db =new DataBase();
	private Connection conn=null;
	private Statement  stmt=null;;
	private ResultSet rs=null;
	private String sqlStr="";
	public Student selectOneStudentInfo(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	public String updateOneStudentInfo(String s_id_card) {
			int flag=0;
			sqlStr="update student set s_state_id=1 " +
					"where s_id_card='"+s_id_card+"'";
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
				return "报道确认失败";
			}
			return "报道确认成功";
		}

	public List<BDAllInfo> quaryAllReportForm() {
		List<BDAllInfo> list=new ArrayList<BDAllInfo>();
		sqlStr="call 新生报到情况一览表()";
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			while(rs.next()){
				BDAllInfo inf=new BDAllInfo();
				inf.setLeibie(rs.getString(1));
				inf.setLqrs(rs.getInt(2));
				inf.setBdrs(rs.getInt(3));
				inf.setWbdrs(rs.getInt(4));
				list.add(inf);
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
		return list;
	}

	public List<ClassClass> queryClassList() {
		List<ClassClass> classlist=new ArrayList<ClassClass>();
		sqlStr="select c_id,c_major_id,c_name from class";
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			while(rs.next()){
				ClassClass inf=new ClassClass();
				inf.setC_id(rs.getInt(1));
				inf.setC_major_id(rs.getInt(2));
				inf.setC_name(rs.getString(3));
				classlist.add(inf);
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
		return classlist;
	}

	public List<Major> queryMajorList() {
		List<Major> majorlist=new ArrayList<Major>();
		sqlStr="select m_id,m_name from major";
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			while(rs.next()){
				Major inf=new Major();
				inf.setM_id(rs.getInt(1));
				inf.setM_name(rs.getString(2));
				majorlist.add(inf);
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
		return majorlist;
	}

	public List<MajorBDInfo> queryMajorBDInfo() {
		List<MajorBDInfo> list=new ArrayList<MajorBDInfo>();
		sqlStr="call 专业级分类汇总()";
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			while(rs.next()){
				MajorBDInfo inf=new MajorBDInfo();
				inf.setZymc(rs.getString(1));
				inf.setLqrs(rs.getInt(2));
				inf.setLqnvsrs(rs.getInt(3));
				inf.setLqnsrs(rs.getInt(4));
				inf.setSdnvsrs(rs.getInt(5));
				inf.setSdnsrs(rs.getInt(6));
				inf.setYbdrs(rs.getInt(7));
				list.add(inf);
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
		return list;
	}

	public List<ClassBDInfo> quaryClassBDInfo() {
		List<ClassBDInfo> list=new ArrayList<ClassBDInfo>();
		sqlStr="call 班级分类汇总()";
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			while(rs.next()){
				ClassBDInfo inf=new ClassBDInfo();
				inf.setBjmc(rs.getString(1));
				inf.setLqrs(rs.getInt(2));
				inf.setLqnvsrs(rs.getInt(3));
				inf.setLqnsrs(rs.getInt(4));
				inf.setSdnvsrs(rs.getInt(5));
				inf.setSdnsrs(rs.getInt(6));
				inf.setYbdrs(rs.getInt(7));
				list.add(inf);
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
		return list;
	}

	public List<PYCCBDInfo> quaryPYCCBDInfo() {
		List<PYCCBDInfo> list=new ArrayList<PYCCBDInfo>();
		sqlStr="call 培养层次分类汇总()";
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			while(rs.next()){
				PYCCBDInfo inf=new PYCCBDInfo();
				inf.setPyce(rs.getString(1));
				inf.setLqrs(rs.getInt(2));
				inf.setLqnvsrs(rs.getInt(3));
				inf.setLqnsrs(rs.getInt(4));
				inf.setSdnvsrs(rs.getInt(5));
				inf.setSdnsrs(rs.getInt(6));
				inf.setYbdrs(rs.getInt(7));
				list.add(inf);
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
		return list;
	}

	public Manage checkManage(Manage manage) {
		Manage manages=new Manage();
		UsuallyService us=new UsuallyServiceImpl(); 
		try {
			sqlStr="select ma_id,ma_state,ma_teacherid from manage where ma_name='"+manage.getMa_name()+"' and ma_password ='"+us.EncoderByMd5(manage.getMa_password())+"'";
		}catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			if(rs.next()){
				manages.setMa_id(rs.getInt(1));
				manages.setMa_state(rs.getInt(2));
				manages.setMa_teacherid(rs.getInt(3));
			}
			//String sql="set global wait_timeout=20";
			//boolean flag=stmt.execute(sql);
			//System.out.println(flag);
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
		if(manages.getMa_id()<1){
			return null;
		}
		return manages;
	}

	public List<Student> queryStudentListFY(int nowpage, int pagesize) {
		List<Student> studentList=new ArrayList<Student>();
		String sqlStr="select s_id_card,s_exam_number,s_student_number,s_name,s_sex,s_age,s_province,s_native_place,s_address,s_riding_section,s_p_id,s_nation,s_tel,s_email,s_dormitory_id,s_train_level,s_education_system,s_class_id,s_family_population,s_state_id,s_note from student limit "+(nowpage-1)*pagesize+","+pagesize;
		conn=db.Connection();
		try {
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			while (rs.next()) {
				Student student=new Student();
				student.setS_id_card(rs.getString("s_id_card"));
				student.setS_exam_number(rs.getString("s_exam_number"));
				student.setS_student_number(rs.getString("s_student_number"));
				student.setS_name(rs.getString("s_name"));
				student.setS_sex(rs.getString("s_sex"));
				student.setS_age(rs.getInt("s_age"));
				student.setS_province(rs.getString("s_province"));
				student.setS_native_place(rs.getString("s_native_place"));
				student.setS_address(rs.getString("s_address"));
				student.setS_riding_section(rs.getString("s_riding_section"));
				student.setS_p_id(rs.getInt("s_p_id"));
				student.setS_nation(rs.getString("s_nation"));
				student.setS_tel(rs.getString("s_tel"));
				student.setS_email(rs.getString("s_email"));
				student.setS_dormitory_id(rs.getString("s_dormitory_id"));
				student.setS_train_level(rs.getString("s_train_level"));
				student.setS_education_system(rs.getString("s_education_system"));
				student.setS_class_id(rs.getInt("s_class_id"));
				student.setS_family_population(rs.getString("s_family_population"));
				student.setS_state_id(rs.getInt("s_state_id"));
				student.setS_note(rs.getString("s_note"));
				studentList.add(student);
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
		return studentList;
	}

	public List<ClassClass> queryTeaClassList(int ma_teacherid) {
		List<ClassClass> classlist=new ArrayList<ClassClass>();
		sqlStr="select class.c_id,class.c_major_id,class.c_name from class,teacher,t_c_connection where class.c_id=t_c_connection.tc_cla_id and teacher.t_id=t_c_connection.tc_tea_id and teacher.t_id="+ma_teacherid;
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			while(rs.next()){
				ClassClass inf=new ClassClass();
				inf.setC_id(rs.getInt(1));
				inf.setC_major_id(rs.getInt(2));
				inf.setC_name(rs.getString(3));
				classlist.add(inf);
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
		return classlist;
	}

	public String xgPwd(String pwd,String oldPwd, String ma_name) {
		UsuallyService us=new UsuallyServiceImpl(); 
		String flag="";
		String pwdOld="";
		sqlStr="select ma_password from manage where ma_name='"+ma_name+"'";
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			if(rs.next()){
				pwdOld=rs.getString(1);
			}
			try {
				if(us.EncoderByMd5(oldPwd).equals(pwdOld)){
					sqlStr="update manage set ma_password='"+us.EncoderByMd5(pwd)+"' where ma_name='"+ma_name+"'";
					int intflag=stmt.executeUpdate(sqlStr);
					if(intflag==1){
						flag="密码修改成功";
					}else{
						flag="密码修改失败";
					}
				}else{
					flag="旧密码输入错误";
				}
			}catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
		return flag;
	}

	public List<Teacher> queryTeacher() {
		List<Teacher> teacherlist=new ArrayList<Teacher>();
		sqlStr="select t_id,t_name,t_sex,t_tel,t_email from teacher";
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			while(rs.next()){
				Teacher teacher=new Teacher();
				teacher.setT_id(rs.getInt(1));
				teacher.setT_name(rs.getString(2));
				teacher.setT_sex(rs.getString(3));
				teacher.setT_tel(rs.getString(4));
				teacher.setT_email(rs.getString(5));
				teacherlist.add(teacher);
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
		return teacherlist;
	}

	public List<Manage> queryManage() {
		List<Manage> managelist=new ArrayList<Manage>();
		sqlStr="select ma_id,ma_name,ma_del,ma_state,ma_teacherid,t_name from manage,teacher where teacher.t_id=manage.ma_teacherid";
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			while(rs.next()){
				Manage manage=new Manage();
				manage.setMa_id(rs.getInt(1));
				manage.setMa_name(rs.getString(2));
				manage.setMa_del(rs.getInt(3));
				manage.setMa_state(rs.getInt(4));
				manage.setMa_teacherid(rs.getInt(5));
				manage.setT_name(rs.getString(6));
				managelist.add(manage);
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
		return managelist;
	}

	public String addManage(Manage manage) {
		int flag=0;
		UsuallyService us=new UsuallyServiceImpl(); 
		try {
			sqlStr="insert into manage(ma_name,ma_password,ma_state,ma_teacherid) values('"+manage.getMa_name()+"','"+us.EncoderByMd5(manage.getMa_password())+"',"+manage.getMa_state()+","+manage.getMa_teacherid()+")";
			System.out.println(sqlStr);
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
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag==0){
			return "添加失败";
		}
		return "添加成功";
	}

	public String addTeacher(Teacher teacher) {
		int flag=0;
		sqlStr="insert into teacher(t_name,t_sex,t_tel,t_email) values('"+teacher.getT_name()+"','"+teacher.getT_sex()+"','"+teacher.getT_tel()+"','"+teacher.getT_email()+"')";
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
			return "添加失败";
		}
		return "添加成功";
	}
	public void delTC(int t_id){
		String sqlS="delete from t_c_connection where tc_tea_id="+t_id;
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			stmt.execute(sqlS);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String addTC(int t_id, int c_id) {
		int flag=0;
		sqlStr="insert into t_c_connection(tc_tea_id,tc_cla_id) values("+t_id+","+c_id+")";
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
			return "修改失败";
		}
		return "修改成功";
	}

	public List<TCRelation> queryTC() {
		List<TCRelation> tCRelationlist=new ArrayList<TCRelation>();
		sqlStr="select tc_id,tc_tea_id,tc_cla_id from t_c_connection";
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			while(rs.next()){
				TCRelation tCRelation=new TCRelation();
				tCRelation.setTc_id(rs.getInt(1));
				tCRelation.setTc_tea_id(rs.getInt(2));
				tCRelation.setTc_cla_id(rs.getInt(3));
				tCRelationlist.add(tCRelation);
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
		return tCRelationlist;
	}
	//查询所有专业
	public List<Major> queryMajorAll() {
		List<Major> majorlist=new ArrayList<Major>();
		sqlStr="select m_id,d_id,m_name,training_level from major";
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			while(rs.next()){
				Major major=new Major();
				major.setM_id(rs.getInt(1));
				major.setD_id(rs.getInt(2));
				major.setM_name(rs.getString(3));
				major.setTraining_level(rs.getString(4));
				majorlist.add(major);
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
		return majorlist;
	}
	//添加专业
	public String insertMajor(Major major) {
		int flag=0;
		sqlStr="insert into major(d_id,m_name,training_level) values(1,'"+major.getM_name()+"','"+major.getTraining_level()+"')";
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
			return "添加失败";
		}
		return "添加成功";
	}
	//查询所有班级
	public List<ClassClass> queryClassAll() {
		List<ClassClass> classClasslist=new ArrayList<ClassClass>();
		sqlStr="select c_id,c_major_id,c_name from class";
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			while(rs.next()){
				ClassClass classClass=new ClassClass();
				classClass.setC_id(rs.getInt(1));
				classClass.setC_major_id(rs.getInt(2));
				classClass.setC_name(rs.getString(3));
				classClasslist.add(classClass);
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
		return classClasslist;
	}
	//插入班级
	public String insertClass(ClassClass classClass) {
		int flag=0;
		sqlStr="insert into class(c_major_id,c_name) values("+classClass.getC_major_id()+",'"+classClass.getC_name()+"')";
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
			return "添加失败";
		}
		return "添加成功";
	}

	public List<ClassClass> queryClassWM(int majorid) {
		List<ClassClass> classClasslist=new ArrayList<ClassClass>();
		sqlStr="select c_id,c_name from class where c_major_id ="+majorid;
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			while(rs.next()){
				ClassClass classClass=new ClassClass();
				classClass.setC_id(rs.getInt(1));
				classClass.setC_name(rs.getString(2));
				classClasslist.add(classClass);
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
		return classClasslist;
	}

	public Student queryStudentOne(String id) {
		Guardian guardian=new Guardian();
		Student student=new Student();
		String sqlStr="select s_exam_number,s_student_number,s_name,s_sex,s_age,s_province,s_native_place,s_address,s_riding_section,s_p_id,s_nation,s_tel,s_email,s_dormitory_id,s_train_level,s_education_system,s_class_id,s_family_population,s_state_id,s_note,p_political_status from student,politicsstatus where politicsstatus.p_id=student.s_p_id and s_id_card='"+id+"'";
		conn=db.Connection();
		try {
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sqlStr);
			if (rs.next()) {
				student.setS_id_card(id);
				student.setS_exam_number(rs.getString("s_exam_number"));
				student.setS_student_number(rs.getString("s_student_number"));
				student.setS_name(rs.getString("s_name"));
				student.setS_sex(rs.getString("s_sex"));
				student.setS_age(rs.getInt("s_age"));
				student.setS_province(rs.getString("s_province"));
				student.setS_native_place(rs.getString("s_native_place"));
				student.setS_address(rs.getString("s_address"));
				student.setS_riding_section(rs.getString("s_riding_section"));
				student.setS_p_id(rs.getInt("s_p_id"));
				student.setS_nation(rs.getString("s_nation"));
				student.setS_tel(rs.getString("s_tel"));
				student.setS_email(rs.getString("s_email"));
				student.setS_dormitory_id(rs.getString("s_dormitory_id"));
				student.setS_train_level(rs.getString("s_train_level"));
				student.setS_education_system(rs.getString("s_education_system"));
				student.setS_class_id(rs.getInt("s_class_id"));
				student.setS_family_population(rs.getString("s_family_population"));
				student.setS_state_id(rs.getInt("s_state_id"));
				student.setS_note(rs.getString("s_note"));
				student.setP_political_status(rs.getString("p_political_status"));
			}
			String sql2="select g_name1,g_tel1,g_name2,g_tel2 from guardian where g_id_card='"+student.getS_id_card()+"'";
			System.out.println(sql2);
			rs= stmt.executeQuery(sql2);
			if (rs.next()) {
				guardian.setG_name1(rs.getString("g_name1"));
				guardian.setG_tel1(rs.getString("g_tel1"));
				guardian.setG_name2(rs.getString("g_name2"));
				guardian.setG_tel2(rs.getString("g_tel2"));
			}
			student.setGuardian(guardian);
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

	public String resStudentState(String idcard) {
		int flag=0;
		sqlStr="delete from guardian where g_id_card='"+idcard+"'";
		String sqlStr1="select s_exam_number from student where s_id_card='"+idcard+"'";
		
		
		System.out.println(sqlStr);
		try {
			conn=db.Connection();
			stmt=conn.createStatement();
			flag=stmt.executeUpdate(sqlStr);
			String s_exam_number="";
			rs= stmt.executeQuery(sqlStr1);
			if (rs.next()) {
				s_exam_number=rs.getString(1);
			}
			String sql1="update  student set s_id_card='',s_dormitory_id=0,s_state_id=4 where s_exam_number='"+s_exam_number+"'";
			flag=stmt.executeUpdate(sql1);
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
			return "重置失败";
		}
		return "重置成功";
	}
	
}
