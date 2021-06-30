package com.plant.lab.notice.model.controller;


import java.text.DateFormat;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.plant.lab.member.model.vo.MemberVO;

import com.plant.lab.notice.model.service.NoticeService;
import com.plant.lab.notice.model.vo.NoticeVo;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	


	@RequestMapping(value="nlist.do" ,method=RequestMethod.GET)
	public ModelAndView noticeList(NoticeVo voo,Model model,ModelAndView mav){
	try {

	
	List<NoticeVo> list = nService.getNoticeList(voo);
	int noticecnt= nService.NoticeCnt();
	mav.addObject("list",list);
	mav.addObject("noticecnt", noticecnt);
	mav.setViewName("Notice/Noticelist");

	
	
	
} catch (Exception e) {
		model.addAttribute("msg", e.getMessage());
		model.addAttribute("errorPage");
	}return mav;	
	}
	



	@RequestMapping(value="nwrite.do", method=RequestMethod.GET)
    public  String write( ModelAndView mav,Model model,NoticeVo vo) {
	
	
		return "Notice/Noticewrite";
    }
    
	
	
	@RequestMapping(value="ninsert.do", method=RequestMethod.POST)
    public String insert( ModelAndView mav,Model model,NoticeVo vo) throws Exception{
		nService.NoticeInsert(vo);
		
		return "redirect:nlist.do";
		
       
    }
	
@RequestMapping(value="nread.do",method=RequestMethod.GET)
public ModelAndView read(@RequestParam(name="notice_no")int notice_no, ModelAndView mav)
{mav.addObject("read",nService.NoticeRead(notice_no));
mav.setViewName("Notice/NoticeRead");
return mav;
	}		

		
@RequestMapping(value = "nupdate.do", method = RequestMethod.GET)
public ModelAndView update(@RequestParam(name="notice_no")int notice_no, ModelAndView mav,Model model) {
	try {
		mav.addObject("data",nService.NoticeRead(notice_no));
		mav.setViewName("Notice/Noticeupdate");
	} catch (Exception e) {
		model.addAttribute("msg", e.getMessage());
		model.addAttribute("errorPage");
	}
	return mav;
}
@RequestMapping(value ="nnupdate.do", method =RequestMethod.POST)
public String udpate2(NoticeVo m, Model model) {
	try {
		nService.NoticeUpdate(m);
	} catch (Exception e1) {
		model.addAttribute("msg", e1.getMessage());
		model.addAttribute("errorPage");
	}
	return "redirect:nread.do?notice_no="+m.getNotice_no();
	}

@RequestMapping(value="ndelete.do")
public String delete(@RequestParam(name="notice_no")int notice_no,Model mo)throws Exception{
nService.NoticeDel(notice_no);
return "redirect:nlist.do";
}



	
}



