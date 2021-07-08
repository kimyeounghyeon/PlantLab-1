package com.plant.lab.notice.model.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.tagext.TryCatchFinally;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.YamlProcessor.ResolutionMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.plant.lab.event.controller.EventController;
import com.plant.lab.notice.model.service.FnaService;
import com.plant.lab.notice.model.vo.FnaVo;
import com.plant.lab.notice.model.vo.NoticeVo;
import com.plant.lab.notice.model.vo.PagingVo;


@Controller
public class FnaController {

@Autowired
private FnaService fService;




@RequestMapping(value = "flist", method = RequestMethod.GET)
public String flist(PagingVo vo, Model model, @RequestParam(value="nowPage" ,required=false)String nowPage,
		@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
	int total =fService.FnaCount();
	if(nowPage==null && cntPerPage==null) {
		nowPage="1";
		cntPerPage="3";
	}else if(nowPage==null) {
		nowPage="1";}
	else if(cntPerPage==null) {
		cntPerPage="3";
		
	}
	vo=new PagingVo(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
	model.addAttribute("paging", vo);
	model.addAttribute("viewAll", fService.FnaList(vo));
	return "Fna/Fnalist";	
}


@RequestMapping(value="fwrite", method=RequestMethod.GET)
public  String write( ModelAndView mav,Model model,FnaVo vo) {


	return "Fna/Fnawrite";
}



@RequestMapping(value="finsert", method=RequestMethod.POST)
public String insert( ModelAndView mav,Model model,FnaVo vo) throws Exception{
	fService.FnaInsert(vo);
	
	return "redirect:flist";
	
   
}



@RequestMapping(value = "fupdate", method = RequestMethod.GET)
public String fupdate(FnaVo vo, ModelAndView mav,Model model,@RequestParam(name="fna_no")int fna_no) {
	try {
		
	model.addAttribute("data",fService.FnaRead(fna_no));	
		
	} catch (Exception e) {
		model.addAttribute("msg", e.getMessage());
		model.addAttribute("errorPage");
	}
	return "Fna/Fnaupdate";
}

@RequestMapping(value ="fupdate", method =RequestMethod.POST)
public String fupdate(Model model, FnaVo n) {
	try {
		fService.fnaupdate(n);
	} catch (Exception e1) {
		model.addAttribute("msg", e1.getMessage());
		model.addAttribute("errorPage");
	}
	return "redirect:flist";
	}

@RequestMapping(value="fdelete" ,method=RequestMethod.POST)
public String delete(@RequestParam(name="fna_no")int fna_no) {
	fService.FnaDel(fna_no);
	return "redirect:flist";
}


}
