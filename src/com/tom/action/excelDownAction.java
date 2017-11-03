package com.tom.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.tom.service.BasicinfoService;
import com.tom.service.impl.BasicinfoServiceImpl;

public class excelDownAction {
	public static final String FILE_SEPARATOR = System.getProperties()
			.getProperty("file.separator");
	public String excelDownFun1(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		String docsPath = request.getSession().getServletContext()
				.getRealPath("docs");
		String fileName = "新生基本信息统计表.xlsx";
		String filePath = docsPath + FILE_SEPARATOR + fileName;
		try {
			// 输出流
			OutputStream os = new FileOutputStream(filePath);
			// 工作区
			XSSFWorkbook wb = new XSSFWorkbook();
			XSSFSheet sheet = wb.createSheet("test");
			BasicinfoService bs=new BasicinfoServiceImpl();
			List<String[]> stringlist=bs.basicinfo();
			for(int i=0;i<stringlist.size()+1;i++){
				// 创建第一个sheet
				// 生成第一行
				XSSFRow row = sheet.createRow(i);
				// 给这一行的第一列赋值
				if(i==0){
					row.createCell(0).setCellValue("学院名称");
					row.createCell(1).setCellValue("姓名");
					row.createCell(2).setCellValue("专业");
					row.createCell(3).setCellValue("班级");
					row.createCell(4).setCellValue("培养层次");
					row.createCell(5).setCellValue("学制");
					row.createCell(6).setCellValue("宿舍号");
					row.createCell(7).setCellValue("性别");
					row.createCell(8).setCellValue("出生年月");
					row.createCell(9).setCellValue("民族");
					row.createCell(10).setCellValue("政治面貌");
					row.createCell(11).setCellValue("身份证号码");
					row.createCell(12).setCellValue("籍贯");
					row.createCell(13).setCellValue("家庭住址");
					row.createCell(14).setCellValue("乘车区间");
					row.createCell(15).setCellValue("监护人姓名1");
					row.createCell(16).setCellValue("联系电话");
					row.createCell(17).setCellValue("监护人姓名2");
					row.createCell(18).setCellValue("联系电话");
					row.createCell(19).setCellValue("家庭人口数");
					row.createCell(20).setCellValue("本人电话");
				}else{
				// 给这一行的第一列赋值
					for(int j=0;j<stringlist.get(i-1).length;j++){
						row.createCell(j).setCellValue(stringlist.get(i-1)[j]);
					}
				}
				System.out.println(stringlist.get(0)[0]);
				System.out.println(i);
			}
			/*for (int i = 0; i < 1000; i++) {
				// 创建第一个sheet
				// 生成第一行
				XSSFRow row = sheet.createRow(i);
				// 给这一行的第一列赋值
				row.createCell(0).setCellValue("column1");
				// 给这一行的第一列赋值
				row.createCell(1).setCellValue("column2");
				System.out.println(i);
			}*/
			// 写文件
			wb.write(os);
			// 关闭输出流
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		download(filePath, response);
		return null;
	}
	private void download(String path, HttpServletResponse response) {
		try {
			// path是指欲下载的文件的路径。
			File file = new File(path);
			// 取得文件名。
			String filename = file.getName();
			// 以流的形式下载文件。
			InputStream fis = new BufferedInputStream(new FileInputStream(path));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			// 清空response
			response.reset();
			// 设置response的Header
			response.addHeader("Content-Disposition", "attachment;filename="
					+ new String(filename.getBytes(),"ISO-8859-1"));
			response.addHeader("Content-Length", "" + file.length());
			OutputStream toClient = new BufferedOutputStream(
					response.getOutputStream());
			response.setContentType("application/vnd.ms-excel;charset=gb2312");
			toClient.write(buffer);
			toClient.flush();
			toClient.close();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
}
