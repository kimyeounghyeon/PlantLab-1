package com.plant.lab.oneday.model.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.member.model.vo.MemberVO;
import com.plant.lab.oneday.model.dao.OnedayDao;
import com.plant.lab.oneday.model.vo.OnedayVo;
@Service("oService")
public class OnedayServiceImpl implements OnedayService{
@Autowired
private OnedayDao oDao;
	@Override
	public List<OnedayVo> onedayselectlist() {  //������Ŭ���� ��ü��� �����ֱ�
		 return oDao.onedayselectlist();
		
	}
	@Override
	public OnedayVo onedayselect(OnedayVo oneVo) {  //������Ŭ����  �� ����
		return oDao.onedayselect(oneVo);
	}

	
	@Override
	public int onedayreserve(OnedayVo oneVo) {
		return oDao.onedayreserve(oneVo);
	}
	
	@Override
	public int onedaycancel(OnedayVo oneVo) {   //������ Ŭ����   ���� ���
		return oDao.onedaycancel(oneVo);
	}
	@Override
	public int onedayinsert(OnedayVo oneVo) {  //������ Ŭ����   ���
		return oDao.onedayinsert(oneVo);
	}
	@Override
	public int onedayupdate(OnedayVo oneVo) {  //������ Ŭ����   ����
		return oDao.onedayupdate(oneVo);
	}
	@Override
	public int onedaydelete(OnedayVo oneVo) {   //������ Ŭ����   ����
		return oDao.onedaydelete(oneVo);
	}
	@Override
	public List<OnedayVo> onedayMy(OnedayVo oneVo) {
		return oDao.onedayMy(oneVo);
	}

	

}
