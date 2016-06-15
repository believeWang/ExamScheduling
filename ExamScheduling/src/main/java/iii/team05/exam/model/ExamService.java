package iii.team05.exam.model;



import iii.team05.slide.model.BannerHibernateDAO;
import iii.team05.slide.model.BannerVO;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

public class ExamService {
	ExamDAO examDAO;
	BannerHibernateDAO bannerDAO;
	

	public ExamService() {
		examDAO = new ExamDAO();
		bannerDAO = new BannerHibernateDAO();
	}

	public ExamVO getExam(String examno) {
		return examDAO.findByPrimaryKey(examno);
	}

	public void insetExam(ExamVO examVO) {
		examDAO.insert(examVO);
	}
	public void updateExam(ExamVO examVO) {
		examDAO.update(examVO);
	}

	public void deleteExam(String examno) {
		examDAO.delete(examno);
	}

	public void putExamDetailInRequest(String examno, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("status", "examing");
		ExamVO examVO = examDAO.findByPrimaryKey(examno);
		// 考試編號
		session.setAttribute("examno", examno);
		// 考試名稱
		session.setAttribute("examtitle", examVO.getExamTitle());
		// 考題數量
		session.setAttribute("totalNumberOfQuizQuestions",
				examVO.getQuantities());
		// 考試時間
		session.setAttribute("quizDuration", examVO.getDuration());
		session.setAttribute("min", examVO.getDuration());
		session.setAttribute("sec", 0);

	}

	public List<ExamVO> getAll() {
		return examDAO.getAll();
	}

	// 初始化
	public void initExam(HttpSession session, HttpServletRequest request,
			ServletContext context, HttpServletResponse response)
			throws ServletException, IOException {
		// 設定考試狀態

		// 取得選擇得考試
		String examno = (String) session.getAttribute("examno");
		// 測試用
		// String examno = "Java1";

		if (examno == null) {
			response.sendRedirect("choose");
			// RequestDispatcher dispatcher = request
			// .getRequestDispatcher("/WEB-INF/quiz_front/choose.jsp");
			// dispatcher.forward(request, response);
		}
		// 考題列表
		@SuppressWarnings("unchecked")
		List<ExamDetailVO> questionList = (List<ExamDetailVO>) context
				.getAttribute(examno);

		// 第幾題
		ExamDetailVO question = questionList.get(0);

		// 題名
		request.setAttribute("title", question.getQuestion());
		// System.out.println(request.getAttribute("title"));

		// 題型
		request.setAttribute("questionType", question.getQuestionType());

		// 各選項
		Set<OptionsVO> optionsSet = question.getOptions();

		String[] options = new String[optionsSet.size()];
		int index = 0;
		for (OptionsVO option : optionsSet)
			options[index++] = option.getOptionsName();
		// 將選項轉為javascript陣列的格式放入屬性中
		request.setAttribute("options", toJavascriptArray(options));

		// 考生答案
		Map<Long, boolean[]> answerMap = new HashMap<Long, boolean[]>();
		session.setAttribute("answerMap", answerMap);
		session.setAttribute("currentQuestion", 1);

	}

	// 將題目轉為JSON格式回傳給JSP(AJAX)
	public void questionToJSON(HttpSession session,
			HttpServletResponse response, int targetQuestion,
			ServletContext context) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 取得考試編號
		String examno = (String) session.getAttribute("examno");

		// 考題
		@SuppressWarnings("unchecked")
		List<ExamDetailVO> questionList = (List<ExamDetailVO>) context
				.getAttribute(examno);

		// 考生的答案卷
		@SuppressWarnings("unchecked")
		Map<Long, boolean[]> answerMap = (Map<Long, boolean[]>) session
				.getAttribute("answerMap");
		boolean[] answer = answerMap.get(new Long(targetQuestion - 1));

		ExamDetailVO question = questionList.get(targetQuestion - 1);

		Set<OptionsVO> options = question.getOptions();

		JSONObject obj = new JSONObject();
		// 題目標題
		obj.put("title", question.getQuestion());
		int cnt = 1;
		for (OptionsVO option : options) {
			// 選項
			obj.put("option" + cnt++, option.getOptionsName());
		}
		// 題型
		obj.put("questionType", question.getQuestionType());

		// 如果有寫過這題 把寫過的資料回傳回去
		if (answer != null) {
			JSONArray jsonAry = new JSONArray(answer);
			obj.put("answer", jsonAry);
		}

		response.getWriter().print(obj);
		// array.put(obj);

	}

	// 將考生寫過的選項放入List中
	public void putAnswerToList(HttpSession session, int currentQuestion,
			String[] selected) {

		@SuppressWarnings("unchecked")
		Map<Long, boolean[]> answerMap = (Map<Long, boolean[]>) session
				.getAttribute("answerMap");
		boolean[] options = new boolean[4];
		for (int i = 0; i < 4; i++) {

			options[i] = false;
		}

		for (int i = 0, max = selected.length; i < max; i++) {
			// selected陣列中存放考生的選項 將該選項改為true(有選)
			options[Integer.parseInt(selected[i]) - 1] = true;
		}
		answerMap.put(currentQuestion - 1l, options);
		session.setAttribute("answerMap", answerMap);

		// test
		// for(int i=0;i<4;i++){
		//
		// System.out.println(i+":"+options[i]);
		// }

	}

	// 將JAVA陣列轉為JAVASCRIPT陣列
	public static String toJavascriptArray(String[] arr) {
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for (int i = 0; i < arr.length; i++) {

			sb.append("\'").append(arr[i]).append("\'");
			if (i + 1 < arr.length) {
				sb.append(",");
			}
		}
		sb.append("]");
		return sb.toString();
	}

	public void checkAnswer(HttpServletRequest request, ServletContext context) {
		HttpSession session = request.getSession();

		session.setAttribute("status", "finished");
		String isFinished = (String) session.getAttribute("status");
		// 考生的答案
		@SuppressWarnings("unchecked")
		Map<Long, boolean[]> answerMap = (Map<Long, boolean[]>) session
				.getAttribute("answerMap");

		String examno = (String) session.getAttribute("examno");
		// // 測試用
		// if (examno == null) {
		// examno = "Java1";
		// }
		// 標準答案
		@SuppressWarnings("unchecked")
		List<ExamDetailVO> questionList = (List<ExamDetailVO>) context
				.getAttribute(examno);
		// 答對的題數
		int rightCnt = 0;

		for (int i = 0, size = questionList.size(); i < size; i++) {
			ExamDetailVO questions = questionList.get(i);

			// 正確的答案 ex: truetruefalsefalse
			String rightAnswer = "";
			for (OptionsVO options : questions.getOptions()) {
				rightAnswer += options.getIsAnswer();
			}
			// System.out.print(rightAnswer+" ");

			// 考生的答案
			String studentAnswer = "";

			// System.out.println("answerMapget" + answerMap.get(new Long(i)));

			// 如果沒寫這題 為空NULL
			if (answerMap.get(new Long(i)) != null) {
				for (Boolean bo : answerMap.get(new Long(i))) {

					studentAnswer += bo.toString();
				}
				// 比對兩個字串是否相等
				if (rightAnswer.equals(studentAnswer))
					rightCnt++;
			}
			// System.out.println(studentAnswer);
			// System.out.println("-------------");
		}
		request.setAttribute("rightCnt", rightCnt);

	}

	public String byteTobase64(byte[] imageByteArray) {
		if (imageByteArray == null)
			return null;
		StringBuilder sb = new StringBuilder();
		sb.append("data:image/png;base64,");

		try {
			sb.append(new String(Base64.getEncoder().encode(imageByteArray),
					"UTF-8"));
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		}
		return sb.toString();
	}
	public void putAllExamToContex(ServletContext context){
		List<ExamVO>exams=getAll();
		 Map<String,String>examsMap=new HashMap<String, String>();
		 Map<String,ExamVO>allExams=new HashMap<String, ExamVO>();
		 
		 for(ExamVO exam:exams){
			 examsMap.put(exam.getExamno(), byteTobase64(exam.getExamImg()));
			 allExams.put(exam.getExamno(),exam);
			 List<ExamDetailVO>questionList=new ArrayList<ExamDetailVO>();
			 questionList.addAll(exam.getExamDetils());
			 context.removeAttribute(exam.getExamno());
			 context.setAttribute(exam.getExamno(), questionList);
		 }
		 context.removeAttribute("examsMap");
		 context.removeAttribute("allExams");
		 context.setAttribute("examsMap", examsMap);
		 context.setAttribute("allExams", allExams);
	}


	public void putAllBannerImag(ServletContext servletContext) {
		List<BannerVO>Imag=bannerDAO.getAll();
		List<String>BannerImag=new ArrayList<String>();
		
		for(BannerVO sp:Imag){
			BannerImag.add(byteTobase64(sp.getSlidephoto()));
//			 servletContext.removeAttribute(sp.getSlidephoto());
//			 servletContext.setAttribute(sp.getSlidephoto());
		 }
		servletContext.removeAttribute("allBanner");	
		servletContext.setAttribute("allBanner", BannerImag);
	
	}


}
