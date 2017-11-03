package com.tom.utils;
import java.io.InputStream;
import java.util.Properties;
public class Mysqlread {
    public static final String [] message=readurl();
    private static String[] readurl() {
        String [] message=new String[3];
        try {
        	// 1.通过当前类获取类加载器
			ClassLoader classLoader = Mysqlread.class.getClassLoader();
			// 2.通过类加载器的方法获得一个输入流
			InputStream is = classLoader.getResourceAsStream("mysql.properties");
			// 3.创建一个properties对象
			Properties prop = new Properties();
			// 4.加载输入流
			prop.load(is);
			// 5.获取相关参数的值
            message[0]=prop.getProperty("url");
            message[1]=prop.getProperty("user");
            message[2]=prop.getProperty("password");
            is.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return message;
    }
}