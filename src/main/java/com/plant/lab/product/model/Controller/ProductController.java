package com.plant.lab.product.model.Controller;


import java.net.CookieStore;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Insert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.plant.lab.product.model.service.ProductContentService;
import com.plant.lab.product.model.service.ProductService;
import com.plant.lab.product.model.vo.Product;
import com.plant.lab.product.model.vo.ProductContnet;

@Controller
public class ProductController {
	@Autowired
	private ProductService proService;
	@Autowired
	private ProductContentService proConService;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	public static final int LIMIT = 12;
	
//상품출력 리스트
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public ModelAndView productListService(
			HttpServletResponse response,
			HttpServletRequest req,
			@RequestParam(name="cate", defaultValue = "p") String cate,
			@RequestParam(name="orderby", defaultValue = "new") String orderby,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv) {
		try {
			logger.info("===============상품리스트 페이지===============");
			
			//쿠키생성
			Cookie[] cookies = req.getCookies();
			Cookie proCookie = new Cookie("proView", null);
			proCookie.setComment("최근 본 상품 확인");
			proCookie.setMaxAge(60*60*24*365);	
			response.addCookie(proCookie);	
			
			//페이지처리
			int currentPage = page; // 한 페이지당 출력할 목록 개수
			int listCount = proService.listCount(cate); //전체 게시글 개수
			int maxPage = (int) ((double) listCount / LIMIT + 0.9); //최대 페이지

			logger.info("상품 개수 확인하기 : " + listCount);
			
			//검색어가 있을 경우
			if (keyword != null && !keyword.equals("")) {
				mv.addObject("proList", proService.searchList(keyword));				
			}
			else { //검색어가 없을 경우
				mv.addObject("proList", proService.selectList(currentPage, LIMIT,cate,orderby));				
			} 
		
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("nowCate",cate);
			mv.addObject("nowOrder",orderby);
			mv.addObject("listCount", listCount);
			mv.setViewName("Product/ProductList");
		} catch (Exception e) {
			logger.info("!!!!!!페이지 리스트 오류!!!!!!");
			e.printStackTrace();
			mv.setViewName("Product/ProductList");
		}
		return mv;
	}
	
//상품 상세보기
	@RequestMapping(value = "/productView", method = RequestMethod.GET)
	public ModelAndView productDetail(ModelAndView mv, HttpServletResponse response,
			@CookieValue(name = "proView") String cookie,
			@RequestParam(name = "proNo") int pro_no) {
		try {
			logger.info("===============상품상세 페이지===============");

//			//쿠키추가
//			if (!(cookie.contains(String.valueOf(pro_no)))) {
//				cookie += pro_no + "/";
//			}
			
			response.addCookie(new Cookie("view", cookie));
			
			mv.addObject("productCon",proConService.searchList(pro_no));
			mv.addObject("product",proService.selectOne(pro_no));
			mv.setViewName("Product/ProductView");
		}catch (Exception e) {
			logger.info("!!!!!!상품 상세 오류!!!!!!");
			e.printStackTrace();
		}
		
		return mv;
	}
	
//최근본 상품 목록 쿠키 등록
	public void proView(@CookieValue(name = "proView") String cookie, 
			@RequestParam(name = "proNo") int pro_no,
			HttpServletResponse response,Model model) throws ClassNotFoundException, SQLException{
		
		if (!(cookie.contains(String.valueOf(pro_no)))) {
			cookie += "/" + pro_no;
		}
		
		System.out.println("쿠키확인~~~~~~:"+cookie);
		response.addCookie(new Cookie("proView", cookie));
	}
}
