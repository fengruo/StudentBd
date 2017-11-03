package com.tom.action;


import java.io.File;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import com.opensymphony.xwork2.ActionSupport;
import com.tom.pojo.Student;
import com.tom.service.ExcelToDBService;
import com.tom.service.UsuallyService;
import com.tom.service.impl.ExcelToDBServiceImpl;
import com.tom.service.impl.UsuallyServiceImpl;
import com.tom.utils.ReadExcel;
import com.tom.utils.UtilCommon;


public class FileUpdataAction extends ActionSupport{
			/**
			* 
			*/
			private UsuallyService usuallyService=new UsuallyServiceImpl();
			private static final long serialVersionUID = 1L;
			private File fileupload; // 和JSP中input标记name同名
			private String excelUrl;
			private String attachmentUrl;
			private String fileRealName;
			// Struts2拦截器获得的文件名,命名规则，File的名字+FileName
			// 如此处为 'fileupload' + 'FileName' = 'fileuploadFileName'
			private String fileuploadFileName; // 上传来的文件的名字
			private InputStream textStream;
			public InputStream getTextStream() {
				return textStream;
			}
			public void setTextStream(InputStream textStream) {
				this.textStream = textStream;
			}
			public String uploadFile() {
			String info="";
			String extName = ""; // 保存文件拓展名
			String newFileName = ""; // 保存新的文件名
			String nowTimeStr = ""; // 保存当前时间
			SimpleDateFormat sDateFormat;
			Random r = new Random();
			String savePath = ServletActionContext.getServletContext().getRealPath(
					""); // 获取项目根路径
			savePath = savePath + "/file/";
			// 生成随机文件名：当前年月日时分秒+五位随机数（为了在实际项目中防止文件同名而进行的处理）
			int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000; // 获取随机数
			sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss"); // 时间格式化的格式
			nowTimeStr = sDateFormat.format(new Date()); // 当前时间
			// 获取拓展名
			if (fileuploadFileName.lastIndexOf(".")>= 0) {
				extName = fileuploadFileName.substring(fileuploadFileName
						.lastIndexOf("."));
			}
			try {
				newFileName = nowTimeStr + rannum + extName; // 文件重命名后的名字
				String filePath = savePath + newFileName;
				filePath = filePath.replace("\\", "/");
				//检查上传的是否是图片
				if (UtilCommon.checkIsExcel(extName)) {
					FileUtils.copyFile(fileupload, new File(filePath));
					//System.out.println(fileuploadFileName+"*********"+filePath);
					info="{\"info\":\"<font color='red'>" + fileuploadFileName
							+ "上传成功!</font>\",\"url\":\"" + filePath + "\",\"filename\":\"" + fileuploadFileName+"\"}";
					
				} else {
					info="{\"info\":\"<font color='red'>上传的文件类型错误，请选择xsl或xslx类型的文件!</font>\"}";
				}
			} catch (IOException e) {
				e.printStackTrace();
				info="上传失败，出错啦!";
			}
			try {
				textStream = new ByteArrayInputStream(info.getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return SUCCESS;
			}
			public String insertDBExcel() throws Exception {
					ExcelToDBService etdb=new ExcelToDBServiceImpl();
					String excel2003_2007 =excelUrl;
			        String excel2010 = excelUrl;
			        List<Student> list=null;
			        if(excel2003_2007.endsWith("xls")){
			        // read the 2003-2007 excel
			        	list = new ReadExcel().readExcel(excel2003_2007);
			        if (list != null) {
			            	etdb.insertExcel("insert into student(s_exam_number, s_name, s_sex, s_province,s_train_level,s_class_id,s_dormitory_id) values", list);
			        }
			        System.out.println("======================================");
			        }else if(excel2010.endsWith("xlsx")){
			        // read the 2010 excel
			        	list = new ReadExcel().readExcel(excel2010);
			        if (list != null) {
			            	etdb.insertExcel("insert into student(s_exam_number, s_name, s_sex, s_province,s_train_level,s_class_id,s_dormitory_id) values", list);
			        }
			        }
							//etdb.insertExcel("insert into student(s_exam_number, s_name, s_sex, s_province,s_train_level,s_class_id,s_dormitory_id) values(?,?,?,?,?,?,?)", student);
			        JSONArray json=JSONArray.fromObject(list);
			        textStream = new ByteArrayInputStream(json.toString().getBytes("UTF-8"));
			        return SUCCESS;
			}
			public File getFileupload() {
			return fileupload;
			}
			
			public void setFileupload(File fileupload) {
			this.fileupload = fileupload;
			}



public String getExcelUrl() {
	return excelUrl;
}
public void setExcelUrl(String excelUrl) {
	this.excelUrl = excelUrl;
}
public String getAttachmentUrl() {
return attachmentUrl;
}

public void setAttachmentUrl(String attachmentUrl) {
this.attachmentUrl = attachmentUrl;
}

public String getFileRealName() {
return fileRealName;
}

public void setFileRealName(String fileRealName) {
this.fileRealName = fileRealName;
}
public String getFileuploadFileName() {
return fileuploadFileName;
}

public void setFileuploadFileName(String fileuploadFileName) {
this.fileuploadFileName = fileuploadFileName;
}

}
