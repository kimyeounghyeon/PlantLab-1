package com.plant.lab;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
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
	private DiaryService dService;
	
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
	
//	@RequestMapping(value = "/cart", method = RequestMethod.GET)
//	public String home4(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "Product/Cart";
//	}
	
	@RequestMapping(value = "/diary", method = RequestMethod.GET)
	public ModelAndView listdiary(ModelAndView mv, HttpSession session, LikeVO lvo, DiaryVO vo) {
		System.out.println("[영현]diary 진입");

		// 로그인 전에 임시 테스트 코드입니다.
		//TODO: session 
//		LikeVO sessionVO = new LikeVO();
//		sessionVO.setUser_no(122);   // session.getAtt....
//		
//		mv.addObject("listDiary", dService.listDiary());
//		mv.addObject("likeList", dService.likeList(sessionVO));
		
		mv.setViewName("Plant/Diary");
		System.out.println("[영현]diary view 페이지 이동");
		return mv;
	}
	
	@RequestMapping(value = "/writediary", method = RequestMethod.GET)
	public String writediary() {
		return "Plant/Writediary";
	}
	
	@RequestMapping(value = "/diaryInsert.do", method = RequestMethod.POST)
	public ModelAndView boardInsert(DiaryVO vo, @RequestParam(name = "upfile", required = false) MultipartFile report,
			HttpServletRequest request, ModelAndView mv) {
			System.out.println("인서트하러왔어요");
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
	
	
	@RequestMapping(value = "/diary.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public void getDiary(HttpSession session, HttpServletResponse response) {
		System.out.println("[영현]diary.do 진입");

		// 로그인 전에 임시 테스트 코드입니다.
		//TODO: session 
		LikeVO sessionVO = new LikeVO();
		sessionVO.setUser_no(122);   // session.getAtt....
		List<DiaryVO> listDiary = dService.listDiary();
		List<Integer> likeList = dService.likeList(sessionVO);
		JsonArray jArray = new JsonArray();
		response.setCharacterEncoding("UTF-8");
	      // JsonObject 생성
	      JsonObject jsonObject = new JsonObject();
	      try {
	         for(int i=0; i<listDiary.size(); i++) {
	            JsonObject jobj = new JsonObject();
	            jobj.addProperty("diary_no", listDiary.get(i).getDiary_no());
	            jobj.addProperty("diary_write", listDiary.get(i).getDiary_write());
	            jobj.addProperty("diary_content", listDiary.get(i).getDiary_content());
	            jobj.addProperty("diary_date", String.valueOf(listDiary.get(i).getDiary_date()));            
	            jobj.addProperty("diary_views", listDiary.get(i).getDiary_views());
	            jobj.addProperty("diary_img_num", listDiary.get(i).getDiary_img_num());
	            jobj.addProperty("diary_img_src", listDiary.get(i).getDiary_img_src());
	            jobj.addProperty("user_id", listDiary.get(i).getUser_id().toString());
	            jobj.addProperty("user_name", listDiary.get(i).getUser_name().toString());
	            jobj.addProperty("like_cnt", listDiary.get(i).getLike_cnt());
//	            jobj.addProperty("diary, value);
	            jArray.add(jobj);
	         }
//	         for(int j=0; j<likeList.size(); j++) {
//	        	 JsonObject jobj2 = new JsonObject();
//	        	 jobj2.addProperty("diary_no", likeList.get(j).getDiary_no());
//	        	 
//	         }


	         jsonObject.add("listDiary", jArray);
	         System.out.println("제이슨으로 넘긴 데이터" + jArray);
	      } catch (NullPointerException e) {
	         System.out.println("값이 없습니다.");
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      Gson gson = new GsonBuilder().setPrettyPrinting().create();
	      String jsonOutput = gson.toJson(jsonObject);
	      
	      try {
	    	  response.getWriter().write(jsonOutput.toString());
			System.out.println("데이터 잘 갔나 확인 좀 " + jsonOutput);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("[영현]diary view 페이지 이동");
	}
	
	
	
	@RequestMapping(value = "insertlike.do", method = RequestMethod.POST)
	@ResponseBody
	public String insertlike(HttpSession session, ModelAndView mv, Model model, @RequestParam(name = "diary_no") int diary_no) {
		System.out.println("들어왔다");
		int result = -1;

		System.out.println(mv.getModel());
		System.out.println(model.containsAttribute("likeList"));
		try {
			// 로그인 전에 임시 테스트 코드입니다.
			//TODO: session 
			int user_no = 122;  // 로그인 전에 임시 테스트 코드입니다.  // session.getAtt....
			System.out.println("숫자: " + user_no);
			System.out.println("숫자: " + diary_no);
			
			LikeVO lvo = new LikeVO();
			lvo.setUser_no(user_no);
			lvo.setDiary_no(diary_no);
			
			System.out.println(lvo.toString());

			// likeCnt 함께 처리함. 
			result = dService.insertLike(lvo);// dService.likeCnt(lvo); 포함
			System.out.println("like.do에서 result = 좋아요는 " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "deletelike.do", method = RequestMethod.POST)
	@ResponseBody
	public String deletelike(HttpSession session, ModelAndView mv, Model model, @RequestParam(name = "diary_no") int diary_no) {
		System.out.println("딜리트 들어왔어용");
		int result = -1;

		System.out.println(mv.getModel());
		System.out.println(model.containsAttribute("likeList"));
		try {
			// 로그인 전에 임시 테스트 코드입니다.
			//TODO: session 
			int user_no = 122;  // 로그인 전에 임시 테스트 코드입니다.  // session.getAtt....
			System.out.println("숫자: " + user_no);
			System.out.println("숫자: " + diary_no);
			
			LikeVO lvo = new LikeVO();
			lvo.setUser_no(user_no);
			lvo.setDiary_no(diary_no);
			
			System.out.println(lvo.toString());

			// likeCnt 함께 처리함. 
			result = dService.deleteLike(lvo);// dService.likeCnt(lvo); 포함
			System.out.println("like.do에서 result = 좋아요 " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(result);
	}

	
	
	@RequestMapping(value = "/likecnt.do", method = RequestMethod.POST)
	@ResponseBody
	public String likecnt(HttpServletRequest request, 
			@RequestParam(name = "user_no") int user_no, 
			@RequestParam(name = "diary_no") int diary_no) {
		System.out.println("카운트 들어왔다");
		int likecnt = 0;
		LikeVO lvo = new LikeVO();
		try {
			System.out.println("11111숫자 like: " + user_no);
			System.out.println("11111숫자 like2 diary: " + diary_no);
			lvo.setUser_no(user_no);
			lvo.setDiary_no(diary_no);
			likecnt = dService.likeCnt(lvo);
			System.out.println("11111좋아요 개수는 " + likecnt);
		} catch (Exception e) {

		}
		return String.valueOf(likecnt);
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
	
	@RequestMapping(value="/join", method = {RequestMethod.POST, RequestMethod.GET})
	public String joinMember() {
		return "join";
	}
	@RequestMapping(value="header",method = {RequestMethod.POST, RequestMethod.GET})
	public String header() {
		return "header";
	}
	
	@RequestMapping(value="doJoin", method = {RequestMethod.POST, RequestMethod.GET})
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
	



	@RequestMapping(value="login")
	public String memberLogin(MemberVO vo, Model model, HttpSession session) {
		
		System.out.println("[계원] id와 pwd 정보 들어있음을 확인" +vo.toString());  
		
		MemberVO login = mService.loginMember(vo);   // 로그인 성공시 vo에 정보가 들어있고. 실패시 null

		if (login == null) {
			model.addAttribute("msg", "로그인 실패");
		} else {
			session.setAttribute("loginMember", vo);
		}

		return "logIn";

	}
	
@RequestMapping(value = "logout", method = {RequestMethod.POST, RequestMethod.GET})
public String memberOut(Model model, HttpServletRequest request) {
	HttpSession session = request.getSession();
	session.removeAttribute("loginMember");
	

	return "logOut";
}
}
