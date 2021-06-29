package com.plant.lab.oneday.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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

import com.plant.lab.member.model.vo.MemberVO;
import com.plant.lab.oneday.model.service.OnedayServiceImpl;
import com.plant.lab.oneday.model.vo.OnedayVo;

@Controller
//@SessionAttributes("user")
public class OnedayController {
	@Autowired
	private OnedayServiceImpl oService;
	private static final Logger log = LoggerFactory.getLogger(OnedayController.class);

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

	@RequestMapping(value = "/onedayDetail", method = RequestMethod.GET) // 원데이 클래스 상세 페이지
	public ModelAndView onedayDetail(ModelAndView mv, @RequestParam(name = "oneday_no") int oneday_no,
			HttpServletResponse response, HttpSession session) {
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out;

		MemberVO member = (MemberVO) session.getAttribute("loginMember"); // 로그인된 사람만 들어오기
		if (member == null) {
			log.info("C: 회원이 아닌 접근 ID - ");
			try {
				out = response.getWriter();
				mv.setViewName("redirect:logIn");
				out.println("<script>alert('로그인 해주세요'); </script>");
				out.println("<script> history.back(-1);</script>"); // redirect 불가능 로그인안하면 back
				out.flush();

			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		OnedayVo one = new OnedayVo();
		System.out.println("oneday_no:" + oneday_no);
		one.setOneday_no(oneday_no);
		OnedayVo oneVo = oService.onedayselect(one); // selectone 메소드 실행

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
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!" + oneday_no);
		mv.addObject("OneR", oneday_no);
		mv.setViewName("OnedayClass/onedayReserve");
		return mv;
	}

	// 원데이 클래스 insert 예약 controller
	@RequestMapping(value = "/onedayReserveRS", method = RequestMethod.POST) // 클래스 예약 rs에 insert 세션필요
	public ModelAndView onedayReserveRS(ModelAndView mv, @RequestParam(name = "onedayNo") int onedayNo, 
	@RequestParam(name = "oneRequest") String oneRequest, HttpServletRequest request, HttpSession session) {
		System.out.println(onedayNo);
		System.out.println(oneRequest + "입니다.");

		OnedayVo oneVo = new OnedayVo();
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		System.out.println("oneday_no:" + onedayNo);
		System.out.println("member.getUserNo()입니다.~~~" + member.getUserNo());
		oneVo.setUser_no(member.getUserNo());
		oneVo.setOneday_no(onedayNo);
		oneVo.setOneday_request(oneRequest);
		oneVo= oService.onedayselect(oneVo);
		
		System.out.println("결과 는~~~~~~~~~" + oneVo);
		try {
			int result = oService.onedayreserve(oneVo);
			
			System.out.println(result);
			mv.addObject("oneRsVo", result);
			mv.setViewName("Product/Order");
		} catch (Exception e) {
			mv.addObject("msg", "이미 예약한 클래스 입니다.");
			mv.setViewName("errorPage");
			return mv;
		}
		return mv;
	}

	@RequestMapping(value = "/onedayMy", method = RequestMethod.GET) // 원데이클래스 마이페이지 oneday 에 select , 취소하기 기능 넣기
	public ModelAndView onedayMy(ModelAndView mv, HttpSession session, HttpServletResponse response) {
		OnedayVo oneVo = new OnedayVo();
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		oneVo.setUser_no(member.getUserNo());
		System.out.println(member.getUserNo() + "ssssssssssssssss");
		if (oneVo.getUser_no() == 0) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script> alert('로그인을 해주세요.');</script>");
				out.println("<script> history.back(-1);</script>"); // redirect 불가능
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("oneVo 값" + oneVo);
		List<OnedayVo> one = oService.onedayMy(oneVo);
		System.out.println(one);
		if (one == null) {
			mv.addObject("nullMsg", "예약한 클래스가 없습니다.");
			mv.setViewName("OnedayClass/onedayMyPage");
		} else {

			mv.addObject("one", one);
			mv.setViewName("OnedayClass/onedayMyPage");
			System.out.println("my page 완료");
		}
		return mv;
	}

	@RequestMapping(value = "onedayCancle", method = RequestMethod.GET) // 클래스 예약 취소 delete 세션필요
	@ResponseBody
	public void onedayCancle(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "checkArray[]") List<Object> checkArr) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember"); // 로그인된 사람만 들어오기
		log.info("valueArr값은" + checkArr); // 들어온 값 확인

		try {
			for (Object ob : checkArr) {
				OnedayVo oneVo = new OnedayVo();
				System.out.println("ob값은" + ob);
				oneVo.setOneday_no(Integer.parseInt(ob.toString()));
				oneVo.setUser_no(member.getUserNo());
				System.out.println(oneVo.toString());
				//oService.onedaycancel(oneVo);
				System.out.println("결과"+oService.onedaycancel(oneVo));
				System.out.println(ob + "취소완료");
			}
		} catch (Exception e) {
			log.info("클래스 취소 실패");
			e.printStackTrace();

		}

	}

	@RequestMapping(value = "/onedayAdmin", method = RequestMethod.GET) // 원데이클래스 관리자 페이지 oneday 에 select
	public ModelAndView onedayadmin(ModelAndView mv, HttpSession session, HttpServletResponse response) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember"); // 로그인된 사람만 들어오기
//		if(grade == null || !(grade.equals(1))){
		if (member == null || !(member.getUserId().equals("jjr"))) { // login담당자 mapper 변경 요청 후 변경 시 getUserGrade로 변경
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

	/*
	 * @RequestMapping(value = "/onedayAd_Detail", method = RequestMethod.GET) //
	 * 원데이클래스 관리자 상세 페이지 oneday 에 selectone ,수정하기 public ModelAndView
	 * onedayAd_Detail(ModelAndView mv , @RequestParam(name = "onedayNo") int
	 * oneday_no ) {
	 * 
	 * OnedayVo one = new OnedayVo(); one.setOneday_no(oneday_no); OnedayVo oneVo =
	 * oService.onedayselect(one); // selectone 메소드 실행
	 * 
	 * if (oneVo == null) { mv.addObject("msg", "이미 마감된 클래스 입니다.");
	 * mv.setViewName("<script>history.back();</script>"); return mv; }
	 * 
	 * mv.addObject("oneVo", oneVo);
	 * 
	 * mv.setViewName("OnedayClass/onedayAd_Detail"); return mv; }
	 */

	@RequestMapping(value = "/onedaydelete", method = RequestMethod.GET) // 원데이클래스 관리자 삭제하기 기능 넣기
	@ResponseBody
	public void onedaydelete(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "checkArray[]") List<Object> checkArr) {
		log.info("valueArr값은" + checkArr); // 들어온 값 확인

		try {
			for (Object ob : checkArr) {
				OnedayVo oneVo = new OnedayVo();
				System.out.println("ob값은" + ob);
				oneVo.setOneday_no(Integer.parseInt(ob.toString()));
				oService.onedaydelete(oneVo);
				System.out.println(ob + "삭제완료");
			}
		} catch (Exception e) {
			log.info("클래스 삭제 실패");
			e.printStackTrace();

		}

	}

	@RequestMapping(value = "/onedayInsertResult", method = RequestMethod.POST, headers = ("content-type=multipart/*")) // 클래스
																														// 등록
																														// oneday
																														// 에
																														// insert
	public ModelAndView onedayInsertResult(ModelAndView mv, HttpServletRequest request,
			@RequestParam(name = "oneinsertS", required = false) MultipartFile report) throws Exception {
		System.out.println("여기로 들어오나요?~");
		OnedayVo oneIVo = new OnedayVo();
		String oneinsertN = request.getParameter("oneinsertN");
		System.out.println("oneinsertN:" + oneinsertN);
		oneIVo.setOneday_title(oneinsertN);
		System.out.println("여기2");
		try {
			if (report != null && !report.equals(""))
				saveFile(report, request);
			oneIVo.setOneday_img(report.getOriginalFilename());
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

		String oneinsertDS = request.getParameter("oneinsertDS");
		oneIVo.setOneday_start(oneinsertDS);

		String oneinsertDE = request.getParameter("oneinsertDE");
		oneIVo.setOneday_end(oneinsertDE);
		oService.onedayinsert(oneIVo);
		mv.addObject("oneIVo", oneIVo);
		System.out.println("oneIvVo입니당:" + oneIVo);
		mv.addObject("oneIVo", oneIVo);
//			mv.addObject("msg", "클래스 등록에 성공했습니다.");
		mv.setViewName("redirect:/onedayAdmin");
		return mv;

	}

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
			if (report != null && !report.equals(""))
				saveFile(report, request);
			oneUVo.setOneday_img(report.getOriginalFilename());
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

		String oneinsertDS = request.getParameter("oneinsertDS");
		oneUVo.setOneday_start(oneinsertDS);

		String oneinsertDE = request.getParameter("oneinsertDE");
		oneUVo.setOneday_end(oneinsertDE);

		oService.onedayupdate(oneUVo);
		mv.setViewName("redirect:/onedayAdmin");
		return mv;
	}

	@RequestMapping(value = "/onedayInsert", method = RequestMethod.GET) // 클래스 등록 oneday 에 insert 입력하는곳으로 이동
	public ModelAndView onedayInsert(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("OnedayClass/onedayInsert");
		return mv;
	}

	private void saveFile(MultipartFile report, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
//		String root = request.getSession().getServletContext().getRealPath("/");

		String savePath = root + "resources\\img";
		System.out.println();
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir(); // 폴더가 없다면 생성한다.
		}
		String filePath = null;
		try { // 파일 저장
			System.out.println(report.getOriginalFilename() + "을 저장합니다.");
			System.out.println("저장 경로 : " + savePath);
			filePath = folder + "\\" + report.getOriginalFilename();
			report.transferTo(new File(filePath)); // 파일을 저장한다
			System.out.println("파일 명 : " + report.getOriginalFilename());
			System.out.println("파일 경로 : " + filePath);
			System.out.println("파일 전송이 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
	}

	private void removeFile(String monthly_img, HttpServletRequest request) { // 사용안함 나중에 삭제하기
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

// ????????????????????????????????????????????강사님이 해주심???????????????????   
//	@RequestMapping(value = "/onedayReserve", method = RequestMethod.GET) // 클래스 예약 rs에 insert
//	public ModelAndView onedayReserve(ModelAndView mv, @RequestParam(name = "onedayNo") int oneday_no) {
//		OnedayVo one = new OnedayVo();
//		one.setOneday_no(oneday_no);
//		OnedayVo oneVo = oService.onedayselect(one); // selectone 메소드 실행
//		
//		mv.addObject("oneVo", oneVo);
//		mv.setViewName("OnedayClass/onedayRegister");
//		return mv;
//	}