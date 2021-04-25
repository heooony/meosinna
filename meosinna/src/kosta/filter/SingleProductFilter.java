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
import javax.servlet.http.HttpServletResponse;

import kosta.controller.GoodsController;

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
		request.setAttribute("gdCode", gdCode);
		GoodsController controller = new GoodsController();
		controller.selectByGdCode((HttpServletRequest)request, (HttpServletResponse)response);
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		encoding = fConfig.getInitParameter("encoding");
	}

}
