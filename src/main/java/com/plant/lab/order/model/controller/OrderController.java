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
import com.plant.lab.oneday.model.service.OnedayService;
import com.plant.lab.oneday.model.vo.OnedayVo;
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
	@Autowired
	private OnedayService onedayService;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	public static final int LIMIT = 1;
	public static final int LIMIT2 = 10;
	public static final int pageBlock = 5;
	
//?????? ??????????????? ??????
	@RequestMapping(value="/orders", method=RequestMethod.POST)
	public ModelAndView orderPro(ModelAndView mv,Order order,HttpSession session,
			@RequestParam(value="pro_no",required=true) List<Integer> pros,
			HttpServletRequest req) {
		logger.info("===============?????? ?????????===============");
		
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
		
		logger.info("?????? ?????????:"+orders.size());

		mv.addObject("user",member);
		mv.addObject("cartList",orders);
		mv.addObject("total",order.getBuy_totalprice());
		mv.addObject("deliv",req.getParameter("deliv"));
		
		mv.setViewName("Product/Order");
		return mv;
	}
	
//?????? ??????????????? ?????? 2	
	@RequestMapping(value="/order", method=RequestMethod.POST)
	public ModelAndView orderPro(ModelAndView mv,Product product,Cart cart,HttpSession session,
			Order order,@RequestParam(name = "pro_no") int pro_no,HttpServletRequest req) {
		logger.info("===============?????? ?????????222===============");
		logger.info("????????????:"+order.getBuy_totalprice());
		
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
	
//?????? ??????
	@RequestMapping(value="/orderInsert", method=RequestMethod.POST)
	public ModelAndView orderInsert(ModelAndView mv,Product product,Cart cart,HttpSession session,OrderDetail orderD,
			Order order,
			@RequestParam(name = "pro_no", required = false) List<Integer> pro_no,
			@RequestParam(name="pro_num", required = false)  List<Integer> pro_num,HttpServletRequest req ,
			@RequestParam(name="reserv_date" ,required = false) String rd ,
			@RequestParam(name="buy_requests" ,required = false) String rq
			
			)
	{
		logger.info("===============????????????===============");
		
		
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		order.setUser_no(member.getUserNo());
		int result=0;
		
		if(pro_no != null) {
		List<Cart> carts = new ArrayList<Cart>();
		carts = cartService.serchList(order.getUser_no());
		
		//?????? ????????? ??????
		//????????????
			result = orderService.orderInsert(order,pro_no,pro_num,carts);
		}else {
			logger.info("::::::::"+order.getReserv_no());
			//oneday Reserve RS TB ??? ??????
			OnedayVo one = new OnedayVo();
			
			
			//ajax 
			 one.setOneday_no(order.getReserv_no());
			 one.setOneday_request(rq);
			 one.setReserv_date(rd);
			 one.setUser_no(order.getUser_no());
			 System.out.println(one);
			result = onedayService.onedayreserve(one);
			
			 //purcharse TB??? ??????
			result = orderService.orderInsert(order);
			
		}
		if(result == 0) {
			logger.info("????????????");
			mv.setViewName("redirect:");
		}else{
			logger.info("????????????");
			mv.setViewName("redirect:/orderList");
		}
			
		
		return mv;
	}
	
//?????????????????? ???????????? ??????
	@RequestMapping(value="/managerOL", method=RequestMethod.GET)
	public ModelAndView morderList(ModelAndView mv,HttpSession session,
			@RequestParam(name = "page", defaultValue = "1") int page) {
		
		logger.info("===============??????????????? ??????????????? ?????????===============");
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		
		if(member == null || member.getUserId() == "" ) {
			mv.setViewName("logIn");
			return mv;
		}else {
			mv.setViewName("MypageOrder/ManagerOL");			
		}
		
		//???????????????
		Order order = new Order();
		int currentPage = page; // ??? ???????????? ????????? ?????? ??????
		int listCount = orderService.listCount(order); //?????? ????????? ??????
		logger.info("?????? ???????????? : " + listCount);
		int maxPage = (int) ((double) listCount / LIMIT2 + 0.9); //?????? ?????????
		
		int startPage = 1;
	     int endPage = 4;
	     if(currentPage % pageBlock == 0) {
	         startPage = ((currentPage/pageBlock)-1) * pageBlock + 1;
	      }else {
	         startPage = ((currentPage/pageBlock)) * pageBlock + 1;
	      }
	      endPage = startPage + pageBlock - 1;
		
	     int pageCnt = (listCount / LIMIT2) + (listCount % LIMIT2== 0 ? 0 : 1);
		     
		if(endPage > pageCnt) {
			endPage = pageCnt;			
		}
		
		List<Order> orderList = orderService.selectOrderList(currentPage,LIMIT2,null);
		
		mv.addObject("orderList", orderList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pageCnt", pageCnt);
	    mv.addObject("startPage", startPage);
	    mv.addObject("endPage", endPage);
		mv.addObject("listCount", listCount);
		mv.addObject("maxPage", maxPage);
		return mv;
	}	

//??????????????? ???????????? ??????
	@RequestMapping(value="/orderList", method=RequestMethod.GET)
	public ModelAndView orderList(ModelAndView mv,HttpSession session,Order order,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name="rvMsg", required = false) String rvMsg) {
		
		logger.info("===============??????????????? ??????????????? ?????????===============");
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		if(member == null || member.getUserId() == "" ) {
			mv.setViewName("logIn");
			return mv;
		}else {
			mv.setViewName("MypageOrder/OrderList");			
		}
		
		
		
		order.setUser_no(member.getUserNo());
		logger.info("rvMsg??????:::"+rvMsg);
		if(rvMsg != null) {
			mv.addObject("rvMsg", "ok");
		}else{
			mv.addObject("rvMsg","");
		}
		
		//???????????????
		int currentPage = page; // ??? ???????????? ????????? ?????? ??????
		int listCount = orderService.listCount(order); //?????? ????????? ??????
		logger.info("?????? ???????????? : " + listCount);
		int maxPage = (int) ((double) listCount / LIMIT + 0.9); //?????? ?????????
		
		 int startPage = 1;
	     int endPage = 4;
	     if(currentPage % pageBlock == 0) {
	         startPage = ((currentPage/pageBlock)-1) * pageBlock + 1;
	      }else {
	         startPage = ((currentPage/pageBlock)) * pageBlock + 1;
	      }
	      endPage = startPage + pageBlock - 1;
		
	     int pageCnt = (listCount / LIMIT) + (listCount % LIMIT == 0 ? 0 : 1);
		     
		if(endPage > pageCnt) {
			endPage = pageCnt;			
		}
	      
		
		List<Order> orderList = orderService.selectOrderList(currentPage,LIMIT,order);
		
		mv.addObject("orderList", orderList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pageCnt", pageCnt);
	    mv.addObject("startPage", startPage);
	    mv.addObject("endPage", endPage);
		mv.addObject("listCount", listCount);
		mv.addObject("maxPage", maxPage);
		return mv;
	}
	
//??????????????? ???????????? ajax
	@RequestMapping(value="/orderPro.do", method=RequestMethod.GET)
	public void orderPro(@RequestParam(name = "buy_no") int buy_no,
			HttpSession session,HttpServletResponse response) {
		try {
			logger.info("===============??????????????? ajax===============");
			response.setCharacterEncoding("UTF-8");
			
			logger.info("????????????!!!!:::"+buy_no);
			
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
				System.out.println("???????????????:::" + jsonOutput);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}catch (Exception e) {
			logger.info("!!!!!!??????????????? AJAX1 ??????!!!!!!");
			e.printStackTrace();
		}
	}
	
	
//??????????????? ?????????????????? ??????
	@RequestMapping(value="/OrderView", method=RequestMethod.GET)
	public ModelAndView orderViewList(ModelAndView mv,HttpSession session,
			@RequestParam(name = "buy_no") int buy_no) {
		
		logger.info("===============??????????????? ?????????????????? ?????????===============");
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		if(member == null || member.getUserId() == "" ) {
			mv.setViewName("logIn");
			return mv;
		}else {
			mv.setViewName("MypageOrder/OrderView");			
		}
		
		Order order = orderService.selectOrder(buy_no);
		List<OrderDetail> detailList = orderService.selectOrderDList(buy_no);
		System.out.println("?????? ???????????? ??? ?????? ??? ?????????."+detailList.get(0));
		System.out.println("buy_no"+buy_no);
		mv.addObject("order",order);
		mv.addObject("detailList",detailList);
		
		return mv;
	}
}
