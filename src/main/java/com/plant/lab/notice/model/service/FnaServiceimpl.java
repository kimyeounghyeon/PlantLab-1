package com.plant.lab.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.notice.model.dao.FnaDao;
import com.plant.lab.notice.model.vo.FnaVo;
import com.plant.lab.product.model.vo.Product;

@Service("fService")
public class FnaServiceimpl implements FnaService{
@Autowired
private FnaDao fDao;

@Override
public int FnaCount() {
		return fDao.FnaCount();
		}

@Override
public List<FnaVo> FnaList(int startPage, int limit) {
	return fDao.FnaList(startPage, limit);

}

@Override
public int FnaCnt() {
	return fDao.FnaCnt();
}

@Override
public int FnaInsert(FnaVo vo) {
	return FnaInsert(vo);
}

@Override
public FnaVo FnaRead(int Fna_no) {
	return FnaRead(Fna_no);
}

@Override
public FnaVo FnaUpdate(FnaVo n) {
	return FnaUpdate(n);
}

@Override
public int FnaDel(int vo) {
	return FnaDel(vo);
}}
