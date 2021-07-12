package com.plant.lab.review.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.plant.lab.cart.model.controller.CartController;
import com.plant.lab.cart.model.vo.Cart;
import com.plant.lab.fileController.FileUploadController;
import com.plant.lab.member.model.vo.MemberVO;
import com.plant.lab.order.model.service.OrderService;
import com.plant.lab.order.model.vo.Order;
import com.plant.lab.order.model.vo.OrderDetail;
import com.plant.lab.product.model.service.ProductService;
import com.plant.lab.product.model.vo.Product;
import com.plant.lab.product.model.vo.ProductContnet;
import com.plant.lab.review.model.service.ReviewService;
import com.plant.lab.review.model.vo.Review;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private OrderService orderService;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	public static final int LIMIT2 = 10;
	public static final int pageBlock = 5;
	
//리뷰 리스트
	@RequestMapping(value="/reviewList", method=RequestMethod.GET)
	public ModelAndView revieList(ModelAndView mv, HttpSession session, HttpServletRequest req,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword) {
		
		logger.info("===============리뷰리스트 페이지===============");
		
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		if(member == null || member.getUserId() == "" ) {
			mv.setViewName("logIn");
			return mv;
		}
		
		Review review = new Review();
		
		if(member.getGrade() != 1) {
			review.setUser_no(member.getUserNo());			
			logger.info("리뷰회원:::"+review.getUser_no());
			mv.setViewName("MypageOrder/ReviewList");			
			mv.addObject("reviewList", reviewService.selectRvList(review));
		}else {
			
			if (keyword != null && !keyword.equals("")) {
				mv.addObject("currentPage", null);
				mv.addObject("reviewList", reviewService.selectSearch(keyword));
				mv.setViewName("MypageOrder/ManagerRL");
			}else { //검색어가 없을 경우
				mv.addObject("reviewList", reviewService.selectRvList(review));		
				mv.setViewName("MypageOrder/ManagerRL");	
			} 
		}
		
		
		int currentPage = page; // 한 페이지당 출력할 목록 개수
		int listCount = reviewService.listCountRv(review); //전체 게시글 개수
		logger.info("개수 확인하기 : " + listCount);
		int maxPage = (int) ((double) listCount / LIMIT2 + 0.9); //최대 페이지
		
		int startPage = 1;
	     int endPage = 4;
	     if(currentPage % pageBlock == 0) {
	         startPage = ((currentPage/pageBlock)-1) * pageBlock + 1;
	      }else {
	         startPage = ((currentPage/pageBlock)) * pageBlock + 1;
	      }
	      endPage = startPage + pageBlock - 1;
		
	     int pageCnt = (listCount / LIMIT2) + (listCount % LIMIT2 == 0 ? 0 : 1);
		     
		if(endPage > pageCnt) {
			endPage = pageCnt;			
		}
		
		mv.addObject("currentPage", currentPage);
		mv.addObject("pageCnt", pageCnt);
	    mv.addObject("startPage", startPage);
	    mv.addObject("endPage", endPage);
		mv.addObject("listCount", listCount);
		mv.addObject("maxPage", maxPage);
		
		return mv;
	}
	
//리뷰작성이동
	@RequestMapping(value="/revieWrite", method=RequestMethod.GET)
	public ModelAndView revieWrite(ModelAndView mv,HttpSession session,
			@RequestParam(value="buy_no", required=true) int buy_no,
			@RequestParam(value="new", required=true) String newCheck,
			RedirectAttributes redirectAttributes,
			HttpServletRequest req) {
		logger.info("===============리뷰작성 페이지===============");
		logger.info("buy_no체크::::"+buy_no);
		
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		if(newCheck.equals("new")) {
			logger.info("신규작성으로 이동");
			int check = reviewService.checkRv(buy_no);
			
			if(check != 0 || check > 0) {
				logger.info("check체크::::"+check);
				redirectAttributes.addFlashAttribute("rvMsg", "ok");
				String referer = req.getHeader("Referer");
				 
				mv.setViewName("redirect:"+ referer);
				mv.addObject("rvMsg","ok");
				return mv;
			}else {
				mv.addObject("buy_no",buy_no);
				mv.addObject("newCheck",newCheck);
				mv.setViewName("MypageOrder/ReviewWrite");	
			}
		}else {
			logger.info("수정으로 이동");
			Review review = new Review();
			review.setBuy_no(buy_no);
			
			List<Review> reImg = reviewService.selectImgList(review);
			
			logger.info("buy_no:::::"+review.getBuy_no());
			logger.info("이미지:::::"+reImg.toString());
			
			mv.setViewName("Product/ProductInsert");
			mv.addObject("review",reviewService.selectReview(review));
			mv.addObject("reImg",reImg);
			mv.addObject("newCheck",newCheck);
			
			mv.setViewName("MypageOrder/ReviewWrite");	
		}
		
		
		return mv;
	}
	
//리뷰작성
	@RequestMapping(value="/reviewInsert", method=RequestMethod.POST)
	public String reviewInsert(HttpSession session,Review review,
			HttpServletRequest request,
			@RequestParam(name = "rv_img_srcs", required = false) MultipartFile[] multiFile,
			@RequestParam(value="pro_no",required=true) List<Integer> pro_no,
			@RequestParam(value="buy_no",required=true) int buy_no,
			HttpServletRequest req) {
		logger.info("===============리뷰작성 페이지===============");

		List<String> img = new ArrayList<String>();
		
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		review.setUser_no(member.getUserNo());
		
		try {
			for(int i=0; i<multiFile.length; i++) {
				if (multiFile[i] != null && !multiFile[i].equals("")) {
					FileUploadController uplad = new FileUploadController();
					
					String url = uplad.saveFile(multiFile[i], request);
					img.add(url);		
				}
			}
			
			//리뷰 및 이미지 등록, 별점업데이트
			reviewService.insertReview(review,img,pro_no);

			
			//별접업데이트
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("이미지 저장에 실패했습니다~");
		}	
		
		return "redirect:/orderList";
	}
	
	
//리뷰삭제	
	@RequestMapping(value="/reviewDel", method=RequestMethod.POST)
	public String reviewDel(HttpSession session,Review review,
			@RequestParam(value="new", required=false) String newCheck,
			HttpServletRequest request,HttpServletRequest req) {
		logger.info("===============리뷰삭제===============");

		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		
		List<OrderDetail> buyPro = orderService.selectOrderDList(review.getBuy_no());
		
		for(int i=0; i<buyPro.size();i++) {
			logger.info(i+"번 상품업데이트번호:::"+buyPro.get(i).getPro_no());
		}
		
		int result = 0;
		result = reviewService.deleteReview(review,buyPro);
		
		if(result ==1) {
			logger.info("리뷰삭제성공!!!");
		}else {
			logger.info("리뷰삭제실패!!!");
		}
		
		return "redirect:/reviewList";
	}
	

//리뷰 이미지 ajax
	@RequestMapping(value="/imgSearch.do", method=RequestMethod.POST)
	public void cartSearch(Review review,
			HttpSession session,
			HttpServletResponse response) throws IOException{
		try {
			logger.info("===============리뷰 이미지 ajax===============");
			PrintWriter out = response.getWriter();
			List<Review> reImg = reviewService.selectImgList(review);
			List<String> imgList = new ArrayList<String>();
			
			
			logger.info("reImg"+reImg.size());
			for(int i=0; i<reImg.size(); i++) {
				imgList.add(reImg.get(i).getRv_img_src());
			}
			
			Collections.reverse(imgList);
			
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
		    String jsonOutput = gson.toJson(imgList);

		      try {
		         response.getWriter().write(jsonOutput);
		         logger.info("데이터 확인 : " + jsonOutput);
		      } catch (IOException e) {
		         e.printStackTrace();
		      }
		      
		}catch (Exception e) {
			logger.info("!!!!!!카트 AJAX1 오류!!!!!!");
			e.printStackTrace();
		}
	}
	
	
}
