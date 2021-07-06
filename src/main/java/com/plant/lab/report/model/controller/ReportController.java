package com.plant.lab.report.model.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.plant.lab.cart.model.controller.CartController;
import com.plant.lab.diary.model.Service.DiaryService;
import com.plant.lab.member.model.vo.MemberVO;
import com.plant.lab.order.model.vo.Order;
import com.plant.lab.report.model.service.ReportService;
import com.plant.lab.report.model.vo.Report;

@Controller
public class ReportController {
	@Autowired
	private ReportService reportService;
	@Autowired
	private DiaryService dService;
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
//신고가 들어올 경우
	@RequestMapping(value="/report", method=RequestMethod.POST)
	public ModelAndView orderPro(ModelAndView mv,
			Report report,HttpSession session,
			HttpServletRequest req,
			RedirectAttributes redirectAttributes) {
		logger.info("===============신고 컨트롤===============");
		
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		report.setReport_user_no(member.getUserNo());
		
		int check = reportService.checkReport(report);
		
		
		 logger.info("check::::"+check);
		
		if(check <= 0) {
			report.setReported_user_no(dService.detailWrite(report.getR_diary_no()));			
			reportService.insertReport(report);
			mv.addObject("reportM","ok");
			mv.setViewName("Plant/Diary");
		}else {
			 redirectAttributes.addFlashAttribute("reportM", "no");
			 String referer = req.getHeader("Referer");
			 
			
			 
			 
			 mv.setViewName("redirect:"+ referer);
		}
		
		return mv;
	}
}
