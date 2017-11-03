package com.tom.service;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.tom.pojo.Politicsstatus;

public interface UsuallyService {
	//根据班级id返回班级名称
		public String selectClassname(int id);
		//根据状态id返回状态名称
		public String selectStatename(int id);
	//查询政治面貌分类
		public List<Politicsstatus> queryPoliticsstatus();
	// 接收对象并检查对象
		public String checkRequestStr(HttpServletRequest request, String str);
		public String crsSql(HttpServletRequest request, String str);
		//md5
		public String getMD5(InputStream fis);
		public String EncoderByMd5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException;
}
