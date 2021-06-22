package com.plant.lab.order.model.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.plant.lab.cart.model.controller.CartController;
import com.plant.lab.cart.model.service.CartService;
import com.plant.lab.cart.model.vo.Cart;
import com.plant.lab.order.model.vo.Order;

@Controller
public class OrderController {
	@Autowired
	private CartService cartService;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
//상품 주문페이지 이동
	@RequestMapping(value="/order", method=RequestMethod.POST)
	public ModelAndView orderPro(ModelAndView mv,Order order,
			@RequestParam(value="pro_no",required=true) List<Integer> pros,
			HttpServletRequest req) {
		logger.info("===============주문 페이지===============");
		
		List<Cart> carts = new ArrayList<Cart>();
		List<Cart> orders = new ArrayList<Cart>();
		//TODO 테스트용 나중에 삭제
		order.setUser_no(1);
		
		carts = cartService.serchList(order.getUser_no());
		
		for(int i = 0; i<carts.size(); i++){
			for(int j=0; j<pros.size(); j++) {
				if(carts.get(i).getPro_no() == pros.get(j)) {
					orders.add(carts.get(i));
				}
			}
		}
		
		logger.info("선택 사이즈:"+orders.size());

		mv.addObject("cartList",orders);
		mv.addObject("total",order.getBuy_totalprice());
		mv.addObject("deliv",req.getParameter("deliv"));
		
		mv.setViewName("Product/Order");
		return mv;
	}
}
