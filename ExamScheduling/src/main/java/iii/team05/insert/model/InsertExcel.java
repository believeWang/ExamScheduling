package iii.team05.insert.model;

import iii.team05.examinee.ecmodel.ECHibernateDAO;

import iii.team05.examinee.ecmodel.ECService;
import iii.team05.examinee.ecmodel.ECVO;
import iii.team05.examinee.ecmodel.ESVO;
import iii.team05.examinee.ecmodel.ScoreVO;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * Servlet implementation class InsertExcel
 */
@WebServlet("/upload/poitest.jspx")
public class InsertExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String iiiClass = request.getParameter("iiiClass");
		String method = request.getParameter("_m");
		ECService ecService = new ECService();
		List<String> allClass = ecService.getAllClass();

		
		if ("poi_upload".equals(method)) {
			poi_upload(request, response);
			
		} else {
			if (method == null) { // 初始化
				request.setAttribute("allClass", allClass);
				request.getRequestDispatcher("/upload/upload.jsp").forward(request, response);
			} 
				for (String cs : allClass) {
					if (cs.equals(iiiClass)) {
						// show這個班級的詳細資料
						System.out.println(iiiClass);
						System.out.println(cs);
						List<ECVO> showClass = ecService.getEEIT(cs);
						request.setAttribute("showClass", showClass);
						System.out.println(showClass);
						//request.getRequestDispatcher("/upload/upload.jsp").forward(request, response);
						break;
					}
				

				if ("poi_down".equals(method)) {
					poi_down(request, response);
				}
				}
				}
		}
		
	

	private void poi_upload(HttpServletRequest request,
			HttpServletResponse response) {
		if (ServletFileUpload.isMultipartContent(request)) {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(1024 * 512);
			factory.setRepository(new File("D:/tempload"));
			ServletFileUpload fileUpload = new ServletFileUpload(factory);
			fileUpload.setFileSizeMax(10 * 1024 * 1024);// 设置最大文件大小
			try {
				@SuppressWarnings("unchecked")
				List<FileItem> items = fileUpload.parseRequest(request);// 获取所有表单
				for (FileItem item : items) {
					// 判断当前的表单控件是否是一个普通控件
					if (!item.isFormField()) {
						// 是一个文件控件时
						String excelFileName = new String(item.getName()
								.getBytes(), "utf-8"); // 获取上传文件的名称
						// 上传文件必须为excel类型,根据后缀判断(xls)
						String excelContentType = excelFileName
								.substring(excelFileName.lastIndexOf(".")); // 获取上传文件的类型
						System.out.println("上传文件名:" + excelFileName);
						System.out.println("文件大小:" + item.getSize());
						System.out
								.println("\n---------------------------------------");

						if (".xls".equals(excelContentType)
								|| ".xlsx".equals(excelContentType)) {
							// POIFSFileSystem fileSystem = new POIFSFileSystem(
							// item.getInputStream());
							// 從輸入流創建Workbook
							XSSFWorkbook workbook = new XSSFWorkbook(
									item.getInputStream());
							// 由Workbook的getSheet(0)方法選擇第一個工作表（從0開始）
							XSSFSheet sheet1 = workbook.getSheetAt(0);
							// 取得Sheet表中所包含的總row數
							int rowCnt = sheet1.getPhysicalNumberOfRows();

							ECVO ecvo = null;
							ESVO esvo = null;
							ScoreVO scoreVO = null;
							ECHibernateDAO dao = new ECHibernateDAO();
							DateFormat df = new SimpleDateFormat("dd/MM/yyyy");

							for (int i = 1; i < rowCnt; i++) {
								XSSFRow row = sheet1.getRow(i);

								for (int j = 0; j < row
										.getPhysicalNumberOfCells(); j++) {
							
								}

								// ECVO ECVO 也稱為 Domain objects
								ecvo = new ECVO();
								esvo = new ESVO();
								scoreVO = new ScoreVO();

								// NO
								// String ecno = row.getCell(2).toString(); -->改
								// getStringCellValue()看看
								String ecno = transform(row, 2);
								// 姓名
								// String ecname = row.getCell(3).toString();
								String ecname = transform(row, 3);
								// Email
								// String ecemail = row.getCell(7).toString();
								String ecemail = transform(row, 7);
								// 備註
								// String ecremark1 = row.getCell(1).toString();
								String ecremark1 = transform(row, 1);
								// 是否已約上機
								// Boolean ecstatus = new
								// Boolean(row.getCell(8).toString());
								String status =(transform(row, 8));
								Boolean ecstatus;
								if("是".equals(status)){
									ecstatus = true;
								}else{
									ecstatus=false;
								}
								//班級
								String ecclass = ecno.substring(0, 6);
								// 組別
								float esteamf = Float.parseFloat(transform(row,0));
								Integer esteam = (int) esteamf;
								// 年次
								float esbirthf = Float.parseFloat(transform(
										row, 4));
								Integer esbirth = (int) esbirthf;
								// 畢業學校
								String esschool = transform(row, 5);
								// 性別
								String sex =(transform(row, 6));
								Boolean essex;
								if("男".equals(sex)){
								 essex = true;
								}else{
									essex=false;
								}
								// 最快可以上班日期
								XSSFCell dateCell = row.getCell(13);
								java.sql.Date eshiredate = null;
								if (dateCell != null
										&& dateCell.getCellType() != XSSFCell.CELL_TYPE_BLANK) {
									eshiredate = new java.sql.Date(dateCell
											.getDateCellValue().getTime());
								}
								;
								// 期望薪資
								Integer essalary = getIntFromString(transform(
										row, 14));
								// 呼叫getIntFromString來用, 取代以下兩行
								// float essalaryf =
								// Float.parseFloat(transform(row, 14));
								// Integer essalary = (int) essalaryf;

								// Final Ranking
								Integer esranking = getIntFromString(transform(
										row, 15));
								// 備註2
								String esremark2 = transform(row, 16);
								// 上機考分數
								Integer lab = getIntFromString(transform(row, 9));
								// 面試分數
								Integer interview = getIntFromString(transform(
										row, 11));
								//System.out.println("interview:"+interview);
								// 呼叫getIntFromString來用, 取代以下兩行
								// float interviewf =
								// Float.parseFloat(transform(row, 11));
								// Integer interview = (int) interviewf;

								// 上機考時間(分鐘)
								Integer labtime = getIntFromString(transform(
										row, 10));
								// 呼叫getIntFromString來用, 取代以下兩行
								// float labtimef =
								// Float.parseFloat(transform(row, 10));
								// Integer labtime = (int) labtimef;

								// 線上測驗分數
								Integer onlineex = getIntFromString(transform(
										row, 12));
								// 呼叫getIntFromString來用, 取代以下兩行
								// float onlineexf =
								// Float.parseFloat(transform(row, 12));
								// Integer onlineex = (int) onlineexf;

								ecvo.setEcno(ecno);
								ecvo.setEcname(ecname);
								ecvo.setEcemail(ecemail);
								ecvo.setEcremark1(ecremark1);
								ecvo.setEcstatus(ecstatus);
								ecvo.setEcclass(ecclass);

								esvo.setEcno(ecno);
								esvo.setEsteam(esteam);
								esvo.setEsbirth(esbirth);
								esvo.setEsschool(esschool);
								esvo.setEssex(essex);
								esvo.setEshiredate(eshiredate);
								esvo.setEssalary(essalary);
								esvo.setEsranking(esranking);
								esvo.setEsremark2(esremark2);
								esvo.seteCVO(ecvo);

								scoreVO.setEcno(ecno);
								scoreVO.setLab(lab);
								scoreVO.setInterview(interview);
								scoreVO.setLabtime(labtime);
								scoreVO.setOnlineex(onlineex);
								scoreVO.seteCVO(ecvo);

								// 兩張表加入主表中
								ecvo.seteSVO(esvo);
								ecvo.setScoreVO(scoreVO);
								// 載入進資料庫
								dao.insert(ecvo);						
							}
	
							request.getRequestDispatcher("uploadSucessed.jsp").forward(request, response);
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private void poi_down(HttpServletRequest request,
			HttpServletResponse response) {
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");
		response.setHeader("Content-Disposition",
				"attachment;filename=data.xls");

		ServletOutputStream stream = null;
		try {
			stream = response.getOutputStream();
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFCellStyle style = workbook.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中样式
		HSSFSheet sheet = workbook.createSheet("班級名單");
		// 設定寬度
		sheet.setColumnWidth(0, 1000);
		sheet.setColumnWidth(4, 1000);
		sheet.setColumnWidth(5, 7000); // 學校
		sheet.setColumnWidth(6, 1000);
		sheet.setColumnWidth(7, 7000); // email
		sheet.setColumnWidth(8, 3000);
		sheet.setColumnWidth(9, 2000);
		sheet.setColumnWidth(10, 2000);
		sheet.setColumnWidth(12, 2000);
		sheet.setColumnWidth(14, 3000);
		sheet.setColumnWidth(15, 2000);
		sheet.setColumnWidth(17, 7000);
		// 表頭
		HSSFRow row = sheet.createRow(0);
		// 列
		HSSFCell cell = row.createCell(0);
		cell.setCellValue("組別");
		HSSFCell cell2 = row.createCell(1);
		cell2.setCellValue("備註");
		HSSFCell cell3 = row.createCell(2);
		cell3.setCellValue("NO");
		HSSFCell cell4 = row.createCell(3);
		cell4.setCellValue("姓名");
		HSSFCell cell5 = row.createCell(4);
		cell5.setCellValue("年次");
		HSSFCell cell6 = row.createCell(5);
		cell6.setCellValue("畢業學校");
		HSSFCell cell7 = row.createCell(6);
		cell7.setCellValue("性別");
		HSSFCell cell8 = row.createCell(7);
		cell8.setCellValue("Email");
		HSSFCell cell9 = row.createCell(8);
		cell9.setCellValue("是否已約上機考");
		HSSFCell cell10 = row.createCell(9);
		cell10.setCellValue("上機測驗分數");
		HSSFCell cell11 = row.createCell(10);
		cell11.setCellValue("上機測驗時間");
		HSSFCell cell12 = row.createCell(11);
		cell12.setCellValue("Interview 分數");
		HSSFCell cell13 = row.createCell(12);
		cell13.setCellValue("線上測驗分數");
		HSSFCell cell14 = row.createCell(13);
		cell14.setCellValue("總分");
		HSSFCell cell15 = row.createCell(14);
		cell15.setCellValue("最快可以上班日期");
		HSSFCell cell16 = row.createCell(15);
		cell16.setCellValue("期望薪資");
		HSSFCell cell17 = row.createCell(16);
		cell17.setCellValue("Final Ranking");
		HSSFCell cell18 = row.createCell(17);
		cell18.setCellValue("備註");

		List<ECVO> eeitList = new ECHibernateDAO().getEEIT("EEIT85");

		int i = 1;
		for (ECVO ecVO : eeitList) {
			HSSFRow newrow = sheet.createRow(i);
			newrow.createCell(0).setCellValue(ecVO.geteSVO().getEsteam());
			newrow.createCell(1).setCellValue(ecVO.getEcremark1());
			newrow.createCell(2).setCellValue(ecVO.getEcno());
			newrow.createCell(3).setCellValue(ecVO.getEcname());
			newrow.createCell(4).setCellValue(ecVO.geteSVO().getEsbirth());
			newrow.createCell(5).setCellValue(ecVO.geteSVO().getEsschool());

			newrow.createCell(6).setCellValue(ecVO.geteSVO().getEssex());
			newrow.createCell(7).setCellValue(ecVO.getEcemail());

			newrow.createCell(8).setCellValue(ecVO.getEcstatus());
			newrow.createCell(9).setCellValue(ecVO.getScoreVO().getLab());
			newrow.createCell(10).setCellValue(ecVO.getScoreVO().getLabtime());
			newrow.createCell(11)
					.setCellValue(ecVO.getScoreVO().getInterview());
			newrow.createCell(12).setCellValue(ecVO.getScoreVO().getOnlineex());
			newrow.createCell(13).setCellValue(
					ecVO.getScoreVO().getLab()
							+ ecVO.getScoreVO().getOnlineex()
							+ ecVO.getScoreVO().getInterview());

			// newrow.createCell(14).setCellValue(ecVO.geteSVO().getEshiredate().getTime());
			newrow.createCell(15).setCellValue(ecVO.geteSVO().getEssalary());
			newrow.createCell(16).setCellValue(ecVO.geteSVO().getEsranking());
			newrow.createCell(17).setCellValue(ecVO.geteSVO().getEsremark2());
			i++;
		}

		try {
			workbook.write(stream);
			System.out.println("下载成功");
			stream.flush();
			stream.close();
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// 取得不同類型的值
	public String getCellStringValue(HSSFCell cell) {
		String cellValue = "";
		switch (cell.getCellType()) {
		case HSSFCell.CELL_TYPE_STRING:
			cellValue = cell.getStringCellValue();
			if (cellValue.trim().equals("") || cellValue.trim().length() <= 0)
				cellValue = " ";
			break;
		case HSSFCell.CELL_TYPE_NUMERIC:
			cellValue = String.valueOf(cell.getNumericCellValue());
			break;
		case HSSFCell.CELL_TYPE_FORMULA:
			cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
			cellValue = String.valueOf(cell.getNumericCellValue());
			break;
		case HSSFCell.CELL_TYPE_BLANK:
			cellValue = " ";
			break;
		case HSSFCell.CELL_TYPE_BOOLEAN:
			break;
		case HSSFCell.CELL_TYPE_ERROR:
			break;
		default:
			break;
		}
		return cellValue;
	}

	private String transform(XSSFRow row, int index) {
		String result = "";

		if (row.getCell(index) != null) {
			result = row.getCell(index).toString();
		}

		return result;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	// private double parse(String cell) {
	// if (cell != null && cell.trim().length() > 0) {
	// return Double.parseDouble(cell);
	// } else {
	// return 0.0;
	// }
	// }


	private int getIntFromString(String cell) {
		int result = 0;
		if (cell != null && !(cell.trim().equals(""))) {
			// result = Integer.parseInt(cell);

			// System.out.println("cell /" + cell + "/end");
			result = (int) Float.parseFloat(cell);

		}
		return result;
	}

}
