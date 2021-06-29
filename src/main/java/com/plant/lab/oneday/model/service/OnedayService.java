package com.plant.lab.oneday.model.service;

import java.util.List;

import com.plant.lab.member.model.vo.MemberVO;
import com.plant.lab.oneday.model.vo.OnedayVo;

public interface OnedayService {
	public List<OnedayVo> onedayselectlist();
	
    public OnedayVo onedayselect(OnedayVo oneVo);

    public List<OnedayVo> onedayMy(OnedayVo oneVo );
    
    public int onedayreserve(OnedayVo oneVo );
    
    public int onedaycancel(OnedayVo oneVo);
    
    public int onedayinsert(OnedayVo oneVo);
    
    public int onedayupdate(OnedayVo oneVo);
    
    public int onedaydelete(OnedayVo oneVo);
}
