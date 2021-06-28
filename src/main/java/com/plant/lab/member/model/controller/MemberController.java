package com.plant.lab.member.model.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		return "login";
	}
	
	@RequestMapping(value="loginPostNaver", method=RequestMethod.GET)
    public String loginPOSTNaver(HttpSession session) {
        
        return "loginPostNaver";
    }


		
	@RequestMapping(value = "doLogin")
	public String memberLogin(MemberVO vo, HttpSession session,
			@RequestParam (name = "userId") String userId, @RequestParam (name = "userPwd") String userPwd) {
		vo.setUserId(userId);
		vo.setUserPwd(userPwd);
		System.out.println("[계원] id와 pwd 정보 들어있음을 확인 : " + vo.toString());

	MemberVO login = mService.loginMember(vo); 
				
				
		if(login != null) {
			session.setAttribute("loginMember", login);
			System.out.println("로그인 성공");
			
		}else {
			System.out.println("로그인 실패");
		}
		System.out.println("전계원" + login);
		
		return "Main";
	}

	@RequestMapping(value = "logout")
	public String memberOut(Model model, HttpSession session) {
		session.removeAttribute("loginMember");
		return "Main";
	}

}