package com.plant.lab.oneday.model.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.oneday.model.dao.OnedayDao;
import com.plant.lab.oneday.model.vo.OnedayVo;
@Service("oService")
public class OnedayServiceImpl implements OnedayService{
@Autowired
private OnedayDao oDao;
	@Override
	public List<OnedayVo> onedayselectlist() {
		 return oDao.onedayselectlist();
		
	}
	@Override
	public OnedayVo onedayselect(OnedayVo oneVo) {
		return oDao.onedayselect(oneVo);
	}

}
