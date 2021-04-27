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

import kosta.controller.Controller;

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
		request.getRequestDispatcher("front?key=goods&methodName=selectByGdCode&gdCode=" + gdCode).forward(request, response);
		request.getRequestDispatcher("front?key=review&methodName=selectByGdCode&gdCode="+ gdCode).forward(request, response);
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		encoding = fConfig.getInitParameter("encoding");
	}

}
