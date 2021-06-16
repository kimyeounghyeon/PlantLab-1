package com.plant.lab.cart.model.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
			//테스트용 나중에 삭제
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
}
