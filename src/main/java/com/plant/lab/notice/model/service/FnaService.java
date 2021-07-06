package com.plant.lab.notice.model.service;

import java.util.List;

import com.plant.lab.notice.model.vo.FnaVo;

import com.plant.lab.notice.model.vo.PagingVo;



public interface FnaService {
	
	public int FnaCount();
	public List<FnaVo>FnaList(PagingVo vo);

	public int FnaInsert(FnaVo vo);
	public FnaVo FnaRead(int Fna_no);

	
	public int FnaDel(int vo);
}
