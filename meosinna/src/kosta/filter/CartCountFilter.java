package kosta.filter;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kosta.dto.Member;
import kosta.service.CartService;
import kosta.service.CartServiceImpl;

/**
 * Servlet Filter implementation class CartCountFilter
 */
@WebFilter("/*")
public class CartCountFilter implements Filter {

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("member");
		
		if(member==null) {
			
		} else {
			int mbCode = member.getMbCode();
			
			CartService cartService = new CartServiceImpl();
			int cartQty = cartService.getCartQty(mbCode);
			
			session.setAttribute("cartQty", cartQty);
		}
		
		
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	
	}

}
