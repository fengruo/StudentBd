package com.tom.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
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
import com.tom.service.ManageDoService;
import com.tom.service.UsuallyService;
import com.tom.service.impl.ManageDoServiceImpl;
import com.tom.service.impl.UsuallyServiceImpl;

public class ManageDoAction extends ActionSupport{
	private ManageDoService manageDoService=new ManageDoServiceImpl();
	private UsuallyService usuallyService=new UsuallyServiceImpl();
	private InputStream textStream;
	private Manage manage;
	private Major major;
	private ClassClass classClass;
	
	public Major getMajor() {
		return major;
	}
	public void setMajor(Major major) {
		this.major = major;
	}
	public ClassClass getClassClass() {
		return classClass;
	}
	public void setClassClass(ClassClass classClass) {
		this.classClass = classClass;
	}
	public Manage getManage() {
		return manage;
	}
	public void setManage(Manage manage) {
		this.manage = manage;
	}
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
	//查询总类别报表
	public String quaryAllReportFormAction(){
		List<BDAllInfo> list=manageDoService.quaryAllReportForm();
		JSONArray json=JSONArray.fromObject(list);
		try {
			textStream = new ByteArrayInputStream(json.toString().getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(json);
		return SUCCESS;
	}
	//更新一条学生信息状态为报道
	public String updateOneStudentInfo(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String s_id_card=usuallyService.checkRequestStr(request, "s_id_card");
		String json=manageDoService.updateOneStudentInfo(s_id_card);
		try {
			textStream = new ByteArrayInputStream(json.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(json);
		return SUCCESS;
	}
	//查询出所有专业
			public String queryMajorList(){
				List<Major> majorlist=manageDoService.queryMajorList();
				JSONArray json=JSONArray.fromObject(majorlist);
				try {
					textStream = new ByteArrayInputStream(json.toString().getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(json);
				return SUCCESS;
			}
			//查询出所有班级
			public String queryClassList(){
				List<ClassClass> ClassClassList=manageDoService.queryClassList();
				JSONArray json=JSONArray.fromObject(ClassClassList);
				try {
					textStream = new ByteArrayInputStream(json.toString().getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(json);
				return SUCCESS;
			}
			//专业分类报表
			public String quaryMajorBDInfo(){
				List<MajorBDInfo> list=manageDoService.queryMajorBDInfo();
				JSONArray json=JSONArray.fromObject(list);
				try {
					textStream = new ByteArrayInputStream(json.toString().getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(json);
				return SUCCESS;
			}
			//班级分类报表
			public String quaryClassBDInfo(){
				List<ClassBDInfo> list=manageDoService.quaryClassBDInfo();
				JSONArray json=JSONArray.fromObject(list);
				try {
					textStream = new ByteArrayInputStream(json.toString().getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(json);
				return SUCCESS;
			}
			//培养层次报表
			public String quaryPYCCBDInfo(){
				List<PYCCBDInfo> list=manageDoService.quaryPYCCBDInfo();
				JSONArray json=JSONArray.fromObject(list);
				try {
					textStream = new ByteArrayInputStream(json.toString().getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(json);
				return SUCCESS;
			}
			//验证管理员登陆
			public String checkmanage(){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				Manage manages=manageDoService.checkManage(manage);
				if(manages==null){
					return "loginFalse";
				}else if(manages.getMa_state()==1){
					session.setAttribute("manageName", manage.getMa_name());
					session.setAttribute("managestate", manages.getMa_state());
					session.setAttribute("teacherid", manages.getMa_teacherid());
					return "loginSuccess";
				}else{
					session.setAttribute("manageName", manage.getMa_name());
					session.setAttribute("managestate", manages.getMa_state());
					session.setAttribute("teacherid", manages.getMa_teacherid());
					return "teacherLoginSuccess";
				}
			}
			//前往管理员登录页面
			public String toManage(){
				return "to";
			}
			//查询学生信息分页
			public String queryStudentsFenYe(){
				HttpServletRequest request = ServletActionContext.getRequest();
				int nowpage=Integer.parseInt(usuallyService.checkRequestStr(request, "nowpage"));
				int pagesize=Integer.parseInt(usuallyService.checkRequestStr(request, "pagesize"));
				try {
					List<Student> studentsList=manageDoService.queryStudentListFY(nowpage, pagesize);
					JSONArray json=JSONArray.fromObject(studentsList);
					System.out.println(json);
					textStream=new ByteArrayInputStream(json.toString().getBytes("utf-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				return SUCCESS;
			}
			//查询教师所在所有班级信息
			public String queryTeaClassList(){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				List<ClassClass> ClassClassList=manageDoService.queryTeaClassList(Integer.parseInt(session.getAttribute("teacherid").toString()));
				JSONArray json=JSONArray.fromObject(ClassClassList);
				try {
					textStream = new ByteArrayInputStream(json.toString().getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(json);
				return SUCCESS;
			}
			//修改密码
			public String xgPwd(){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				String ma_name=session.getAttribute("manageName").toString();
				String oldPwd=usuallyService.checkRequestStr(request, "oldPwd");
				String pwd=usuallyService.checkRequestStr(request, "newPwd");
				String flag=manageDoService.xgPwd(pwd, oldPwd, ma_name);
				flag="{\"flag\":\""+flag+"\"}";
				try {
					textStream = new ByteArrayInputStream(flag.getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(flag);
				return SUCCESS;
			}
			//查询出所有管理员信息
			public String queryManageAll(){
				List<Manage> manageList=manageDoService.queryManage();
				JSONArray json=JSONArray.fromObject(manageList);
				try {
					textStream = new ByteArrayInputStream(json.toString().getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(json);
				return SUCCESS;
			}
			//查询出所有教师信息
			public String queryTeacherAll(){
				List<Teacher> teacherList=manageDoService.queryTeacher();
				JSONArray json=JSONArray.fromObject(teacherList);
				try {
					textStream = new ByteArrayInputStream(json.toString().getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(json);
				return SUCCESS;
			}
			//插入一条管理员信息
			public String addManageOne(){
				HttpServletRequest request = ServletActionContext.getRequest();
				try {
					Manage manage=new Manage();
					manage.setMa_name(usuallyService.checkRequestStr(request, "ma_name"));
					manage.setMa_password(usuallyService.checkRequestStr(request, "ma_pwd"));
					manage.setMa_state(Integer.parseInt(usuallyService.checkRequestStr(request, "ma_state")));
					manage.setMa_teacherid(Integer.parseInt(usuallyService.checkRequestStr(request, "ma_teacherid")));
					String flag=manageDoService.addManage(manage);
					flag="{\"flag\":\""+flag+"\"}";
					textStream = new ByteArrayInputStream(flag.getBytes("UTF-8"));
					System.out.println(flag);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return SUCCESS;
			}
			//插入一条教师信息
			public String addTeacherOne(){
				HttpServletRequest request = ServletActionContext.getRequest();
				Teacher teacher=new Teacher();
				teacher.setT_name(usuallyService.checkRequestStr(request, "t_name"));
				teacher.setT_sex(usuallyService.checkRequestStr(request, "t_sex"));
				teacher.setT_tel(usuallyService.checkRequestStr(request, "t_tel"));
				teacher.setT_email(usuallyService.checkRequestStr(request, "t_email"));
				String flag=manageDoService.addTeacher(teacher);
				flag="{\"flag\":\""+flag+"\"}";
				try {
					textStream = new ByteArrayInputStream(flag.getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(flag);
				return SUCCESS;
			}
			//插入教师班级联系
			public String addTCOne(){
				try {
					HttpServletRequest request = ServletActionContext.getRequest();
					int tc_tea_id=Integer.parseInt(usuallyService.checkRequestStr(request, "tc_tea_id"));
					manageDoService.delTC(tc_tea_id);
					String tc_cla_id=usuallyService.checkRequestStr(request, "tc_cla_id");
					String flag="修改成功";
					if(tc_cla_id.length()>0){
						tc_cla_id=tc_cla_id.substring(0, tc_cla_id.length()-1);
						String te[]=tc_cla_id.split(",");
						//System.out.println(tc_cla_id);
						if(te.length>0){
							for (String string : te) {
								flag=manageDoService.addTC(tc_tea_id, Integer.parseInt(string));
							}}
					}
					flag="{\"flag\":\""+flag+"\"}";
					textStream = new ByteArrayInputStream(flag.getBytes("UTF-8"));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return SUCCESS;
			}
			//查询出所有教师班级关系
			public String queryTC(){
				List<TCRelation> tCRelationlist=manageDoService.queryTC();
				JSONArray json=JSONArray.fromObject(tCRelationlist);
				try {
					textStream = new ByteArrayInputStream(json.toString().getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(json);
				return SUCCESS;
			}
			//查询出所有专业信息
			public String queryMajor(){
				List<Major> majorlist=manageDoService.queryMajorAll();
				JSONArray json=JSONArray.fromObject(majorlist);
				try {
					textStream = new ByteArrayInputStream(json.toString().getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(json);
				return SUCCESS;
			}
			//添加专业信息
			public String insertMajor(){
				String flag=manageDoService.insertMajor(major);
				flag="{\"flag\":\""+flag+"\"}";
				try {
					textStream = new ByteArrayInputStream(flag.getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(flag);
				return SUCCESS;
			}
			//根据专业查询班级信息
			public String queryClassWM(){
				HttpServletRequest request = ServletActionContext.getRequest();
				int majorid=Integer.parseInt(usuallyService.checkRequestStr(request, "majorid"));
				List<ClassClass> classClasslist=manageDoService.queryClassWM(majorid);
				JSONArray json=JSONArray.fromObject(classClasslist);
				try {
					textStream = new ByteArrayInputStream(json.toString().getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(json);
				return SUCCESS;
			}
			
			//添加班级信息
			public String insertClass(){
				String flag=manageDoService.insertClass(classClass);
				flag="{\"flag\":\""+flag+"\"}";
				try {
					textStream = new ByteArrayInputStream(flag.getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(flag);
				return SUCCESS;
			}
			//查看一条信息
			public String queryOneStudent(){
				HttpServletRequest request = ServletActionContext.getRequest();
				String id=usuallyService.checkRequestStr(request, "s_id_card");
				Student student=manageDoService.queryStudentOne(id);
				try {
					if(student.getS_exam_number().length()<1){
					String json="{\"flag\":\"暂无信息\"}";
					textStream = new ByteArrayInputStream(json.getBytes("UTF-8"));
					}else{
					JSONObject json=JSONObject.fromObject(student);
					textStream = new ByteArrayInputStream(json.toString().getBytes("UTF-8"));
					}
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return SUCCESS;
			}
			//重置一条信息
			public String resStudent(){
				HttpServletRequest request = ServletActionContext.getRequest();
				String idcard=usuallyService.checkRequestStr(request, "s_id_card");
				String json=manageDoService.resStudentState(idcard);
				try {
					textStream = new ByteArrayInputStream(json.toString().getBytes("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(json);
				return SUCCESS;
				
			}
}
