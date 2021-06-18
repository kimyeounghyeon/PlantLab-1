package com.plant.lab.oneday.controller;

import java.util.ArrayList; 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.plant.lab.oneday.model.service.OnedayServiceImpl;
import com.plant.lab.oneday.model.vo.OnedayVo;

@Controller
public class OnedayController {
	@Autowired
	private OnedayServiceImpl oService ;
	
	
	@RequestMapping(value = "onedayMain" , method = RequestMethod.GET)  //selectlist
	public ModelAndView onedayMain(ModelAndView mv) {

		List<OnedayVo > one = new ArrayList<OnedayVo>();
		one = oService.onedayselectlist();
		if (one ==null) {
			mv.addObject("msg", "진행 중인 클래스가 없습니다.");
			mv.setViewName("<script>history.back();</script>");    //histroy back 하는 방법 찾기
			mv.setViewName("main");
			return mv;
		}
		mv.addObject("one", one);
		mv.setViewName("OnedayClass/onedayMain");
		return mv;
	}

	
	@RequestMapping(value ="/onedayDetail" , method = RequestMethod.GET)   //selectone
	public ModelAndView onedayDetail(ModelAndView mv, @RequestParam(name= "onedayNo") int oneday_no) {
		 OnedayVo one = new OnedayVo();
		 one.setOneday_no(oneday_no);
		 OnedayVo oneVo = oService.onedayselect(one);       //selectone 메소드 실행
		 
		 if (oneVo==null) {
			 mv.addObject("msg", "이미 마감된 클래스 입니다.");
			 mv.setViewName("<script>history.back();</script>");
			return mv;
		}
		
		 mv.addObject("oneVo", oneVo);
		 mv.setViewName("OnedayClass/onedayDetail");
			return mv;
	}
	
	/*
	 * @RequestMapping(value = "/onedayReserve" , method = RequestMethod.GET) // 클래스 예약  rs에 insert
	 * public ModelAndView onedayReserve() {
	 * 
	 * }
	 */
	
	
	/*
	 * @RequestMapping(value = "/onedayCancle" , method = RequestMethod.GET) // 클래스
	 * 예약 취소 delete public ModelAndView onedayCancle() {
	 * 
	 * }
	 */
	
	 
	
	
//	 @RequestMapping(value = "/onedayInsert" , method = RequestMethod.GET) //  클래스 등록  oneday 에 insert
//	 public ModelAndView onedayInsert() {
//		 
//	 }
	 
	 
//	 @RequestMapping(value = "/onedayUpdate" , method = RequestMethod.GET) //  클래스 수정  oneday 에 update
//	 public ModelAndView onedayUpdate() {
//		 
//	 }
	 
	 
//	 @RequestMapping(value = "/onedayDelete" , method = RequestMethod.GET) //  클래스 삭제  oneday 에 delete
//	 public ModelAndView onedayDelete() {
//		 
//	 }
}
