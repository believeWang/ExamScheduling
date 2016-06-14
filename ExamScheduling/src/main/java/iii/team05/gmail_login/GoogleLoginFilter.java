package iii.team05.gmail_login;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter(


		urlPatterns={"/Examiner.jsp","/WEB-INF/mes/ListNotReplyMessage.jsp","/WEB-INF/quiz_back/exam_list.jsp"}

		)
public class GoogleLoginFilter implements Filter {

	private FilterConfig filterconfig;

	@Override
	public void doFilter(ServletRequest res, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) res;
		HttpServletResponse response = (HttpServletResponse) resp;
		HttpSession session=request.getSession();
		String bean = (String) session.getAttribute("GoogleUser");
		if(bean!=null){
			chain.doFilter(request, response);
		}else{
			String url =request.getRequestURI();
			session.setAttribute("dests", url);
			response.sendRedirect("/ExamScheduling/recaptcha.jsp");
		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.filterconfig = config;
	}

	@Override
	public void destroy() {
	}
}
