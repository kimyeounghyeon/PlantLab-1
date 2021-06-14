package com.plant.lab;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "header";
	}
	
	
	//TODO 페이지 확인용 ========================================== 나중에 기능코드후 삭제
//	@RequestMapping(value = "/product", method = RequestMethod.GET)
//	public String home2(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "Product/ProductList";
//	}
	
	@RequestMapping(value = "/productView", method = RequestMethod.GET)
	public String home3(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "Product/ProductView";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String home4(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "Product/Cart";
	}
	
	@RequestMapping(value = "/diary", method = RequestMethod.GET)
	public String home5(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "Plant/Diary";
	}
	

	@RequestMapping(value = "/writediary", method = RequestMethod.GET)
	public String home6(Locale locale, Model model) {
		return "Plant/Writediary";
	}
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String joinMember() {
		return "join";
	}
	
	
	// ajax
	@RequestMapping(value="doJoin", method=RequestMethod.POST)
	public void doJoinMember(
			MemberVO vo	
			, HttpServletResponse response
			) {
		logger.info(vo.toString());
		int result = 0;
//		try {
			result = mService.insertMember(vo);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
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
	
	@RequestMapping(value="login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
}
