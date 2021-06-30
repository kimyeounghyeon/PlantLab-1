package com.plant.lab;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.plant.lab.member.model.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@RequestMapping(value = "/", method = { RequestMethod.POST, RequestMethod.GET })
	public String header() {
		return "Main";
	}

	@RequestMapping(value = "mypage", method = { RequestMethod.POST, RequestMethod.GET })
	public String mypage(HttpServletRequest request, HttpSession session, MemberVO vo, Model model) {
		MemberVO name = (MemberVO) session.getAttribute("loginMember");
		model.addAttribute("loginMember", name);
		return "mypage";
	}
}
