package com.tom.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.tom.pojo.Politicsstatus;
import com.tom.service.UsuallyService;
import com.tom.service.impl.UsuallyServiceImpl;

public class UsuallyAction extends ActionSupport {
	private UsuallyService usuallyService=new UsuallyServiceImpl();
	private InputStream textStream;
		
		public InputStream getTextStream() {
			return textStream;
		}
		public void setTextStream(InputStream textStream) {
			this.textStream = textStream;
		}
	public String selectZZMM(){
		List<Politicsstatus> politicsstatusList=usuallyService.queryPoliticsstatus();
		JSONArray json=JSONArray.fromObject(politicsstatusList);
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
