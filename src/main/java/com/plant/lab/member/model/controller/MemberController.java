package com.plant.lab.member.model.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.plant.lab.member.model.service.MemberService;
import com.plant.lab.member.model.vo.MemberVO;

@Controller
public class MemberController {
	

	@Autowired
	private MemberService mService;

	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinMember() {
		return "join";
	}

	@RequestMapping(value = "doJoin", method = RequestMethod.POST)
	public String doJoinMember(MemberVO vo) {
		
		System.out.println("왜 자꾸 말썽이니..");
		mService.insertMember(vo);

		 return "Main";
		 
}


		
	@RequestMapping(value = "doLogin")
	public String memberLogin(MemberVO vo, HttpSession session) {
		String result = "";

		System.out.println("[계원] id와 pwd 정보 들어있음을 확인 : " + vo.toString());

		MemberVO login = mService.loginMember(vo); // 로그인 성공시 vo에 정보가 들어있고. 실패시 null
				
				
		session.setAttribute("loginMember", login);
		result = "로그인 성공";
		System.out.println("aaa" +result);
		
		return "Main";
	}

	@RequestMapping(value = "logout")
	public String memberOut(Model model, HttpSession session) {
		session.removeAttribute("loginMember");
		return "Main";
	}

}