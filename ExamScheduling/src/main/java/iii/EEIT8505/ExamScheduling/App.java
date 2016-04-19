package iii.EEIT8505.ExamScheduling;

import java.io.FileInputStream;

import javax.swing.text.html.HTMLDocument.Iterator;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;

import java.io.*;
import java.util.*;


public class App 
{

public static void main(String[] args) throws Exception {

// C:\201304WorkJavaPlace\\Member_test\\WebContent\\updata\\testExl.xlsx

try {

POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(

"C:\\airline.xls"));

HSSFWorkbook wb = new HSSFWorkbook(fs);

 

HSSFSheet sheet = wb.getSheetAt(0);

HSSFRow row = sheet.getRow(0);

HSSFCell cell = row.getCell((short) 0);

String msg = cell.getStringCellValue();

System.out.println(msg);

 

 

// 取最後一行數

System.out.println("最後一行: " + sheet.getLastRowNum());

 

// 取指定行數的最後一列數

System.out.println("共列: " + row.getLastCellNum());

 

 

// 取指定行數的某一列的數

System.out.println("answer1: "+ row.getCell(0) );

System.out.println("answer2: "+ row.getCell(1) );

System.out.println("answer3: "+ row.getCell(2) );

System.out.println("answer4: "+ row.getCell(3) );

 

HSSFRow row2 = sheet.getRow(0);

 

java.util.Iterator<Cell> iter = row2.iterator();

while(iter.hasNext())

{

System.out.println(iter.next());

 

}

 

 

//Iterator rowTopTotal = sheet.;

 

 

HSSFCell cell2 = row.getCell((short) 0);

String msg2= cell.getStringCellValue();

System.out.println(msg2);

 

} catch (Exception e) {

e.printStackTrace();

}

}

}

 