package com.plant.lab.order.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.plant.lab.cart.model.controller.CartController;
import com.plant.lab.cart.model.service.CartService;
import com.plant.lab.cart.model.vo.Cart;
import com.plant.lab.member.model.service.MemberService;
import com.plant.lab.member.model.vo.MemberVO;
import com.plant.lab.order.model.service.OrderService;
import com.plant.lab.order.model.vo.Order;
import com.plant.lab.order.model.vo.OrderDetail;
import com.plant.lab.product.model.service.ProductContentService;
import com.plant.lab.product.model.service.ProductService;
import com.plant.lab.product.model.vo.Product;
import com.plant.lab.review.model.vo.Review;

@Controller
public class OrderController {
	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService proService;
	@Autowired
	private MemberService mService;
	@Autowired
	private OrderService orderService;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	public static final int LIMIT = 1;
//상품 주문페이지 이동
	@RequestMapping(value="/orders", method=RequestMethod.POST)
	public ModelAndView orderPro(ModelAndView mv,Order order,HttpSession session,
			@RequestParam(value="pro_no",required=true) List<Integer> pros,
			HttpServletRequest req) {
		logger.info("===============주문 페이지===============");
		
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		List<Cart> carts = new ArrayList<Cart>();
		List<Cart> orders = new ArrayList<Cart>();
		
		order.setUser_no(member.getUserNo());
		
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
	
//상품 주문페이지 이동 2	
	@RequestMapping(value="/order", method=RequestMethod.POST)
	public ModelAndView orderPro(ModelAndView mv,Product product,Cart cart,HttpSession session,
			Order order,@RequestParam(name = "pro_no") int pro_no,HttpServletRequest req) {
		logger.info("===============주문 페이지222===============");
		logger.info("바로확인:"+order.getBuy_totalprice());
		
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		order.setUser_no(member.getUserNo());
		
		mv.addObject("user",member);
		mv.addObject("cart",cart);
		mv.addObject("cartList",null);
		mv.addObject("proList",proService.selectOne(pro_no));
		mv.addObject("total",order.getBuy_totalprice());
		mv.addObject("deliv",req.getParameter("deliv"));
		mv.setViewName("Product/Order");
		return mv;
	}
	
//주문 추가
	@RequestMapping(value="/orderInsert", method=RequestMethod.POST)
	public ModelAndView orderInsert(ModelAndView mv,Product product,Cart cart,HttpSession session,OrderDetail orderD,
			Order order,
			@RequestParam(name = "pro_no") List<Integer> pro_no,
			@RequestParam(name="pro_num")  List<Integer> pro_num,HttpServletRequest req) {
		logger.info("===============주문추가===============");
		logger.info("상품사이즈 체크:"+pro_no.size());
		
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		order.setUser_no(member.getUserNo());
		
		List<Cart> carts = new ArrayList<Cart>();
		carts = cartService.serchList(order.getUser_no());
		
		//구매 테이블 추가
		int result = orderService.orderInsert(order,pro_no,pro_num,carts);
		
		if(result == 0) {
			logger.info("구매실패");
			mv.setViewName("redirect:");
		}else{
			logger.info("구매성공");
			mv.setViewName("redirect:/orderList");
		}
			
		
		return mv;
	}
	
//마이페이지 주문내역 보기
	@RequestMapping(value="/orderList", method=RequestMethod.GET)
	public ModelAndView orderList(ModelAndView mv,HttpSession session,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name="rvMsg", required = false) String rvMsg) {
		
		logger.info("===============마이페이지 구매리스트 페이지===============");
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		if(member == null || member.getUserId() == "" ) {
			mv.setViewName("logIn");
			return mv;
		}else {
			mv.setViewName("MypageOrder/OrderList");			
		}
		
		logger.info("rvMsg확인:::"+rvMsg);
		if(rvMsg != null) {
			mv.addObject("rvMsg", "ok");
		}else{
			mv.addObject("rvMsg","");
		}
		
		//페이지처리
		int currentPage = page; // 한 페이지당 출력할 목록 개수
		int listCount = orderService.listCount(member.getUserNo()); //전체 게시글 개수
		int maxPage = (int) ((double) listCount / LIMIT + 0.9); //최대 페이지
		
		
		List<Order> orderList = orderService.selectOrderList(currentPage,LIMIT,member.getUserNo());
		
		mv.addObject("orderList", orderList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		return mv;
	}
	
//마이페이지 주문내역 ajax
	@RequestMapping(value="/orderPro.do", method=RequestMethod.GET)
	public void orderPro(@RequestParam(name = "buy_no") int buy_no,
			HttpSession session,HttpServletResponse response) {
		try {
			logger.info("===============주문이미지 ajax===============");
			response.setCharacterEncoding("UTF-8");
			
			logger.info("번호확인!!!!:::"+buy_no);
			
			List<OrderDetail> details = orderService.selectOrderDList(buy_no);
			List<String> imgList = new ArrayList<String>();
			
			
			for(int i=0; i<details.size(); i++) {
				imgList.add(details.get(i).getPro_image());
			}
			
			Map<String, Object> map = new HashMap<String, Object>();

			if(details.size() <= 0) {
				map.put("imgList",null);
				map.put("details",null);			
			}else {
				map.put("imgList",imgList);
				map.put("details",details);								
			}
			
			
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String jsonOutput = gson.toJson(map);
			
			try {
				response.getWriter().write(jsonOutput.toString());
				System.out.println("데이터확인:::" + jsonOutput);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}catch (Exception e) {
			logger.info("!!!!!!주문이미지 AJAX1 오류!!!!!!");
			e.printStackTrace();
		}
	}
	
	
//마이페이지 상세주문내역 보기
	@RequestMapping(value="/OrderView", method=RequestMethod.GET)
	public ModelAndView orderViewList(ModelAndView mv,HttpSession session,
			@RequestParam(name = "buy_no") int buy_no) {
		
		logger.info("===============마이페이지 상세주문내역 페이지===============");
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		if(member == null || member.getUserId() == "" ) {
			mv.setViewName("logIn");
			return mv;
		}else {
			mv.setViewName("MypageOrder/OrderView");			
		}
		
		Order order = orderService.selectOrder(buy_no);
		List<OrderDetail> detailList = orderService.selectOrderDList(buy_no);
		
		mv.addObject("order",order);
		mv.addObject("detailList",detailList);
		
		return mv;
	}
}
