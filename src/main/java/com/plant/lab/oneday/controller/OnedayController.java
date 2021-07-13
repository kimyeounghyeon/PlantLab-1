package com.plant.lab.oneday.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.plant.lab.member.model.vo.MemberVO;
import com.plant.lab.oneday.model.service.OnedayServiceImpl;
import com.plant.lab.oneday.model.vo.OnedayVo;
import com.plant.lab.order.model.vo.OrderDetail;

@Controller
public class OnedayController {
	@Autowired
	private OnedayServiceImpl oService;
	private static final Logger log = LoggerFactory.getLogger(OnedayController.class);

	
	
	//onedayclass Main page (등록된 클래스 list)
	@RequestMapping(value = "onedayMain", method = RequestMethod.GET) // oneday class 메인 페이지
	public ModelAndView onedayMain(ModelAndView mv) {

		List<OnedayVo> one = new ArrayList<OnedayVo>();
		one = oService.onedayselectlist();
		if (one == null) {
			mv.addObject("msg", "진행 중인 클래스가 없습니다.");
			System.out.println("진행 중인 클래스가 없습니다.");
			mv.setViewName("<script>history.back();</script>"); // histroy back 하는 방법 찾기 or mainpage만들어지면 redirct
																// mainpage로
			mv.setViewName("main");
			return mv;
		}
		mv.addObject("one", one);
		mv.setViewName("OnedayClass/onedayMain");
		return mv;
	}

	
	
	// 원데이 클래스 상세 페이지
	@RequestMapping(value = "/onedayDetail", method = RequestMethod.GET) 
	public ModelAndView onedayDetail(ModelAndView mv, @RequestParam(name = "oneday_no") int oneday_no,
			HttpServletResponse response, HttpSession session) {
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out;

		MemberVO member = (MemberVO) session.getAttribute("loginMember"); // 로그인된 사람만 들어오기
		/* if (member == null) { */
		if(member == null || member.getUserId() == "" ) {
			log.info("C: 회원이 아닌 접근 ID - ");
			try {
			out = response.getWriter();
			out.println("<script>alert('로그인 해주세요'); </script>");
			out.flush();
			
			mv.setViewName("logIn");
			return mv;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			

		}
		OnedayVo one = new OnedayVo();
		System.out.println("oneday_no:" + oneday_no);
		one.setOneday_no(oneday_no);
		OnedayVo oneVo = oService.onedayselect(one); // selectone 메소드 실행
		System.out.println(oneVo);
		if (oneVo == null) {
			mv.addObject("msg", "이미 마감된 클래스 입니다.");
			mv.setViewName("<script>history.back();</script>");
			return mv;
		}

		mv.addObject("oneVo", oneVo);
		mv.setViewName("OnedayClass/onedayDetail");
		return mv;
	}

	
	
	
	
	// 원데이 클래스 예약하는 페이지 넘어가는 컨트롤러
	@RequestMapping(value = "/onedayReserve", method = RequestMethod.POST) // 클래스 예약 rs에 insert 세션필요
	public ModelAndView onedayReserve(ModelAndView mv, @RequestParam(name = "onedayNo") int oneday_no,
			HttpServletRequest request, HttpSession session, @ModelAttribute("user") MemberVO user) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!" + oneday_no);
		OnedayVo one = new OnedayVo();
		one.setOneday_no(oneday_no);
		OnedayVo oneVo = oService.onedayselect(one); // selectone 메소드 실행
		//mv.addObject("OneR", oneday_no);
		mv.addObject("user",member);
		mv.addObject("OneR", oneVo);
		mv.setViewName("OnedayClass/onedayReserve");
		return mv;
	}

	
	
	
	
	//회원 원데이 클래스  예약 
	@RequestMapping(value = "/onedayReserveRS", method = RequestMethod.POST) // 클래스 예약 rs에 insert 세션필요
	public ModelAndView onedayReserveRS(ModelAndView mv, @RequestParam(name = "onedayNo") int onedayNo, 
	@RequestParam(name = "oneRequest") String oneRequest,@RequestParam(name = "reservDate") String reservDate,  HttpServletRequest request, HttpSession session) {
		System.out.println(onedayNo);
		System.out.println(oneRequest + "입니다.");

		OnedayVo oneVo = new OnedayVo();
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		System.out.println("oneday_no:" + onedayNo);
		System.out.println("member.getUserNo()입니다.~~~" + member.getUserNo());
		System.out.println(member);
		oneVo.setUser_no(member.getUserNo());
		oneVo.setOneday_no(onedayNo);
		
		oneVo.setOneday_request(oneRequest);
		oneVo.setReserv_date(reservDate);   //예약을 원하는 날짜
		System.out.println("원하는 예약일이 들어감"+reservDate);
		System.out.println("원하는 요청 들어감"+oneRequest);
		System.out.println("결과 는~~~~~~~~~" + oneVo);
		oneVo = oService.onedayselect(oneVo);
		oneVo.setOneday_request(oneRequest);
		oneVo.setReserv_date(reservDate);   //예약을 원하는 날짜
		
		//int result = oService.onedayreserve(oneVo);    //구매하면 예약됨--> order controller로 이동
//		System.out.println(result);
//		mv.addObject("oneRsVo", result);
		mv.addObject("user",member);
		mv.addObject("oneRsVo",oneVo);
		mv.setViewName("Product/Order");
	
		
		return mv;
	}

	
	
	
	//회원 마이페이지    예약한  원데이클래스 list
	@RequestMapping(value = "/onedayMy", method = RequestMethod.GET) 
	public ModelAndView onedayMy(ModelAndView mv, HttpSession session, HttpServletResponse response) {
		OnedayVo oneVo = new OnedayVo();
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		oneVo.setUser_no(member.getUserNo());
		System.out.println(member.getUserNo() + "ssssssssssssssss");
		/* if (oneVo.getUser_no() == 0) { */
		if(member == null || member.getUserId() == "" ) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script> alert('로그인을 해주세요.');</script>");
				out.flush();
			mv.setViewName("logIn");
			return mv;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
				}
		System.out.println("oneVo 값" + oneVo);
		List<OnedayVo> one = oService.onedayMy(oneVo);
		System.out.println(one);
		mv.addObject("nullMsg", "예약된 클래스가 없습니다.");
		if (one == null) {
			mv.setViewName("OnedayClass/onedayMyPage");
		} else {

			mv.addObject("one", one);
			mv.setViewName("OnedayClass/onedayMyPage");
			System.out.println("my page 완료");
		}
		return mv;
	}

	
	
	//회원 원데이 클래스 예약 취소
	@RequestMapping(value = "onedayCancle", method = RequestMethod.GET) // 클래스 예약 취소 delete 세션필요
	@ResponseBody
	public void onedayCancle(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(name = "reserv_no" , required = false) int reserv_no ) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember"); // 로그인된 사람만 들어오기
		log.info("valueArr값은" + reserv_no); // 들어온 값 확인

		try {
				OnedayVo oneVo = new OnedayVo();
				oneVo.setOneday_no(reserv_no);
				oneVo.setUser_no(member.getUserNo());
				System.out.println(oneVo.toString());
				//oService.onedaycancel(oneVo);
				System.out.println("결과"+oService.onedaycancel(oneVo));
				System.out.println(oneVo + "취소완료");
			
		} catch (Exception e) {
			log.info("클래스 취소 실패");
			e.printStackTrace();

		}

	}

	
	
	
	// 관리자  원데이클래스  Main
	@RequestMapping(value = "/onedayAdmin", method = RequestMethod.GET) 
	public ModelAndView onedayadmin(ModelAndView mv, HttpSession session, HttpServletResponse response) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember"); // 로그인된 사람만 들어오기
		if(member == null || member.getGrade() != 1 ){  //관리자만 가능
			log.info("C: 관리자아닌 접근 ID - ");
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script> alert('관리자 페이지 입니다.');</script>");
				out.println("<script> history.back(-1);</script>"); // redirect 불가능
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		List<OnedayVo> one = new ArrayList<OnedayVo>();
		one = oService.onedayselectlist();

		if (one == null) {
			mv.setViewName("main"); // 에러페이지 만들기 혹은 alert
			return mv;
		}
		mv.addObject("one", one);
		mv.setViewName("OnedayClass/onedayAdmin");
		return mv;
	}


	
	
	// 관리자 원데이클래스 삭제
	@RequestMapping(value = "/onedaydelete", method = RequestMethod.GET) 
	@ResponseBody
	public void onedaydelete(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "checkArray[]") List<Object> checkArr) {
		log.info("valueArr값은" + checkArr); // 들어온 값 확인

		try {
			for (Object ob : checkArr) {
				OnedayVo oneVo = new OnedayVo();
				System.out.println("ob값은" + ob);
				oneVo.setOneday_no(Integer.parseInt(ob.toString()));
				System.out.println("::::::"+oneVo.getOneday_no());
				oService.onedaydelete(oneVo);
				System.out.println(ob + "삭제완료");
			}
		} catch (Exception e) {
			log.info("클래스 삭제 실패");
			e.printStackTrace();

		}

	}

	
	
	
	
	 //관리자 원데이 클래스 등록하는 곳으로 이동
	@RequestMapping(value = "/onedayInsert", method = RequestMethod.GET)
	public ModelAndView onedayInsert(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("OnedayClass/onedayInsert");
		return mv;
	}
	
	
	//관리자 원데이 클래스 등록 
	@RequestMapping(value = "/onedayInsertResult", method = RequestMethod.POST, headers = ("content-type=multipart/*")) 
	public ModelAndView onedayInsertResult(ModelAndView mv, HttpServletRequest request,
			@RequestParam(name = "oneinsertS", required = false) MultipartFile report) throws Exception {
		System.out.println("여기로 들어오나요?~");
		OnedayVo oneIVo = new OnedayVo();
		String oneinsertN = request.getParameter("oneinsertN");
		System.out.println("oneinsertN:" + oneinsertN);
		oneIVo.setOneday_title(oneinsertN);
		System.out.println("여기2");
		try {
			if (report != null && !report.equals("")) {
				String url = saveFile(report, request);
				oneIVo.setOneday_img(url);
			}
		} catch (Exception e) {
			mv.addObject("msg", "파일 업로드가 실패했습니다.");
			mv.setViewName("errorPage");
		}

		String oneinsertPR = request.getParameter("oneinsertPR");
		oneIVo.setOneday_price(Integer.parseInt(oneinsertPR));

		String oneinsertM = request.getParameter("oneinsertM");
		oneIVo.setOneday_maxPerson(Integer.parseInt(oneinsertM));

		String oneinsertC = request.getParameter("oneinsertC");
		oneIVo.setOneday_content(oneinsertC);

		String oneinsertP = request.getParameter("oneinsertP");
		oneIVo.setOneday_place(oneinsertP);
		
		String oneinsertPD = request.getParameter("oneinsertPD");
		oneIVo.setOneday_dtailPlace(oneinsertPD);

		String oneinsertDS = request.getParameter("oneinsertDS");
		oneIVo.setOneday_start(oneinsertDS);

		String oneinsertDE = request.getParameter("oneinsertDE");
		oneIVo.setOneday_end(oneinsertDE);
		
		String oneinsertST = request.getParameter("oneinsertST");
		oneIVo.setOneday_Stime(oneinsertST);
		String oneinsertET =request.getParameter("oneinsertET");
		oneIVo.setOneday_Etime(oneinsertET);
		System.out.println(oneinsertET);
		System.out.println("vo체크::::"+oneIVo);
		oService.onedayinsert(oneIVo);
		
		mv.addObject("oneIVo", oneIVo);
		System.out.println("oneIvVo입니당:" + oneIVo);
		mv.addObject("oneIVo", oneIVo);
		mv.addObject("msg", "클래스 등록에 성공했습니다.");
		mv.setViewName("redirect:/onedayAdmin");
		return mv;

	}

	
	
	
	//관리자 원데이 클래스 수정페이지 이동
	@RequestMapping(value = "/onedayupdate", method = RequestMethod.GET) // 클래스 수정 oneday 에 update
//	@ResponseBody
	public ModelAndView onedayupdate(ModelAndView mv, @RequestParam(name = "onedayNo") String oneday_no) {
		OnedayVo onevo = new OnedayVo();
		onevo.setOneday_no(Integer.parseInt(oneday_no));
		OnedayVo one = oService.onedayselect(onevo);
		System.out.println("onedayno 값 확인" + onevo.getOneday_no());
		mv.addObject("one", one);
		mv.setViewName("OnedayClass/onedayUpdate");
		System.out.println("이동안하니?1");
		return mv;
	}

	
	
	
	
	
	//관리자 원데이 클래스 수정
	@RequestMapping(value = "/onedayUpdateRs", method = RequestMethod.POST) // 클래스 수정 oneday 에 update
	public ModelAndView onedayUpdateRs(ModelAndView mv, OnedayVo oneUVo, HttpServletResponse response,
			HttpServletRequest request, @RequestParam(name = "oneinsertS", required = false) MultipartFile report)
			throws Exception {
		//
		String oneupNo = request.getParameter("oneno");
		oneUVo.setOneday_no(Integer.parseInt(oneupNo));

		String oneinsertN = request.getParameter("oneinsertN");
		System.out.println("oneinsertN:" + oneinsertN);
		oneUVo.setOneday_title(oneinsertN);
		System.out.println("여기2");
		try {
			if (report != null && !report.equals("")) {
				String url = saveFile(report, request);
				oneUVo.setOneday_img(url);
			}
		} catch (Exception e) {
			mv.addObject("msg", "파일 업로드가 실패했습니다.");
			mv.setViewName("errorPage");
		}

		String oneinsertPR = request.getParameter("oneinsertPR");
		oneUVo.setOneday_price(Integer.parseInt(oneinsertPR));

		String oneinsertM = request.getParameter("oneinsertM");
		oneUVo.setOneday_maxPerson(Integer.parseInt(oneinsertM));

		String oneinsertC = request.getParameter("oneinsertC");
		oneUVo.setOneday_content(oneinsertC);

		String oneinsertP = request.getParameter("oneinsertP");
		oneUVo.setOneday_place(oneinsertP);

		String oneinsertPD = request.getParameter("oneinsertPD");
		oneUVo.setOneday_dtailPlace(oneinsertPD);

		String oneinsertDS = request.getParameter("oneinsertDS");
		oneUVo.setOneday_start(oneinsertDS);

		String oneinsertDE = request.getParameter("oneinsertDE");
		oneUVo.setOneday_end(oneinsertDE);
		
		String oneinsertST = request.getParameter("oneinsertST");
		oneUVo.setOneday_Stime(oneinsertST);;
		
		String oneinsertET = request.getParameter("oneinsertET");
		oneUVo.setOneday_Etime(oneinsertET);;
		
		

		oService.onedayupdate(oneUVo);
		mv.setViewName("redirect:/onedayAdmin");
		return mv;
	}

	
	
	
	

	//이미지 저장 메소드  (외부 서버 연결)
	private String saveFile(MultipartFile report, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\img";
		File folder = new File(savePath);
		String url = "";
		if (!folder.exists()) {
			folder.mkdir(); // 폴더가 없다면 생성한다.
		}
		
		String filePath = null;
		
		try { // 파일 저장
			System.out.println(report.getOriginalFilename() + "을 저장합니다.");
			System.out.println("저장 경로 : " + savePath);
			
			filePath = folder + "\\" + report.getOriginalFilename();
			
			report.transferTo(new File(filePath)); // 파일을 저장한다
			
			Map config = new HashMap();
			config.put("cloud_name", "djdjsp7t1");
			config.put("api_key", "862183527995216");
			config.put("api_secret", "TBR2K0Q2UcJ3BbbFG0JdWxVjXXI");
			Cloudinary cloudinary = new Cloudinary(config);
			
			Map res = cloudinary.uploader().upload(new File(filePath), ObjectUtils.emptyMap()); 
			url = res.get("url") == null ? "" : res.get("url").toString(); 
			System.out.println("::::"+url);

			System.out.println("파일 명 : " + report.getOriginalFilename());
			System.out.println("파일 경로 : " + filePath);
			System.out.println("파일 전송이 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		
		return url;
	}
	
	//마이페이지 주문내역 ajax
		@RequestMapping(value="/orderClass1", method=RequestMethod.GET)
		public void orderClass(@RequestParam(name = "reserv_no") int reserv_no,
				HttpSession session,HttpServletResponse response) {
			try {
				log.info("===============주문이미지 ajax===============");
				response.setCharacterEncoding("UTF-8");
				
				log.info("번호확인!!!!:::"+reserv_no);
				OnedayVo vo = new OnedayVo();
				vo.setOneday_no(reserv_no);
				
				OnedayVo one = oService.onedayselect(vo);
				
				
				Gson gson = new GsonBuilder().setPrettyPrinting().create();
				String jsonOutput = gson.toJson(one);
				
				try {
					response.getWriter().write(jsonOutput.toString());
					System.out.println("데이터확인:::" + jsonOutput);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}catch (Exception e) {
				log.info("!!!!!!주문이미지 AJAX1 오류!!!!!!");
				e.printStackTrace();
			}
		}
	
	
	
	
	
	
 // 사용안함 나중에 삭제하기
	private void removeFile(String monthly_img, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\img";

		String filePath = savePath + "\\" + monthly_img;
		try { // 파일 저장
			System.out.println(monthly_img + "을 삭제합니다.");
			System.out.println("기존 저장 경로 : " + savePath);
			File delFile = new File(filePath);
			delFile.delete();
			System.out.println("파일 삭제가 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 삭제 에러 : " + e.getMessage());
		}
	}

}
