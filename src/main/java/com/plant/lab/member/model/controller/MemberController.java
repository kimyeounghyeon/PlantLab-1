package com.plant.lab.member.model.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.plant.lab.member.model.service.MemberService;
import com.plant.lab.member.model.vo.MemberVO;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService mService;
	
	@Autowired
    private JavaMailSender mailSender;

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinMember() {
		return "join";
	}

	@RequestMapping(value = "doJoin", method = RequestMethod.POST)
	public String doJoinMember(MemberVO vo) {

		mService.insertMember(vo);

		return "Main";

	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginMember() {
		return "logIn";
	}

	@RequestMapping(value = "loginPostNaver", method = RequestMethod.GET)
	public String loginPOSTNaver(HttpSession session) {

		return "loginPostNaver";
	}

	@ResponseBody
	@RequestMapping(value = "doLogin")
	public String memberLogin(MemberVO vo, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws IOException {

		
		String getUser = vo.getUserId();
		MemberVO login = mService.loginMember(vo);
		if (login != null) {
			session.setAttribute("loginMember", login);
			model.addAttribute("isLogin", "true");
			return "true";
		}

		return "false";

	}

	@RequestMapping(value = "logout")
	public String memberOut(Model model, HttpSession session) {
		session.removeAttribute("loginMember");
		System.out.println("전계원" + session);
		return "Main";
	}

	@ResponseBody
	@RequestMapping(value = "isValidId")
	public String isValidId(@RequestParam(value = "userId") String userId) {
		System.out.println(userId);
		int isValidId = mService.isValidId(userId);
		if (isValidId > 0) {
			return "true";
		}
		return "false";
	}
	
	 @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	    @ResponseBody
	    public String mailCheckGET(String email) throws Exception{
	        
	        /* 뷰(View)로부터 넘어온 데이터 확인 */
	        logger.info("이메일 데이터 전송 확인");
	        logger.info("인증번호 : " + email);
	                
	        /* 인증번호(난수) 생성 */
	        Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;
	        logger.info("인증번호 " + checkNum);
	        

	        /* 이메일 보내기 */
	        String setFrom = "wlvhtm901@naver.com";
	        String toMail = email;
	        String title = "무이림 회원가입 인증 이메일 입니다.";
	        String content = 
	                "무이림 홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요." +
	                "<br>" + 
	                "인증 번호는 " + checkNum + "입니다."; 
	        

			
			  try {
			  
			  MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
			  helper = new MimeMessageHelper(message, true, "utf-8");
			  helper.setFrom(setFrom); helper.setTo(toMail); helper.setSubject(title);
			  helper.setText(content,true); mailSender.send(message);
			 
			 }catch(Exception e) { e.printStackTrace(); }
			 
	       String num = Integer.toString(checkNum);
	       
	       
		return num;
 

	
	 }
	 @RequestMapping(value="/update")
	 public String registerUpdateView() throws Exception{
	 	
	 	return "modify";
	 }
	 
	 @ResponseBody
	 @RequestMapping(value="/doUpdate")
	 public String registerUpdate(MemberVO vo, HttpSession session, HttpServletRequest request,
			 @RequestParam(name= "userPwd") String userPwd, @RequestParam(name= "phone") int phone, 
			 @RequestParam(name= "address") String address ) 
			 throws Exception{ 
		 
	 	
	            MemberVO member = (MemberVO) session.getAttribute("loginMember");
	            
	            
	            vo.setUserId(member.getUserId());
	            vo.setUserPwd(userPwd);
	            System.out.println(userPwd);
	            vo.setPhone(phone);
	            System.out.println(phone);
	            vo.setAddress(address);
	            System.out.println(address);
	            vo.setEmail(member.getEmail());
	            vo.setUserName(member.getUserName());
		 
	            System.out.println("[계원]  pwd,email,address 정보 들어있음을 확인 : " + vo.toString());
       
	            int result = -1;
		 
		 result = mService.memberUpdate(vo);
	 	System.out.println(result+"는 몇~");
	 	session.invalidate();
	 	
	 	return String.valueOf(result);
	 }
	

}