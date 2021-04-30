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

import kosta.controller.Controller;
import kosta.dto.Member;

/**
 * Servlet Filter implementation class EncodingFilter
 */
@WebFilter(
		urlPatterns = {
				"/single-product.jsp"
		},
		initParams = {
				@WebInitParam(name = "encoding", value = "UTF-8")
		})
public class SingleProductFilter implements Filter {
	String encoding;

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		String gdCode = request.getParameter("gdCode");
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("member");
		if(member==null) {
			request.setAttribute("errorMsg", "Oops! 로그인 후 이용해주세요 :/");
			request.getRequestDispatcher("errorPage.jsp").forward(request, response);
		} else {
		request.getRequestDispatcher("front?key=goods&methodName=selectByGdCode&gdCode=" + gdCode).forward(request, response);
		//request.getRequestDispatcher("front?key=review&methodName=selectByGdCode&gdCode=" + gdCode).forward(request, response);
		chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		encoding = fConfig.getInitParameter("encoding");
	}

}
