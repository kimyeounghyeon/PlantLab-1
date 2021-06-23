package com.plant.lab.oneday.model.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.oneday.model.dao.OnedayDao;
import com.plant.lab.oneday.model.vo.OnedayRsVo;
import com.plant.lab.oneday.model.vo.OnedayVo;
@Service("oService")
public class OnedayServiceImpl implements OnedayService{
@Autowired
private OnedayDao oDao;
	@Override
	public List<OnedayVo> onedayselectlist() {  //원데이클래스 전체목록 보여주기
		 return oDao.onedayselectlist();
		
	}
	@Override
	public OnedayVo onedayselect(OnedayVo oneVo) {  //원데이클래스  상세 보기
		return oDao.onedayselect(oneVo);
	}
	@Override
	public int onedayreserve(int user_no , int oneday_no) {  //원데이 클래스  예약
		return oDao.onedayreserve(user_no, oneday_no);
	}
	@Override
	public int onedaycancel(OnedayVo oneVo) {   //원데이 클래스   예약 취소
		return oDao.onedaycancel(oneVo);
	}
	@Override
	public int onedayinsert(OnedayVo oneVo) {  //원데이 클래스   등록
		return oDao.onedayinsert(oneVo);
	}
	@Override
	public int onedayupdate(OnedayVo oneVo) {  //원데이 클래스   수정
		return oDao.onedayupdate(oneVo);
	}
	@Override
	public int onedaydelete(OnedayVo oneVo) {   //원데이 클래스   삭제
		return oDao.onedaydelete(oneVo);
	}
	

}
