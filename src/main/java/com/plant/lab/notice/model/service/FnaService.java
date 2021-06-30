package com.plant.lab.notice.model.service;

import java.util.List;

import com.plant.lab.notice.model.vo.FnaVo;



public interface FnaService {
	
	public int FnaCount();
	public List<FnaVo>FnaList(int startPage,int limit);

	public int FnaCnt();
	public int FnaInsert(FnaVo vo);
	public FnaVo FnaRead(int Fna_no);

	public FnaVo FnaUpdate(FnaVo n);
	public int FnaDel(int vo);
}
