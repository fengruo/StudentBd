package com.tom.utils;


import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.tom.common.Common;
import com.tom.common.Util;
import com.tom.pojo.Student;


/**
 * @author Hongten
 * @created 2014-5-20
 */
public class ReadExcel {
    
    /**
     * read the Excel file
     * @param path the path of the Excel file
     * @return
     * @throws IOException
     */
    public List<Student> readExcel(String path) throws IOException {
        if (path == null || Common.EMPTY.equals(path)) {
            return null;
        } else {
            String postfix = Util.getPostfix(path);
            if (!Common.EMPTY.equals(postfix)) {
                if (Common.OFFICE_EXCEL_2003_POSTFIX.equals(postfix)) {
                    return readXls(path);
                } else if (Common.OFFICE_EXCEL_2010_POSTFIX.equals(postfix)) {
                    return readXlsx(path);
                }
            } else {
                System.out.println(path + Common.NOT_EXCEL_FILE);
            }
        }
        return null;
    }

    /**
     * Read the Excel 2010
     * @param path the path of the excel file
     * @return
     * @throws IOException
     */
    public List<Student> readXlsx(String path) throws IOException {
        System.out.println(Common.PROCESSING + path);
        InputStream is = new FileInputStream(path);
        XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
        Student student = null;
        List<Student> list = new ArrayList<Student>();
        // Read the Sheet
        for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
            XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
            if (xssfSheet == null) {
                continue;
            }
            // Read the Row
            for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
                XSSFRow xssfRow = xssfSheet.getRow(rowNum);
                if (xssfRow != null) {
                    student = new Student();
                    XSSFCell s_exam_number = xssfRow.getCell(2);
                    XSSFCell s_name = xssfRow.getCell(3);
                    XSSFCell s_sex = xssfRow.getCell(4);
                    XSSFCell s_province = xssfRow.getCell(1);
                    XSSFCell s_train_level = xssfRow.getCell(0);
                    DecimalFormat dfs = new DecimalFormat("0");
                    String  s_class_id = dfs.format(xssfRow.getCell(5).getNumericCellValue());
                    XSSFCell s_dormitory_id = xssfRow.getCell(6);
					student.setS_exam_number(getValue(s_exam_number));
					student.setS_name(getValue(s_name));
					student.setS_sex(getValue(s_sex));
					student.setS_province(getValue(s_province));
					student.setS_train_level(getValue(s_train_level));
					student.setS_class_id(Integer.parseInt(s_class_id));
					student.setS_dormitory_id(getValue(s_dormitory_id));
                    list.add(student);
                }
            }
        }
        return list;
    }

    /**
     * Read the Excel 2003-2007
     * @param path the path of the Excel
     * @return
     * @throws IOException
     */
    public List<Student> readXls(String path) throws IOException {
        System.out.println(Common.PROCESSING + path);
        InputStream is = new FileInputStream(path);
        HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
        Student student = null;
        List<Student> list = new ArrayList<Student>();
        // Read the Sheet
        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
            if (hssfSheet == null) {
                continue;
            }
            // Read the Row
            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
                HSSFRow hssfRow = hssfSheet.getRow(rowNum);
                if (hssfRow != null) {
                    student = new Student();
                    HSSFCell s_exam_number = hssfRow.getCell(2);
					HSSFCell s_name = hssfRow.getCell(3);
					HSSFCell s_sex = hssfRow.getCell(4);
					HSSFCell s_province = hssfRow.getCell(1);
					HSSFCell s_train_level = hssfRow.getCell(0);
					DecimalFormat dfs = new DecimalFormat("0");
	                String  s_class_id = dfs.format(hssfRow.getCell(5).getNumericCellValue());
					HSSFCell s_dormitory_id = hssfRow.getCell(6);
					System.out.println("*********************");
					System.out.println(getValue(s_exam_number));
					student.setS_exam_number(getValue(s_exam_number));
					student.setS_name(getValue(s_name));
					student.setS_sex(getValue(s_sex));
					student.setS_province(getValue(s_province));
					student.setS_train_level(getValue(s_train_level));
					student.setS_class_id(Integer.parseInt(s_class_id));
					student.setS_dormitory_id(getValue(s_dormitory_id));
                    list.add(student);
                }
            }
        }
        return list;
    }

    @SuppressWarnings("static-access")
    private String getValue(XSSFCell xssfRow) {
        if (xssfRow.getCellType() == xssfRow.CELL_TYPE_BOOLEAN) {
            return String.valueOf(xssfRow.getBooleanCellValue());
        } else if (xssfRow.getCellType() == xssfRow.CELL_TYPE_NUMERIC) {
            return String.valueOf(xssfRow.getNumericCellValue());
        } else {
            return String.valueOf(xssfRow.getStringCellValue());
        }
    }

    @SuppressWarnings("static-access")
    private String getValue(HSSFCell hssfCell) {
        if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
            return String.valueOf(hssfCell.getBooleanCellValue());
        } else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
            return String.valueOf(hssfCell.getNumericCellValue());
        } else {
            return String.valueOf(hssfCell.getStringCellValue());
        }
    }
} 