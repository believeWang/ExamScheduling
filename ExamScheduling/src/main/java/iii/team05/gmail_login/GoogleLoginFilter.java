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
		urlPatterns={"/mes/ListNotReplyMessage.jsp","/sa.jsp"}
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
			session.setAttribute("dest", url);
			
			String path =request.getContextPath();
			response.sendRedirect("/ExamScheduling/gmail_login/login.do");
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
