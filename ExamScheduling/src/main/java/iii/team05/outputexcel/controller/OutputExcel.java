package iii.team05.outputexcel.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;


public class OutputExcel {

	private InputStream inputStream;

	public String export() {
		try {
			HSSFWorkbook wb = new HSSFWorkbook();
			HSSFSheet sheet = wb.createSheet("new sheet");
			sheet.setDefaultColumnWidth(20); // 默认列宽

			HSSFFont font = wb.createFont();
			font.setFontName("黑体");
			font.setFontHeightInPoints((short) 13);// 设置字体大小
			font.setColor(HSSFColor.WHITE.index); // 字体颜色

			HSSFCellStyle headStyle = wb.createCellStyle(); // 头部样式
			headStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 水平居中
			headStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 下边框
			headStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);// 左边框
			headStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);// 上边框
			headStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);// 右边框
			headStyle.setFillForegroundColor(HSSFColor.TEAL.index);// 设置背景色
			headStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			headStyle.setFont(font);// 选择需要用到的字体格式

			HSSFCellStyle contentStyle = wb.createCellStyle(); // 内容样式
			contentStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 下边框
			contentStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);// 左边框
			contentStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);// 上边框
			contentStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);// 右边框

			HSSFRow row_h = sheet.createRow((short) 0);
			HSSFCell ch = row_h.createCell(0);
			ch.setCellValue("测试导出Excel");
			ch.setCellStyle(headStyle);
			//sheet.addMergedRegion(new Region(0, (short) 0, 0, (short) 2));// 指定合并区域

			// 表头
			HSSFRow row1 = sheet.createRow((short) 1);
			HSSFCell cell_1_0 = row1.createCell(0);
			cell_1_0.setCellValue("姓名");
			cell_1_0.setCellStyle(headStyle);

			HSSFCell cell_1_1 = row1.createCell(1);
			cell_1_1.setCellValue("出生日期");
			cell_1_1.setCellStyle(headStyle);

			HSSFCell cell_1_2 = row1.createCell(2);
			cell_1_2.setCellValue("住址");
			cell_1_2.setCellStyle(headStyle);

			// 内容
			HSSFRow row2 = sheet.createRow(2);
			HSSFCell cell_2_0 = row2.createCell(0);
			cell_2_0.setCellValue("itmyhome");
			cell_2_0.setCellStyle(contentStyle);

			HSSFCell cell_2_1 = row2.createCell(1);
			cell_2_1.setCellValue("1990-05-01");
			cell_2_1.setCellStyle(contentStyle);

			HSSFCell cell_2_2 = row2.createCell(2);
			cell_2_2.setCellValue("北京市昌平区");
			cell_2_2.setCellStyle(contentStyle);

			FileOutputStream fileOut = new FileOutputStream("d:/mysheet.xls"); // 导出路径
			wb.write(fileOut);
			fileOut.close();

			inputStream = new FileInputStream("d:/mysheet.xls"); // 下载

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
}
