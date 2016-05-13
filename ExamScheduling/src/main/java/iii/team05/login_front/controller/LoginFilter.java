package iii.team05.login_front.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(urlPatterns = { "/Examing" })
public class LoginFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)res;
		HttpSession session=request.getSession();
		
		if (session.getAttribute("ecno") == null) {
			session.setAttribute("dest", request.getRequestURI());
			System.out.println(request.getRequestURI());
			
			request.getRequestDispatcher("/login").forward(request, response);
		}else{
			chain.doFilter(request, response);
		}
			
		
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
