package com.plant.lab.oneday.model.service;

import java.util.List;

import com.plant.lab.oneday.model.vo.OnedayVo;

public interface OnedayService {
	public List<OnedayVo> onedayselectlist();

	
    public OnedayVo onedayselect(OnedayVo oneVo);
}
