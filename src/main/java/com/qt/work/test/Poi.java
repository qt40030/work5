package com.qt.work.test;

import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class Poi {

	public void exportExcelTpl(HttpServletResponse response)throws Exception{
		XSSFWorkbook workbook=new XSSFWorkbook();
		XSSFSheet sheet=workbook.createSheet("user");
		XSSFRow row=sheet.createRow(0);
		XSSFCell cell0=row.createCell(0);
		cell0.setCellValue("账号");
		XSSFCell cell1=row.createCell(1);
		cell1.setCellValue("姓名");
		XSSFCell cell2=row.createCell(2);
		cell2.setCellValue("密码");
		
		response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition", "attachment;filename=test.xlsx");
		OutputStream out=response.getOutputStream();
		workbook.write(out);
		workbook.close();
		out.close();
		
	}
	
}
