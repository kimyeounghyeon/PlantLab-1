package com.plant.lab.product.model.Controller;


import java.net.CookieStore;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.plant.lab.member.model.vo.MemberVO;
import com.plant.lab.product.model.service.ProductContentService;
import com.plant.lab.product.model.service.ProductService;
import com.plant.lab.product.model.vo.Product;
import com.plant.lab.product.model.vo.ProductContnet;
import com.plant.lab.review.model.service.ReviewService;

@Controller
public class ProductController {
	@Autowired
	private ProductService proService;
	@Autowired
	private ProductContentService proConService;
	@Autowired
	private ReviewService reviewService;
	
	
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
			
			
			//페이지처리
			int currentPage = page; // 한 페이지당 출력할 목록 개수
			int listCount = proService.listCount(cate); //전체 게시글 개수
			int maxPage = (int) ((double) listCount / LIMIT + 0.9); //최대 페이지

			logger.info("상품 개수 확인하기 : " + listCount);
			
			//검색어가 있을 경우
			if (keyword != null && !keyword.equals("")) {
				mv.addObject("currentPage", null);
				mv.addObject("proList", proService.searchList(keyword));				
			}
			else { //검색어가 없을 경우
				mv.addObject("currentPage", currentPage);
				mv.addObject("proList", proService.selectList(currentPage, LIMIT,cate,orderby));				
			} 
		
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
	public ModelAndView productDetail(ModelAndView mv, HttpServletResponse response,HttpServletRequest req,
			@RequestParam(name = "proNo") int pro_no) {
		try {
			logger.info("===============상품상세 페이지===============");
			
			HttpSession session = req.getSession();
			MemberVO member = (MemberVO) session.getAttribute("loginMember");
			
			//로그인 확인
			if(member!=null) {
				mv.addObject("user",member.getUserNo());				
			}else {
				mv.addObject("user",0);
			}
			
			//최근본 상품 등록
			List<Product> viewPro = (ArrayList<Product>)(session.getAttribute("viewPro"));
			
			if(session.getAttribute("viewPro") == null) {
				viewPro = new ArrayList<Product>();				
			}
			
			int searchRe = 0;
			
			if(viewPro.size() != 0) { //최근본 상품 목록이 있을경우
				Collections.reverse(viewPro);
				
				for(int i=0; i<viewPro.size(); i++) { //이미 등록된 경우
					if(viewPro.get(i).getPro_no() == pro_no) {
						logger.info("이미있음");
						viewPro.remove(i);
						viewPro.add(proService.selectOne(pro_no));
						searchRe = 1;
						break;
					}
				}
				
				if(searchRe == 0) { //아니면 새로 추가
					logger.info("새로추가");
					viewPro.add(proService.selectOne(pro_no));
				}
			}else { //처음일 경우
				viewPro.add(proService.selectOne(pro_no));
			}
			
			
			session.setAttribute("viewPro", viewPro); 
			Collections.reverse(viewPro);
			
			
			//리뷰 퍼센트 계산
			int count = reviewService.listCount(pro_no);
			logger.info("개수확인:::"+count);
			
			List<Double> percent = new ArrayList<Double>();
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			
			map.put("pro_no", pro_no);
			map.put("star", 0);
			
			for(int i=5; i>=1; i--) {
				map.remove("star");
				map.put("star", i);
				int test = reviewService.starCount(map);
				logger.info("test:::"+test);
				if(test == 0) {
					percent.add(0.0);
				}else {
					percent.add(reviewService.starCount(map) / (count*1.0) * 100);					
				}
			}
			
			mv.addObject("viewPro",viewPro);
			mv.addObject("percent",percent);
			mv.addObject("productCon",proConService.searchList(pro_no));
			mv.addObject("reviewList",reviewService.searchList(pro_no));
			mv.addObject("product",proService.selectOne(pro_no));
			mv.setViewName("Product/ProductView");
		}catch (Exception e) {
			logger.info("!!!!!!상품 상세 오류!!!!!!");
			e.printStackTrace();
		}
		
		return mv;
	}
}
