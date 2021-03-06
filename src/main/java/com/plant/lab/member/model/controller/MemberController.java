package com.plant.lab.member.model.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.Session;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.plant.lab.diary.model.vo.DiaryVO;
import com.plant.lab.member.model.service.MemberService;
import com.plant.lab.member.model.vo.MemberVO;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private static final String LIMIT = null;

	@Autowired
	private MemberService mService;

	@Autowired
	private JavaMailSender mailSender;

	private int pageBlock;

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinMember() {
		return "join";
	}

	@RequestMapping(value = "doJoin", method = RequestMethod.POST)
	public String doJoinMember(MemberVO vo) {
		System.out.println(vo);
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
		System.out.println("?????????" + session);
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

	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		/* ???(View)????????? ????????? ????????? ?????? */
		logger.info("????????? ????????? ?????? ??????");
		logger.info("???????????? : " + email);

		/* ????????????(??????) ?????? */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("???????????? " + checkNum);

		/* ????????? ????????? */
		String setFrom = "wlvhtm901@naver.com";
		String toMail = email;
		String title = "????????? ???????????? ?????? ????????? ?????????.";
		String content = "????????? ??????????????? ?????????????????? ???????????????." + "<br><br>" + "?????? ??????????????? ???????????? ???????????? ???????????? ?????????." + "<br>" + "?????? ????????? "
				+ checkNum + "?????????.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);

		return num;

	}

	@RequestMapping(value = "/update")
	public String registerUpdateView() throws Exception {

		return "modify";
	}

	@RequestMapping("doUpdate")
	public String userUpdate(MemberVO vo, HttpSession session) {

		mService.memberUpdate(vo);
		session.invalidate();

		return "Main";
	}

	@RequestMapping(value = "/delete")
	public String memberDeleteView() throws Exception {

		return "deleteUser";
	}

	// ????????? ??????
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, @RequestParam(name = "userPwd") String userPwd, Model model,
			HttpSession session) throws Exception {
		vo.setUserPwd(userPwd);

		MemberVO member = (MemberVO) session.getAttribute("loginMember");

		vo.setUserId(member.getUserId());

		int result = mService.memberDelete(vo);
		System.out.println(result);
		session.invalidate();

		return "Main";
	}

	@ResponseBody
	@RequestMapping(value = "/isExistIdPw")
	public String userDelete(MemberVO vo) throws Exception {
		int result = mService.isExistIdPw(vo);
		return Integer.toString(result);

	}

	@RequestMapping(value = "find_id_form")
	public String findIdView() {
		return "findId";
	}

	// ????????? ?????? ??????
	@RequestMapping(value = "find_id", method = RequestMethod.POST)
	public String findIdAction(MemberVO vo, Model model, HttpServletRequest request) {
		vo.setUserName(request.getParameter("userName"));
		vo.setPhone(Integer.parseInt(request.getParameter("phone")));
		System.out.println("vo???!~~~~~~~" + vo);
		String user = mService.findId(vo);
		System.out.println("???????????? " + user);

		if (user == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("userId", user);
			System.out.println(vo);
		}

		return "findId";
	}

	// ???????????? ?????? ???????????? ??????
	@RequestMapping(value = "find_password_form")
	public String findPasswordView() {
		return "findPassword";
	}

	// ???????????? ?????? ??????
	@RequestMapping(value = "find_password", method = RequestMethod.POST)
	public String findPasswordAction(MemberVO vo, Model model, HttpServletRequest request) {
		vo.setUserId(request.getParameter("userId"));
		vo.setUserName(request.getParameter("userName"));
		vo.setPhone(Integer.parseInt(request.getParameter("phone")));
		String user = mService.findPassword(vo);
		System.out.println("?????? ??????????????? " + user);

		if (user == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("userPwd", user);
		}

		return "findPassword";
	}

//	// ????????????
//	@RequestMapping(value = "/userList")
//	public String getUserList(Model model, MemberVO vo) throws Exception {
//		logger.info("getUserList()....");
//		model.addAttribute("userList", mService.getUserList(vo));
//		return "userList";
//
//	}

	// ???????????? ??????
	@RequestMapping(value="adminDelete.do")
	  public String adminUserDelete(MemberVO vo, @RequestParam(name="checkVal")List<Integer> userNo) throws Exception{
		
	
		  for(int i=0; i<userNo.size(); i++) {
		         System.out.println(userNo.get(i));
		         vo.setUserNo(userNo.get(i));
		       int result = mService.userDelete(vo);
		         System.out.println(i+"?????? result??? " + result);
		      }  
		  return "redirect:userList";
	  
	  
	}
	// ?????? ??????
	@RequestMapping(value="/userList")
	public String adminDiary(HttpSession session,
			HttpServletRequest request, Model model, MemberVO vo,
			@RequestParam(name="page", defaultValue = "1") int page,
		    @RequestParam(name="keyword", required = false) String keyword,
			@RequestParam(name="search", defaultValue = "") String search) {
	
		
		//=================??????????????????

			int startRowNum = (page - 1) * 5 + 1;
			int endRowNum = startRowNum + 5 - 1;
			MemberVO pageVo = new MemberVO();
			pageVo.setUserId(search);
			pageVo.setStartNum(startRowNum);
			pageVo.setEndNum(endRowNum);
			List<MemberVO> getUserList = mService.getSearchUser(pageVo);
			int recordTotalCount = mService.getUserTotalCnt(pageVo);
			int pageTotalCount = recordTotalCount / 5;
			if (recordTotalCount % 5 != 0) {
				pageTotalCount++;
			}
			//????????????
			if (page < 1) {
				page = 1;
			} else if (page > pageTotalCount) {
				page = pageTotalCount;
			}

			int startNavi = (page - 1) / 5 * 5 + 1;
			int endNavi = startNavi + 5 - 1;
			if (endNavi > pageTotalCount) {
				endNavi = pageTotalCount;
			}
			boolean needPrev = true;
			boolean needNext = true;

			if (startNavi == 1) {
				needPrev = false;
			}
			if (endNavi == pageTotalCount) {
				needNext = false;
			}
				
			StringBuilder sb = new StringBuilder();
			//temporary
			
			if (needPrev) {
				sb.append("<a href=userList?page=" + (startNavi - 1) + "&search="+search+"> </a>");
			}
			for (int i = startNavi; i <= endNavi; i++) {
				sb.append("<a href=userList?page=" + i +"&search=" + search + "> " + i + " </a>");
			}
			if (needNext) {
				sb.append("<a href=userList?page=" + (endNavi + 1) + "&search=" + search + ">   </a>");
			}
			model.addAttribute("page",sb.toString());
			model.addAttribute("userList",getUserList);
			//raise
			return "userList";
			
		

	}
	

}
