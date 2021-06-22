package com.plant.lab.order.model.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.plant.lab.member.model.service.MemberService;
import com.plant.lab.member.model.vo.MemberVO;
import com.plant.lab.order.model.vo.Order;
import com.plant.lab.product.model.service.ProductContentService;
import com.plant.lab.product.model.service.ProductService;
import com.plant.lab.product.model.vo.Product;

@Controller
public class OrderController {
	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService proService;
	@Autowired
	private MemberService mService;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
//상품 주문페이지 이동
	@RequestMapping(value="/orders", method=RequestMethod.POST)
	public ModelAndView orderPro(ModelAndView mv,Order order,HttpSession session,
			@RequestParam(value="pro_no",required=true) List<Integer> pros,
			HttpServletRequest req) {
		logger.info("===============주문 페이지===============");
		
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		List<Cart> carts = new ArrayList<Cart>();
		List<Cart> orders = new ArrayList<Cart>();
		//TODO 테스트용 나중에 삭제
		order.setUser_no(Integer.parseInt(member.getUserNo()));
		
		carts = cartService.serchList(order.getUser_no());
		
		for(int i = 0; i<carts.size(); i++){
			for(int j=0; j<pros.size(); j++) {
				if(carts.get(i).getPro_no() == pros.get(j)) {
					orders.add(carts.get(i));
				}
			}
		}
		
		logger.info("선택 사이즈:"+orders.size());

		mv.addObject("user",member);
		mv.addObject("cartList",orders);
		mv.addObject("total",order.getBuy_totalprice());
		mv.addObject("deliv",req.getParameter("deliv"));
		
		mv.setViewName("Product/Order");
		return mv;
	}
	
	@RequestMapping(value="/order", method=RequestMethod.POST)
	public ModelAndView orderPro(ModelAndView mv,Product product,Cart cart,HttpSession session,
			Order order,@RequestParam(name = "pro_no") int pro_no,HttpServletRequest req) {
		logger.info("===============주문 페이지222===============");
		logger.info("바로확인:"+order.getBuy_totalprice());
		
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		mv.addObject("member",member);
		mv.addObject("cart",cart);
		mv.addObject("cartList",null);
		mv.addObject("proList",proService.selectOne(pro_no));
		mv.addObject("total",order.getBuy_totalprice());
		mv.addObject("deliv",req.getParameter("deliv"));
		mv.setViewName("Product/Order");
		return mv;
	}
}
