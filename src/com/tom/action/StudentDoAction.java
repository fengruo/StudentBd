package com.tom.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.tom.pojo.BDAllInfo;
import com.tom.pojo.Guardian;
import com.tom.pojo.Student;
import com.tom.service.StudentDoService;
import com.tom.service.UsuallyService;
import com.tom.service.impl.StudentDoServiceImpl;
import com.tom.service.impl.UsuallyServiceImpl;

public class StudentDoAction extends ActionSupport{
	private StudentDoService studentDoService=new StudentDoServiceImpl();
	private UsuallyService usuallyService=new UsuallyServiceImpl();
	private InputStream textStream;
	
	public InputStream getTextStream() {
		return textStream;
	}
	public void setTextStream(InputStream textStream) {
		this.textStream = textStream;
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String quaryOneStudentFormAction(){
		HttpServletRequest request = ServletActionContext.getRequest();
		//String s_exam_number=request.getParameter("s_exam_number");
		String s_exam_number=usuallyService.checkRequestStr(request, "s_exam_number");
		//String studentname=request.getParameter("studentname");
		String studentname=usuallyService.checkRequestStr(request, "studentname");
		Student studentInfo=studentDoService.selectOneStudentInfo(s_exam_number, studentname);
		JSONObject json=JSONObject.fromObject(studentInfo);
		try {
			textStream = new ByteArrayInputStream(json.toString().getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(json);
		return SUCCESS;
	}
	public String updateStudent(){
		HttpServletRequest request = ServletActionContext.getRequest();
		Student student=new Student();
		student.setS_email(usuallyService.checkRequestStr(request, "s_email"));
		student.setS_exam_number(usuallyService.checkRequestStr(request, "s_exam_number"));
		student.setS_note(usuallyService.checkRequestStr(request, "s_note"));
		student.setS_age(Integer.parseInt(usuallyService.checkRequestStr(request, "s_age")));
		student.setS_student_number(usuallyService.checkRequestStr(request, "s_student_number"));
		student.setS_nation(usuallyService.checkRequestStr(request, "s_nation"));
		student.setS_dormitory_id(usuallyService.checkRequestStr(request, "s_dormitory_id"));
		student.setS_native_place(usuallyService.checkRequestStr(request, "s_native_place"));
		student.setS_riding_section(usuallyService.checkRequestStr(request, "s_riding_section"));
		student.setS_address(usuallyService.checkRequestStr(request, "s_address"));
		student.setS_family_population(usuallyService.checkRequestStr(request, "s_family_population"));
		student.setS_p_id(Integer.parseInt(usuallyService.checkRequestStr(request, "s_p_id")));
		student.setS_tel(usuallyService.checkRequestStr(request, "s_tel"));
		student.setS_id_card(usuallyService.checkRequestStr(request, "s_id_card"));
		String json=studentDoService.updateOneStudentInfo(student);
		try {
			textStream = new ByteArrayInputStream(json.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(json);
		return SUCCESS;
	}
	public String insertGuardian(){
		HttpServletRequest request = ServletActionContext.getRequest();
		Guardian guardian=new Guardian();
		guardian.setG_id_card(usuallyService.checkRequestStr(request, "s_id_card"));
		guardian.setG_name1(usuallyService.checkRequestStr(request, "g_name1"));
		guardian.setG_tel1(usuallyService.checkRequestStr(request, "g_tel1"));
		guardian.setG_name2(usuallyService.checkRequestStr(request, "g_name2"));
		guardian.setG_tel2(usuallyService.checkRequestStr(request, "g_tel2"));
		String json=studentDoService.insertGuardian(guardian);
		try {
			textStream = new ByteArrayInputStream(json.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(json);
		return SUCCESS;
	}
	public String getNowState(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String s_id_card=usuallyService.checkRequestStr(request, "s_id_card");
		String json=studentDoService.queryState(s_id_card);
		try {
			textStream = new ByteArrayInputStream(json.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(json);
		return SUCCESS;
	}
	public String toStudent(){
		return "to";
	}
	
}
