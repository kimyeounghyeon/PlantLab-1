package com.plant.lab.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.notice.model.dao.FnaDao;
import com.plant.lab.notice.model.vo.FnaVo;

import com.plant.lab.notice.model.vo.PagingVo;


@Service("fService")
public class FnaServiceimpl implements FnaService{
	
@Autowired
private FnaDao fDao;

@Override
public int FnaCount() {
		return fDao.FnaCount();
		}

@Override
public List<FnaVo> FnaList(PagingVo vo){
	return fDao.FnaList(vo);

}


@Override
public int FnaInsert(FnaVo vo) {
	return fDao.FnaInsert(vo);
}

@Override
public FnaVo FnaRead(int Fna_no) {
	return fDao.FnaRead(Fna_no);
}



@Override
public int FnaDel(int vo) {
	return fDao.Fnadel(vo);
}

@Override
public int fnaupdate(FnaVo n) {
	return fDao.Fnaupdate(n);
}

}
