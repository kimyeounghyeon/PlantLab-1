package com.plant.lab.oneday.model.service;

import java.util.List;

import com.plant.lab.oneday.model.vo.OnedayRsVo;
import com.plant.lab.oneday.model.vo.OnedayVo;

public interface OnedayService {
	public List<OnedayVo> onedayselectlist();
	
    public OnedayVo onedayselect(OnedayVo oneVo);

    public int onedayreserve(int user_no , int oneday_no);
    
    public int onedaycancel(OnedayVo oneVo);
    
    public int onedayinsert(OnedayVo oneVo);
    
    public int onedayupdate(OnedayVo oneVo);
    
    public int onedaydelete(OnedayVo oneVo);
}
