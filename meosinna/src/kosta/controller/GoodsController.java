package kosta.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kosta.dto.Goods;
import kosta.dto.Member;
import kosta.dto.Review;
import kosta.service.GoodsService;
import kosta.service.GoodsServiceImpl;
import kosta.service.ReviewService;

public class GoodsController implements Controller {
	GoodsService goodsService = new GoodsServiceImpl();
	ReviewService reviewService = new ReviewService();
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		return null;
	}
	
	public ModelAndView selectByGdCode(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		//해당상품출력
		String gdCode = request.getParameter("gdCode");
		Goods goods = goodsService.selectByGdCode(gdCode);
		request.setAttribute("goods", goods);
		
		//리뷰리스트출력
		List<Review> reviewList = reviewService.selectByGdCode(gdCode);
		request.setAttribute("reviewList", reviewList);
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		if(member == null) throw new NullPointerException("로그인 후 이용 가능합니다.");
		int isLike = goodsService.checkLike(member.getMbCode(), gdCode);
		request.setAttribute("like", isLike);
		
		//사이즈수량출력
		Map<Integer, Integer> map = goodsService.getSizeQty(gdCode);
		request.setAttribute("goodsInfo", map);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("single-product.jsp");
		return mv;
	}
	

	/**
	 * 전체검색
	 * */
	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		 String pageNo = request.getParameter("pageNo");
		  
	        if(pageNo==null || pageNo.equals("")) { 
		 	  pageNo="1"; 
		  }

		 List<Goods> list = goodsService.selectAll(Integer.parseInt(pageNo));

		request.setAttribute("list", list);
		request.setAttribute("pageNo", pageNo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("category.jsp");
		
		return mv;
	} 
	/**
	 * 등록하기
	 * */
	public ModelAndView insert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String saveDir = request.getServletContext().getRealPath("/save");
		String encoding = "UTF-8";
		int maxSize = 1024*1024*100; //100MB
		
		MultipartRequest m = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String gdCode = m.getParameter("gd_code");
		String gdName = m.getParameter("gd_name");
		String price = m.getParameter("price");
		String brand = m.getParameter("brand");
		String gdLike = m.getParameter("gd_like");
		String stCode = m.getParameter("st_code");
		String gdContent = m.getParameter("gd_content");
		String img = m.getParameter("img");
		
		Goods goods = new Goods(gdCode, gdName, Integer.parseInt(price), brand, 
				Integer.parseInt(gdLike), stCode, gdContent, img);
		
		goodsService.insert(goods);
		
		return new ModelAndView();//처리방식
	}
	
	/**
	 * 수정하기
	 * */
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String gdCode = request.getParameter("gdCode");
		String gdName = request.getParameter("gdNmae");
		String price = request.getParameter("price");
		String brand = request.getParameter("brand");
		String gdLike = request.getParameter("gdLike");
		String stCode = request.getParameter("stCode");
		String gdContent = request.getParameter("gdContent");
		String img = request.getParameter("img");
		
		Goods goods = new Goods(gdCode, gdName, Integer.parseInt(price), brand, Integer.parseInt(gdLike), stCode, gdContent, img);
		goodsService.update(goods);
		
		goods = goodsService.selectByGdName(gdCode);
		request.setAttribute("goods", goods);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("??");
		
		return mv;
	}
	
	/**
	 * 삭제하기
	 * */
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String gdCode = request.getParameter("gdCode");
		
		goodsService.delete(gdCode);
		
		ModelAndView mv = new ModelAndView("??", true);
		
		return mv;
	}
	
	
	
	/**
	 * 상품명 검색
	 * */

	public ModelAndView selectByGdName(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		String goodsName = request.getParameter("goodsName");
		
	   Goods goods  = goodsService.selectByGdName(goodsName);
		
	   request.setAttribute("goods", goods);
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("category.jsp");
	   return mv;
	}
	
	
	/**
	 * 브랜드 검색 
	 * */
	public ModelAndView selectByBrand(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		String brand= request.getParameter("brand");
		
	   Goods goods  = goodsService.selectByBrand(brand);
		
	   request.setAttribute("goods", goods);
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("category.jsp");
	   return mv;
	}
	
	
	/**
	 *가격대 검색 
	 * */ 
		public  ModelAndView selectByPrice(HttpServletRequest request, HttpServletResponse response) throws Exception{
			int min = Integer.parseInt(request.getParameter("min"));     
	    	System.out.println(min);
	        int max = Integer.parseInt(request.getParameter("max")); 
            System.out.println(max); 
            List<Goods> list = goodsService.selectByPrice(min, max);  
            request.setAttribute("range", list); 
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("category.jsp"); 
	        
    	       return mv;
          
 }
      /**
       * 상세페이지 이동
       * */
      public  ModelAndView gdDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
 	     String gdCode = request.getParameter("gdCode");  //얻어온 거 gdCode 그릇에 담기 ! 
 	     Goods goods = goodsService.gdDetail(gdCode);      //인수로 넣어줘서 서비스의 디테일호출하기 
 	     request.setAttribute("goods", goods);   
 	     ModelAndView mv = new ModelAndView();
 	     mv.setViewName("single-product.jsp");  
       return mv; 
       }
      
      
      /**
       * 폼에서 수량, 사이즈 받아서 cart.jsp로 넘기기 
       * */
      public ModelAndView getInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
    	int qty = Integer.parseInt(request.getParameter("qty"));     
    	// System.out.println(qty); 
        int size = Integer.parseInt(request.getParameter("size")); 
        //System.out.println(size); 
        request.setAttribute("qty",	 qty);
        request.setAttribute("size", size);
        ModelAndView mv = new ModelAndView();
    	 mv.setViewName("cart.jsp");
    	  return mv;
    	  
    	  
    
      }
      
      public ModelAndView selectOrderByLike(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
 		 List<Goods> goodsList = goodsService.selectOrderByLike();

 		request.setAttribute("goodsList", goodsList);
 		ModelAndView mv = new ModelAndView();
 		mv.setViewName("index.jsp");
 		
 		return mv;
 	} 
}

