package com.plant.lab.oneday.controller;

import java.io.File; 
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.plant.lab.member.model.vo.MemberVO;
import com.plant.lab.oneday.model.service.OnedayServiceImpl;
import com.plant.lab.oneday.model.vo.OnedayVo;

import oracle.sql.DATE;

@Controller
//@SessionAttributes("user")
public class OnedayController {
	@Autowired
	private OnedayServiceImpl oService;

	@RequestMapping(value = "onedayMain", method = RequestMethod.GET) // selectlist
	public ModelAndView onedayMain(ModelAndView mv) {

		List<OnedayVo> one = new ArrayList<OnedayVo>();
		one = oService.onedayselectlist();
		if (one == null) {
			mv.addObject("msg", "진행 중인 클래스가 없습니다.");
			System.out.println("진행 중인 클래스가 없습니다.");
			mv.setViewName("<script>history.back();</script>"); // histroy back 하는 방법 찾기
			mv.setViewName("main");
			return mv;
		}
		mv.addObject("one", one);
		mv.setViewName("OnedayClass/onedayMain");
		return mv;
	}

	@RequestMapping(value = "/onedayDetail", method = RequestMethod.POST) // selectone
	public ModelAndView onedayDetail(ModelAndView mv,  @RequestParam(name = "oneday_no")  int oneday_no) {
		OnedayVo one = new OnedayVo();
		System.out.println("oneday_no:"+oneday_no);
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

	
	
	

	
	// 원데이 클래스 예약하는  페이지 넘어가는 컨트롤러
	@RequestMapping(value = "/onedayReserve", method = RequestMethod.POST) // 클래스 예약 rs에 insert 세션필요
	public ModelAndView onedayReserve(ModelAndView mv, @RequestParam(name = "onedayNo") int oneday_no,
			HttpServletRequest request,HttpSession session , @ModelAttribute("user") MemberVO user) {
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!"+oneday_no);
		mv.addObject("OneR", oneday_no );
		mv.setViewName("OnedayClass/onedayReserve");
		return mv;
	}
	
	
	// 원데이 클래스 insert 예약  controller
	@RequestMapping(value = "/onedayReserveRS", method = RequestMethod.POST) // 클래스 예약 rs에 insert 세션필요
	public ModelAndView onedayReserveRS(ModelAndView mv, 
			 @RequestParam(name = "onedayNo") int onedayNo, //!!!!!현재 이게 문제임!!!!!!
			@RequestParam(name = "oneRequest") String oneRequest , //이건 괜찮음
			HttpServletRequest request, 
			HttpSession session   ) {
		System.out.println(onedayNo);
		System.out.println(oneRequest+"ㄴㄴㄴㄴㄴㄴㄴ");
		
		OnedayVo oneVo = new OnedayVo();
		MemberVO member = (MemberVO) session.getAttribute("loginMember"); 
		System.out.println("oneday_no:"+onedayNo);
		System.out.println("member.getUserNo()입니다.~~~"+member.getUserNo());
//		oneVo.setUser_no(Integer.parseInt(member.getUserNo()));   //int 로 꾸면 partseint 지우기
		oneVo.setOneday_no(onedayNo);
		oneVo.setOneday_request(oneRequest);
		System.out.println("결과 는~~~~~~~~~"+oneVo);
		int result = oService.onedayreserve(oneVo);
		System.out.println(result);
		mv.addObject("oneRsVo", result);
		mv.setViewName("Product/Order");
		return mv;
	}
	


	
	
	@RequestMapping(value = "/onedayCancle", method = RequestMethod.GET) 		// 클래스 예약 취소 delete 세션필요
	public ModelAndView onedayCancle(ModelAndView mv, @RequestParam(name = "onedayNo") int oneday_no,
			HttpServletRequest request, @ModelAttribute("user") MemberVO user) {

		mv.setViewName("OnedayClass/onedaymypage");
		return mv;
	}

	
	
	
	
	@RequestMapping(value = "/onedayMy", method = RequestMethod.GET) 			// 원데이클래스 마이페이지 oneday 에 select , 취소하기 기능 넣기
	public ModelAndView onedaymypage(ModelAndView mv) {
		List<OnedayVo> one = new ArrayList<OnedayVo>();
		OnedayVo one_C = new OnedayVo();
		one = oService.onedayselectlist();
		int one_cancel = oService.onedaycancel(one_C);
		if (one == null) {
			mv.setViewName("main");
			return mv;
		}
		mv.addObject("one", one);
		mv.setViewName("OnedayClass/onedayMyPage");
		return mv;
	}

	
	
	
	@RequestMapping(value = "/onedayAdmin", method = RequestMethod.GET) 		// 원데이클래스 관리자 페이지 oneday 에 select 
	public ModelAndView onedayadmin(ModelAndView mv) {		
		List<OnedayVo> one = new ArrayList<OnedayVo>();
		one = oService.onedayselectlist();

		if (one == null) {
			mv.setViewName("main");
			return mv;
		}
		mv.addObject("one", one);
		mv.setViewName("OnedayClass/onedayAdmin");
		return mv;
	}

	
	@RequestMapping(value = "/onedayAd_Detail", method = RequestMethod.GET) // 원데이클래스 관리자  상세    페이지  oneday 에 selectone , ,삭제하기 기능 넣기
	public ModelAndView onedayAd_Detail(ModelAndView mv, @RequestParam(name = "onedayNo") int oneday_no) {
		OnedayVo one = new OnedayVo();
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
	
	
	@RequestMapping(value = "/onedayInsertResult", method = RequestMethod.POST , headers=("content-type=multipart/*")) // 클래스 등록 oneday 에 insert
	public ModelAndView onedayInsertResult(ModelAndView mv  ,HttpServletRequest request,  @RequestParam(name = "oneinsertS", required = false) MultipartFile report)throws Exception {
		System.out.println("여기로 들어오나요?~");
		OnedayVo oneIVo = new OnedayVo();
		String oneinsertN =request.getParameter("oneinsertN");	
		System.out.println("oneinsertN:"+oneinsertN);
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
		
		String oneinsertPR =request.getParameter("oneinsertPR");		
		oneIVo.setOneday_price( Integer.parseInt(oneinsertPR));
		
		String oneinsertM =request.getParameter("oneinsertM");		
		oneIVo.setOneday_maxPerson(Integer.parseInt(oneinsertM));
		
		String oneinsertC =request.getParameter("oneinsertC");	
		oneIVo.setOneday_content(oneinsertC);
		
		String oneinsertP =request.getParameter("oneinsertP");	
		oneIVo.setOneday_place(oneinsertP);
		
		
		String oneinsertDS =request.getParameter("oneinsertDS");	
		oneIVo.setOneday_start(oneinsertDS);
		
		
		
		String oneinsertDE =request.getParameter("oneinsertDE");	
		oneIVo.setOneday_end(oneinsertDE);
		oService.onedayinsert(oneIVo);
		mv.addObject("oneIVo", oneIVo);
		System.out.println("oneIvVo입니당:"+oneIVo);
			mv.addObject("oneIVo",oneIVo);
//			mv.addObject("msg", "클래스 등록에 성공했습니다.");
			mv.setViewName("redirect:/onedayAdmin");
		return mv;
		
	}
		
	//다른 방법2
//@RequestMapping(value = "/onedayInsertResult", method = RequestMethod.POST) // 클래스 등록 oneday 에 insert
//public ModelAndView onedayInsertResult(ModelAndView mv  ,HttpServletRequest request, @RequestParam(name = "oneinsertS", required = false) MultipartFile report)throws Exception {
//		OnedayVo oneIVo = new OnedayVo();
//		String oneinsertN =request.getParameter("oneinsertN");	
//		System.out.println("oneinsertN:"+oneinsertN);
//		oneIVo.setOneday_title(oneinsertN);
//		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
//		String oneinsertS =request.getParameter("oneinsertS");		
//		report.getOriginalFilename();
//		 MultipartFile file = multi.getFile("oneinsertS");
//		 String path="";
//		 UUID randomeUUID = UUID.randomUUID();
//		 
//		  if(file!=null){
//		 System.out.println("파라미터명" + file.getName());
//         System.out.println("파일크기" + file.getSize());
//         System.out.println("파일 존재" + file.isEmpty());
//         System.out.println("오리지날 파일 이름" + file.getOriginalFilename());
//		
//         path = "c:/upload/";
//         InputStream inputStream = null;
//         OutputStream outputStream = null;
//         String organizedfilePath="";
//		System.out.println("여기3");
//		  try {
//              
//			  
//              if (file.getSize() > 0) {
//                  inputStream = file.getInputStream();
//                  File realUploadDir = new File(path);
//                  
//                  if (!realUploadDir.exists()) {
//                      realUploadDir.mkdirs();//폴더생성.
//                  }
//                  
//                  
//                  organizedfilePath = path + randomeUUID + "_" + file.getOriginalFilename();
//                  System.out.println(organizedfilePath);//파일이 저장된경로 + 파일 명
//                  
//                  outputStream = new FileOutputStream(organizedfilePath);
// 
//                  int readByte = 0;
//                  byte[] buffer = new byte[8192];
// 
//                  while ((readByte = inputStream.read(buffer, 0, 8120)) != -1) {
//                      outputStream.write(buffer, 0, readByte); //파일 생성 ! 
//                      
//                  }
//            
//                  
//              }
//              
//          } catch (Exception e) {
//              // TODO: handle exception
//              e.printStackTrace();
// 
//          } finally {
// 
//              outputStream.close();
//              inputStream.close();
//          }
//          

//		oneIVo.setOneday_img(file.getOriginalFilename());

//}	
		
		


	private void saveFile(MultipartFile report, HttpServletRequest request) {
//		String root = request.getSession().getServletContext().getRealPath("resources");
		String root = request.getSession().getServletContext().getRealPath("/");
		
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
	
	
	
//	private void removeFile(String monthly_img, HttpServletRequest request) {
//		String root = request.getSession().getServletContext().getRealPath("resources");
//		String savePath = root + "\\img";
//	
//	String filePath = savePath + "\\" + monthly_img;
//	try { // 파일 저장
//		System.out.println(monthly_img + "을 삭제합니다.");
//		System.out.println("기존 저장 경로 : " + savePath);
//		File delFile = new File(filePath);
//		delFile.delete();
//		System.out.println("파일 삭제가 완료되었습니다.");
//	}catch(Exception e) {
//		System.out.println("파일 삭제 에러 : " + e.getMessage());
//	}
// }
	
	
	
	
	@RequestMapping(value = "/onedayInsert", method = RequestMethod.GET) // 클래스 등록 oneday 에 insert 입력하는곳으로 이동
	public ModelAndView onedayInsert(ModelAndView mv , HttpServletRequest request) {
		mv.setViewName("OnedayClass/onedayInsert");
		return mv;
	}
	

	
	
	@RequestMapping(value = "/onedayUpdate", method = RequestMethod.GET) // 클래스 수정 oneday 에 update
	public ModelAndView onedayUpdate(ModelAndView mv) {
		mv.setViewName("OnedayClass/onedayUpdate");
		
		
		
		return mv;
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