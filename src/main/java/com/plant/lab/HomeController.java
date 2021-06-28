package com.plant.lab;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.plant.lab.diary.model.Service.DiaryService;
import com.plant.lab.diary.model.vo.CommentVO;
import com.plant.lab.diary.model.vo.DiaryVO;
import com.plant.lab.diary.model.vo.LikeVO;
import com.plant.lab.member.model.service.MemberService;
import com.plant.lab.member.model.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MemberService mService;
	
	
	
	@RequestMapping(value="/join", method = {RequestMethod.POST, RequestMethod.GET})
	public String joinMember() {
		return "join";
	}
	@RequestMapping(value="header",method = {RequestMethod.POST, RequestMethod.GET})
	public String header() {
		return "header";
	}
	
	@RequestMapping(value="doJoin", method = {RequestMethod.POST, RequestMethod.GET})
	public void doJoinMember(
			MemberVO vo	
			, HttpServletResponse response
			) {
		
		logger.info(vo.toString());
		int result = 0;
			result = mService.insertMember(vo);

		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(out != null) {
				out.flush();
				out.close();
			}			
		}
	}
	
	


	@RequestMapping(value="login")
	public String memberLogin(MemberVO vo, Model model, HttpSession session) {
		
		System.out.println("[계원] id와 pwd 정보 들어있음을 확인" +vo.toString());  
		
		MemberVO login = mService.loginMember(vo);   // 로그인 성공시 vo에 정보가 들어있고. 실패시 null

		if (login == null) {
			model.addAttribute("msg", "로그인 실패");
		} else {
			session.setAttribute("loginMember", vo);
		}

		return "logIn";

	}
	
@RequestMapping(value = "logout", method = {RequestMethod.POST, RequestMethod.GET})
public String memberOut(Model model, HttpServletRequest request) {
	HttpSession session = request.getSession();
	session.removeAttribute("loginMember");
	

	return "logOut";
}

@RequestMapping(value = "mypage", method = {RequestMethod.POST, RequestMethod.GET})
public String mypage(Model model) {

	return "mypage";
}


}
