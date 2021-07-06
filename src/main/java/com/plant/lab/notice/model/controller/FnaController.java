package com.plant.lab.notice.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.plant.lab.notice.model.service.FnaService;
import com.plant.lab.notice.model.vo.FnaVo;
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



	


@RequestMapping(value="fdelete" ,method=RequestMethod.POST)
public String delete(@RequestParam(name="fna_no")int fna_no) {
	fService.FnaDel(fna_no);
	return "redirect:flist";
}


}
