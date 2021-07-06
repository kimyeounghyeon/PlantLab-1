package com.plant.lab.att.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.att.model.dao.AttDao;
import com.plant.lab.att.model.vo.Att_tb;

@Service("aService")
public class AttServiceImpl implements AttService{

	@Autowired
	private AttDao aDao;
	
//	@Override
//	public List<Integer> attList(Att_tb a) {
//		List<Integer> list = null;
//		try {
//			list = aDao.attList(a);
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println("attList() :" + list);
//		return list;
//	}
	
	@Override
	public int attCnt(Att_tb a) {
		int result = -1;
		try {
			result = aDao.attCnt(a);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int insertAtt(Att_tb a) {
		int result = -1;
		try {
			result = aDao.insertAtt(a);
			//if(result>0)
			result = aDao.attCnt(a);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int attChk(Att_tb a) {
		int result = -1;
		try {
			result = aDao.attChk(a);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
