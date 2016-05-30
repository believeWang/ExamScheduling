package iii.team05.insert.model;

import iii.team05.examinee.ecmodel.ECHibernateDAO;
import iii.team05.examinee.ecmodel.ECVO;
import iii.team05.examinee.ecmodel.ESVO;
import iii.team05.examinee.ecmodel.ScoreVO;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * Servlet implementation class InsertExcel
 */
@WebServlet("/InsertExcel")
public class InsertExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		ServletContext context = getServletContext();
		String excelFile = "/WEB-INF/data_test/WebcommEEIT_1.0.xlsx";

		try {
			InputStream inp = context.getResourceAsStream(excelFile);

			// 從輸入流創建Workbook
			XSSFWorkbook workbook = new XSSFWorkbook(inp);
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

				for (int j = 0; j < row.getPhysicalNumberOfCells(); j++) {
					// System.out.println(row.getCell(j));
					System.out.println(transform(row, j));
				}

				// ECVO ECVO 也稱為 Domain objects
				ecvo = new ECVO();
				esvo = new ESVO();
				scoreVO = new ScoreVO();

				// NO
				// String ecno = row.getCell(2).toString();
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
				// Boolean ecstatus = new Boolean(row.getCell(8).toString());
				Boolean ecstatus = new Boolean(transform(row, 8));

				// 組別
				float esteamf = Float.parseFloat(transform(row, 0));
				Integer esteam = (int) esteamf;
				// 年次
				float esbirthf = Float.parseFloat(transform(row, 4));
				Integer esbirth = (int) esbirthf;
				// 畢業學校
				String esschool = transform(row, 5);
				// 性別
				Boolean essex = new Boolean(transform(row, 6));
				// 最快可以上班日期
				XSSFCell dateCell = row.getCell(13);
				java.sql.Date eshiredate = null;
				if (dateCell != null
						&& dateCell.getCellType() != XSSFCell.CELL_TYPE_BLANK) {
					eshiredate = new java.sql.Date(dateCell
							.getDateCellValue().getTime());
				};
				
				// 期望薪資
				Integer essalary = getIntFromString(transform(row, 14));
				// 呼叫getIntFromString來用, 取代以下兩行
				// float essalaryf = Float.parseFloat(transform(row, 14));
				// Integer essalary = (int) essalaryf;

				// Final Ranking
				Integer esranking = getIntFromString(transform(row, 15));

				// 備註2
				String esremark2 = transform(row, 16);

				// 上機考分數
				Integer lab = getIntFromString(transform(row, 9));

				// 面試分數
				Integer interview = getIntFromString(transform(row, 11));
				// 呼叫getIntFromString來用, 取代以下兩行
				// float interviewf = Float.parseFloat(transform(row, 11));
				// Integer interview = (int) interviewf;

				// 上機考時間(分鐘)
				Integer labtime = getIntFromString(transform(row, 10));
				// 呼叫getIntFromString來用, 取代以下兩行
				// float labtimef = Float.parseFloat(transform(row, 10));
				// Integer labtime = (int) labtimef;

				// 線上測驗分數
				Integer onlineex = getIntFromString(transform(row, 12));
				// 呼叫getIntFromString來用, 取代以下兩行
				// float onlineexf = Float.parseFloat(transform(row, 12));
				// Integer onlineex = (int) onlineexf;

				ecvo.setEcno(ecno);
				ecvo.setEcname(ecname);
				ecvo.setEcemail(ecemail);
				ecvo.setEcremark1(ecremark1);
				ecvo.setEcstatus(ecstatus);

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

		} catch (Exception e) {
			e.printStackTrace();
		}
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
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	private double parse(String cell) {
		if (cell != null && cell.trim().length() > 0) {
			return Double.parseDouble(cell);
		} else {
			return 0.0;
		}

	}

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
