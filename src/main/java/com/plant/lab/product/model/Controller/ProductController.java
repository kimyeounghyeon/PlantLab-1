package com.plant.lab.product.model.Controller;


import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.plant.lab.product.model.service.ProductService;
import com.plant.lab.product.model.vo.Product;

@Controller
public class ProductController {
	@Autowired
	private ProductService proService;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	public static final int LIMIT = 12;
	
//상품출력 리스트
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public ModelAndView productListService(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv) {
		try {
			logger.info("===============상품리스트 페이지===============");
			int currentPage = page; // 한 페이지당 출력할 목록 개수
			int listCount = proService.listCount(); //전체 게시글 개수
			int maxPage = (int) ((double) listCount / LIMIT + 0.9); //최대 페이지

			
			logger.info("상품 개수 확인하기 : " + listCount);
			
			//검색어가 있을 경우
			if (keyword != null && !keyword.equals("")) {
				mv.addObject("proList", proService.searchList(keyword));				
			}
			else { //검색어가 없을 경우
				mv.addObject("proList", proService.selectList(currentPage, LIMIT));				
			} 
		

			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
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
	public ModelAndView productDetail(ModelAndView mv,
			Product p,
			@RequestParam(name = "proNo") int pro_no) {
		try {
			logger.info("===============상품상세 페이지===============");
			
			mv.addObject("product",proService.selectOne(pro_no));
			mv.setViewName("Product/ProductView");
		}catch (Exception e) {
			logger.info("!!!!!!상품 상세 오류!!!!!!");
			e.printStackTrace();
		}
		
		return mv;
	}
}
