package com.plant.lab.event.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.plant.lab.event.model.service.EventService;
import com.plant.lab.event.model.vo.Event_tb;
import com.plant.lab.member.model.vo.MemberVO;

@Controller
public class EventController {

	@Autowired
	private EventService eService;
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	public static final int LIMIT = 5;
	
	@RequestMapping(value = "elist", method = RequestMethod.GET)
	public ModelAndView eventListService( // 오류가 발생해도 오류메세지 뜨지않는다는 단점..
			@RequestParam(name = "page", defaultValue = "1") int page,
			ModelAndView mv, HttpSession session) {
		
		
		
		
		try {
			
			MemberVO member = (MemberVO) session.getAttribute("loginMember");
			
			int currentPage = page; // 한 페이지당 출력할 목록 갯수
			int listCount = eService.listCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			
			logger.info("이벤트 게시글 개수 확인하기 : " + listCount);
			mv.addObject("list",eService.selectList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("Event/elist");
			
		} catch (Exception e) {
			logger.info("!!!!!!이벤트 페이지 리스트 오류!!!!!!");
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "eDetail", method = RequestMethod.GET)
	public ModelAndView eventDetail(@RequestParam(name = "event_no") int event_no,
			@RequestParam(name = "page", defaultValue = "1") int page,
			ModelAndView mv, HttpSession session) {
		try {
			
			MemberVO member = (MemberVO) session.getAttribute("loginMember");
			
			logger.info("===============이벤트 상세 페이지===============");
			int currentPage = page; // 한 페이지당 출력할
			logger.info("currentPage :" + currentPage );
			mv.addObject("event_tb", eService.selectOne(event_no));
			mv.addObject("event_views",eService.addReadCount(event_no));
			mv.addObject("currentPage", currentPage);
			mv.setViewName("Event/eventDetail");
		} catch (Exception e) {
			logger.info("!!!!!!이벤트 상세페이지 오류!!!!!!");
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}


	@RequestMapping(value = "eWrite", method = RequestMethod.GET)
	public String eventInsertForm(ModelAndView mv) {
		return "Event/eventWrite";
	}

	@RequestMapping(value = "eInsert", method = RequestMethod.POST)
	public ModelAndView eventInsert(Event_tb e, 
			@RequestParam(name = "upfile1", required = false) MultipartFile report1,
			@RequestParam(name = "upfile2", required = false) MultipartFile report2,
			HttpServletRequest request, ModelAndView mv) {
		try {
			if (report1 != null && !report1.equals("") || report2 != null && !report2.equals(""))
				saveFile(report1,  report2, request);
				
			e.setBanner(report1.getOriginalFilename());
			e.setEvent_content(report2.getOriginalFilename());
			eService.insertEvent(e);
			mv.setViewName("redirect:elist");
		} catch (Exception e1) {
			mv.addObject("msg", e1.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "eRenew", method = RequestMethod.GET)
	public ModelAndView eventUpdateForm(@RequestParam(name = "event_no") int event_no, ModelAndView mv) {
		try {
			logger.info("===============이벤트 수정 페이지 진입 ===============");
			mv.addObject("event_tb", eService.selectOne(event_no));
			mv.setViewName("Event/eventRenew");
		} catch (Exception e) {
			logger.info("===============이벤트 수정 페이지 진입 실패===============");
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	@RequestMapping(value = "eUpdate", method = RequestMethod.POST)
	public ModelAndView eventUpdate(Event_tb e, 
			//@RequestParam(name = "event_no") int event_no,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam("upfile1") MultipartFile report1,
			@RequestParam("upfile2") MultipartFile report2,
			HttpServletRequest request, ModelAndView mv) {
		try {
			logger.info("===============이벤트 수정 ===============");
			if (report1 != null && !report1.equals("") || report2 != null && !report2.equals("")) {
				removeFile(e.getBanner(),e.getEvent_content(),request);
				saveFile(report1, report2, request);
				}

			e.setBanner(report1.getOriginalFilename());
			e.setEvent_content(report2.getOriginalFilename());
			logger.info("e값 "+ e.toString());
			logger.info("==============여기서 막힘   ===============");
			//mv.addObject("event_no", eService.updateEvent(e).getEvent_no());
			mv.addObject("event_no", eService.updateEvent(e));
			//eService.updateEvent(e);
			logger.info("==============6 ===============");
			mv.addObject("currentPage", page);
			mv.setViewName("redirect:elist");
		} catch (Exception e1) {
			logger.info("===============이벤트 수정 실패===============");
			e1.printStackTrace();
			mv.addObject("msg", e1.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	@RequestMapping(value = "eDelete", method = RequestMethod.GET)
	public ModelAndView eventDelete(@RequestParam(name = "event_no") int event_no,
			@RequestParam(name = "page", defaultValue = "1") int page, HttpServletRequest request, ModelAndView mv) {
		try {
			logger.info("===============이벤트 삭제 ===============");
			Event_tb e = eService.selectOne(event_no);
			removeFile(e.getBanner(),e.getEvent_content(),request);
			logger.info("===============배너 사진 삭제는 성공===============");
			eService.deleteEvent(event_no); //여기서 막히는중 
			logger.info("===============내용 사진 삭제도 성공===============");
			mv.addObject("currentPage", page);
			mv.setViewName("redirect:elist");
		} catch (Exception e1) {
			logger.info("===============이벤트 삭제 실패===============");
			mv.addObject("msg", e1.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	private void saveFile(MultipartFile report1, MultipartFile report2, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\img";
		//String savePath2 = root + "\\img";
		File folder1 = new File(savePath);
		File folder2 = new File(savePath);
		if (!folder1.exists()) {
			folder1.mkdir(); // 폴더가 없다면 생성한다.
		}
		if (!folder2.exists()) {
			folder2.mkdir(); // 폴더가 없다면 생성한다.
		}
		String filePath1 = null;
		String filePath2 = null;
		try { // 파일 저장
			filePath1 = folder1 + "\\" + report1.getOriginalFilename();
			report1.transferTo(new File(filePath1)); // 파일을 저장한다
			logger.info("===============사진1 저장 ===============");
			filePath2 = folder2 + "\\" + report2.getOriginalFilename();
			report2.transferTo(new File(filePath2)); // 파일을 저장한다
			logger.info("===============사진2 저장 ===============");
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
	}
	
	private void removeFile(String event_content, String banner, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\img";
		//String savePath2 = root + "\\img";
		String filePath1 = savePath + "\\" + banner;
		String filePath2 = savePath + "\\" + event_content;
	try { // 파일 저장

		File delFile1 = new File(filePath1);
		delFile1.delete();
		File delFile2 = new File(filePath2);
		delFile2.delete();
		logger.info("파일1 삭제가 완료되었습니다.");
		logger.info("파일2 삭제가 완료되었습니다.");
	}catch(Exception e1) {
		System.out.println("파일 삭제 에러 : " + e1.getMessage());
	}
 }
}

