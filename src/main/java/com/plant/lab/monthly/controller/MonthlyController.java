package com.plant.lab.monthly.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.plant.lab.monthly.model.service.MonthlyService;
import com.plant.lab.monthly.model.vo.Monthly;

@Controller
public class MonthlyController {
	
	@Autowired
	private MonthlyService mService;

	public static final int LIMIT = 10;
	@RequestMapping(value = "mlist.do", method = RequestMethod.GET)
	public ModelAndView monthlyListService( // 오류가 발생해도 오류메세지 뜨지않는다는 단점..
			@RequestParam(name = "page", defaultValue = "1") int page,
			ModelAndView mv) {

		try {
			int currentPage = page; // 한 페이지당 출력할 목록 갯수
			int listCount = mService.totalCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listCount);
				mv.setViewName("Monthly/mlist");
			
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "mDetail.do", method = RequestMethod.GET)
	public ModelAndView monthlyDetail(@RequestParam(name = "monthly_no") int monthly_no,
			@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) {
		try {
			int currentPage = page; // 한 페이지당 출력할
			mv.addObject("monthly", mService.selectMonthly(monthly_no));
			mv.addObject("currentPage", currentPage);
			mv.setViewName("Monthly/monthlyDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "mRenew.do", method = RequestMethod.GET)
	public ModelAndView monthlyDetail(@RequestParam(name = "monthly_no") int monthly_no, ModelAndView mv) {
		try {
			mv.addObject("monthly", mService.selectMonthly(monthly_no));
			mv.setViewName("Monthly/monthlyRenew");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "mWrite.do", method = RequestMethod.GET)
	public String monthlyInsertForm(ModelAndView mv) {
		return "Monthly/monthlyWrite";
	}

	@RequestMapping(value = "mInsert.do", method = RequestMethod.POST)
	public ModelAndView monthlyInsert(Monthly m, @RequestParam(name = "upfile", required = false) MultipartFile report,
			HttpServletRequest request, ModelAndView mv) {
		try {
			if (report != null && !report.equals(""))
				saveFile(report, request);
			m.setMonthly_img(report.getOriginalFilename());
			mService.insertMonthly(m);
			mv.setViewName("redirect:mlist.do");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "mUpdate.do", method = RequestMethod.POST)
	public ModelAndView monthlyUpdate(Monthly m, @RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam("upfile") MultipartFile report, HttpServletRequest request, ModelAndView mv) {
		try {
			if (report != null && !report.equals("")) {
				removeFile(m.getMonthly_img(), request);
				saveFile(report, request);
				}
			m.setMonthly_img(report.getOriginalFilename());
			mv.addObject("monthly_no", mService.updateMonthly(m).getMonthly_no());
			mv.addObject("currentPage", page);
			mv.setViewName("redirect:mDetail.do");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "mDelete.do", method = RequestMethod.GET)
	public ModelAndView boardDelete(@RequestParam(name = "monthly_no") int monthly_no,
			@RequestParam(name = "page", defaultValue = "1") int page, HttpServletRequest request, ModelAndView mv) {
		try {
			Monthly m = mService.selectMonthly(monthly_no);
			removeFile(m.getMonthly_img(), request);
			mService.deleteMonthly(monthly_no);
			mv.addObject("currentPage", page);
			mv.setViewName("redirect:mlist.do");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	private void saveFile(MultipartFile report, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\img";
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
	}catch(Exception e) {
		System.out.println("파일 삭제 에러 : " + e.getMessage());
	}
 }
}