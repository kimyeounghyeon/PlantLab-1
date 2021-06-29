package com.plant.lab.member.model.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

	@Autowired
	private MemberService mService;

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
	public String memberLogin(MemberVO vo, HttpSession session, HttpServletRequest request
            , HttpServletResponse response, Model model) throws IOException {
		

		System.out.println("[계원] id와 pwd 정보 들어있음을 확인 : " + vo.toString());
		String getUser =vo.getUserId();
		MemberVO login = mService.loginMember(vo);
		if(login !=null) {
			session.setAttribute("loginMember", login);
			model.addAttribute("isLogin","true");
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
	public String isValidId(
		 @RequestParam(value = "userId") String userId) {
		System.out.println(userId);
		int isValidId = mService.isValidId(userId);
		if(isValidId>0){
			return "true";
		}
		return "false";
	}
	

}