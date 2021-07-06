package com.plant.lab.att.model.service;

import com.plant.lab.att.model.vo.Att_tb;

public interface AttService {
	
	
	//public List<Integer> attList(Att_tb a);
	public int insertAtt(Att_tb a);
	public int attCnt(Att_tb a);
	public int attChk(Att_tb a);
}
