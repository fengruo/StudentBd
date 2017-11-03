package com.tom.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UtilCommon {
	public static String getSerial(Date date, int index) {
		long msel = date.getTime();
		SimpleDateFormat fm = new SimpleDateFormat("MMddyyyyHHmmssSS");
		msel += index;
		date.setTime(msel);
		String serials = fm.format(date);
		return serials;
	}
	// 检查是否是否是Excel格式
	public static boolean checkIsExcel(String excelStr) {
		boolean flag = false;
		if (excelStr != null) {
			if (excelStr.equalsIgnoreCase(".xls")
					|| excelStr.equalsIgnoreCase(".xlsx")
					) {
				flag = true;
			}
		}
		return flag;
	}
    public static Date StrToDate(String str) throws ParseException{
    	return new SimpleDateFormat("MM/dd/yyyy").parse(str);
    }
}