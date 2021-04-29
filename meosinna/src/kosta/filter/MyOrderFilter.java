package kosta.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kosta.dto.Member;

/**
 * Servlet Filter implementation class EncodingFilter
 */
@WebFilter(
		urlPatterns = {  
				"/myOrder.jsp"
		}, 
		initParams = { 
				@WebInitParam(name = "encoding", value = "UTF-8")
		})
public class MyOrderFilter implements Filter {
	String encoding;
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("member");
		int mbCode = member.getMbCode();
		request.getRequestDispatcher("front?key=order&methodName=viewMyOrder&mbCode=" + mbCode).forward(request, response);
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		encoding = fConfig.getInitParameter("encoding");
	}

}
