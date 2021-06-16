package com.plant.lab.notice.model.service;

import java.util.List;

import com.plant.lab.notice.model.vo.NoticeVo;

public interface NoticeService {
	
	
	public List<NoticeVo>getNoticeList();
	public int NoticeInsert(NoticeVo vo);
}
