package com.plant.lab.review.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.plant.lab.cart.model.controller.CartController;
import com.plant.lab.cart.model.vo.Cart;
import com.plant.lab.member.model.vo.MemberVO;
import com.plant.lab.review.model.service.ReviewService;
import com.plant.lab.review.model.vo.Review;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	//imgSearch
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
