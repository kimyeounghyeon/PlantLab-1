package com.plant.lab;

import java.io.File;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.plant.lab.diary.model.Service.DiaryService;
import com.plant.lab.diary.model.Service.DiaryServiceImpl;
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
	
	@Autowired
	private DiaryServiceImpl dService;
	
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
	
//	@RequestMapping(value = "/productView", method = RequestMethod.GET)
//	public String home3(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "Product/ProductView";
//	}
	
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
	public ModelAndView listdiary(ModelAndView mv) {
		System.out.println("확인");
		System.out.println(dService.listDiary());
		System.out.println();
		mv.addObject("list",dService.listDiary());
		mv.setViewName("Plant/Diary");
		return mv;
	}
	
	@RequestMapping(value = "/writediary", method = RequestMethod.GET)
	public String writediary() {
		return "Plant/Writediary";
	}
	
	@RequestMapping(value = "diaryInsert.do", method = RequestMethod.POST)
	public ModelAndView boardInsert(DiaryVO vo, @RequestParam(name = "upfile", required = false) MultipartFile report,
			HttpServletRequest request, ModelAndView mv) {
		
		try {
				int result=0;
				if(report != null && !report.equals(""))
					saveFile(report, request);
				vo.setDiary_img_src(report.getOriginalFilename());
				result = dService.writeDiary(vo);
				mv.setViewName("redirect:diary");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "like.do", method = RequestMethod.POST)
	public ModelAndView like(ModelAndView mv, HttpServletRequest request, LikeVO lvo, @RequestParam(name = "user_no") int user_no, @RequestParam(name = "diary_no") int diary_no) {
		System.out.println("들어왔다");
		try {
			int result = 0;
			int likecnt = 0;
			System.out.println("숫자: " + user_no);
			System.out.println("숫자: " + diary_no);
			lvo.setUser_no(user_no);
			lvo.setDiary_no(diary_no);
			System.out.println(lvo);
			
			
			result = dService.like(lvo);
			System.out.println("result는 " + result);
			likecnt = dService.likecnt();
			System.out.println("좋아요 개수는 " + likecnt);
			mv.addObject("likecnt",dService.likecnt());
			mv.setViewName("redirect:diary");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "deletelike.do", method = RequestMethod.POST)
	public ModelAndView like(ModelAndView mv, @RequestParam(name = "diary_no") int diary_no) {
		System.out.println("딜리트 들어왔어용");
		try {
			int result = 0;
			int likecnt = 0;
			result = dService.deletelike(diary_no);
			likecnt = dService.likecnt();
			mv.addObject("like",dService.likecnt());
			mv.setViewName("redirect:diary");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	private void saveFile(MultipartFile report, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdir(); // 폴더가 없다면 생성한다.
		}
		
		String filePath = null;
		
		try {
			// 파일 저장
			System.out.println(report.getOriginalFilename() + "을 저장합니다.");
			System.out.println("저장 경로 : " + savePath);
			
			filePath = folder + "\\" + report.getOriginalFilename();
			
			report.transferTo(new File(filePath)); // 파일을 저장한다
			System.out.println("파일 명 : " + report.getOriginalFilename());
			System.out.println("파일 경로 : " + filePath);
			System.out.println("파일 전송이 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : "+ e.getMessage());
		}
	}
	
	private void removeFile(String board_file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		String filePath = savePath + "\\" + board_file;
		
		try {
			// 파일 삭제
			System.out.println(board_file + "을 삭제합니다.");
			System.out.println("기존 저장 경로 : " + savePath);
			
			File delFile = new File(filePath);
			delFile.delete();
			System.out.println("파일 삭제가 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 삭제 에러 : " + e.getMessage());
		}
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
	
	@RequestMapping(value="login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
}
