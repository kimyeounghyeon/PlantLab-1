package com.plant.lab.cart.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.plant.lab.cart.model.service.CartService;
import com.plant.lab.cart.model.vo.Cart;
import com.plant.lab.product.model.Controller.ProductController;

@Controller
public class CartController {
	@Autowired
	private CartService cartService;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
//장바구니로 이동 및 카트 리스트 출력
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView cartListService(ModelAndView mv) {
		try{
			logger.info("===============카트 페이지===============");
			
			//TODO 테스트용 나중에 삭제
			int user_no = 1;
			
			List<Cart> cart = new ArrayList<Cart>();
			cart = cartService.serchList(user_no);
			
			System.out.println("cart확인 : " + cart.size());
			
			mv.addObject("cartList",cartService.serchList(user_no));
			mv.setViewName("Product/Cart");
		}catch (Exception e) {
			logger.info("!!!!!!카트 리스트 오류!!!!!!");
			e.printStackTrace();
		}
		
		return mv;
	}

//카트 상품 서치 AJAX
	@RequestMapping(value="/cartSearch", method=RequestMethod.POST)
	public void cartSearch(@RequestParam(name = "pro_no") int pro_no,
			HttpServletResponse response) throws IOException{
		try {
			//TODO 테스트용 나중에 삭제
			int user_no = 1;
			
			PrintWriter out = response.getWriter();
			List<Cart> cartL = cartService.serchList(user_no);
			
			for(int i = 0; i<cartL.size(); i++){
				if(cartL.get(i).getCart_no() == pro_no) {
					logger.info(pro_no+"는 카트에 존재함");
					out.print("ok");
					out.flush();
					out.close();
					break;
				}
			}
			
			logger.info(pro_no+"는 카트에 없음");
			out.print("no");
			
			out.close();
		}catch (Exception e) {
			logger.info("!!!!!!카트 AJAX1 오류!!!!!!");
			e.printStackTrace();
		}
	}
	
	
//카트 상품 등록 AJAX
	@RequestMapping(value="/cartInsert", method=RequestMethod.POST)
	public void cartInsert(Cart cart,HttpServletResponse response)throws IOException{
		try {
			//TODO 테스트용 나중에 삭제
			cart.setUser_no(1);
			
			
			int result = cartService.cartInsert(cart);
			System.out.println("no확인:"+cart.getPro_no());
			
			//int result = 1;
			if(result == 0) {
				logger.info("!!!!!!카트 인서트 오류!!!!!!");
			}else {
				PrintWriter out = response.getWriter();
				out.print("insert");
				out.flush();
				out.close();
			}
			
		}catch (Exception e) {
			logger.info("!!!!!!카트 AJAX2 등록 오류!!!!!!");
			e.printStackTrace();
		}
	}
}
