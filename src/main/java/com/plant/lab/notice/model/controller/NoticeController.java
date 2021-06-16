package com.plant.lab.notice.model.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;
import com.plant.lab.notice.model.service.NoticeService;
import com.plant.lab.notice.model.vo.NoticeVo;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping("noticelist")
	public ModelAndView noticeList() throws Exception{
		List<NoticeVo> list = nService.getNoticeList();
		ModelAndView mav=new ModelAndView();
		mav.setViewName("Notice/Noticelist");
		mav.addObject("list",list);
		return mav;

	}   @RequestMapping(value="noticewrite", method=RequestMethod.GET)
    public String write(){
        return "Notice/Noticewrite";
    }
    
	
	
	@RequestMapping(value="noticeinsert", method=RequestMethod.POST)
    public String insert(@ModelAttribute NoticeVo vo) throws Exception{
        nService.NoticeInsert(vo);
        return "redirect:list.do";
    }
	
	

}
