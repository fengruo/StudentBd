package com.tom.test;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import com.tom.service.UsuallyService;
import com.tom.service.impl.UsuallyServiceImpl;
import com.tom.utils.Mysqlread;

public class Test {
	@org.junit.Test
	public void password(){
		String str="admin";
		UsuallyService usuallyService=new UsuallyServiceImpl();
		try {
			System.out.println(usuallyService.EncoderByMd5(str));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@org.junit.Test
	public void fun2(){
		String[] mysqlmessage=Mysqlread.message;
		System.out.println(mysqlmessage[2]);
	}
}
