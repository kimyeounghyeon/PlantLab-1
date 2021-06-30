package com.plant.lab.att.model.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.plant.lab.att.model.service.AttService;
import com.plant.lab.att.model.vo.Att_tb;

@Controller
public class AttController {

	@Autowired
	private AttService aService;
	
	private static final Logger logger = LoggerFactory.getLogger(AttController.class);
	

	// 출석 메인페이지
		@RequestMapping(value = "/attendance", method = RequestMethod.GET)
		public ModelAndView listattendance(ModelAndView mv, HttpSession session, Att_tb a) {
			logger.info("attendance 진입 ");
			
			mv.setViewName("attendance");
			logger.info("attendance view 페이지 이동");
			return mv;
		}
	
	
	
	@RequestMapping(value = "/attendance.do", method = RequestMethod.POST)
	@ResponseBody
	public int getAtt(HttpSession session, HttpServletResponse response) {
	      	logger.info("attendance.do진입");
			response.setCharacterEncoding("UTF-8");
			
			
			// 로그인 전 코드
			Att_tb sessionVO = new Att_tb();
			sessionVO.setUser_no(122);   // session.getAtt....
			
			int result = aService.insertAtt(sessionVO);
			logger.info("attendance.do에서 result = 출석은 " + result);
			
		   
			int attCnt = aService.attCnt(sessionVO);
		      

		    return attCnt;
		   }
	
	
//	// 출석 클릭
//	// 이거 호출하는 곳이 없는 것 같아요? 사용한 적 있는 url 인가요?아니오...
//	@RequestMapping(value = "/insertatt", method = RequestMethod.POST)
//	@ResponseBody
//	public String insertAtt(HttpSession session, ModelAndView mv, Model model
//			) {
//
//		System.out.println("들어왔다");
//		int result = -1;
//
//		System.out.println(model.containsAttribute("attList"));
//		try {
//			// 로그인 전에 임시 테스트 코드입니다.
//			//TODO: session 
//			int user_no = 122;  // 로그인 전에 임시 테스트 코드입니다.  // session.getAtt....
//			System.out.println("숫자: " + user_no);
//			
//			Att_tb a = new Att_tb();
//			a.setUser_no(user_no);
//			
//			System.out.println(a.toString());
//
//			// likeCnt 함께 처리함. 
//			result = aService.insertAtt(a);// dService.likeCnt(a); 포함
//			System.out.println("attdo에서 result = 출석은 " + result);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return String.valueOf(result);
//	}


	
//	// 좋아요 수 카운트
//	@RequestMapping(value = "/attcnt", method = RequestMethod.POST)
//	@ResponseBody
//	public String attCnt(HttpServletRequest request, 
//			@RequestParam(name = "user_no") int user_no
//			){
//		System.out.println("카운트 들어왔다");
//		int attcnt = 0;
//		Att_tb a = new Att_tb();
//		try {
//			System.out.println("11111숫자 like: " + user_no);
//			a.setUser_no(user_no);
//			attcnt = aService.attCnt(a);
//			System.out.println("11111좋아요 개수는 " + attcnt);
//		} catch (Exception e) {
//
//		}
//		return String.valueOf(attcnt);
//	}
}
