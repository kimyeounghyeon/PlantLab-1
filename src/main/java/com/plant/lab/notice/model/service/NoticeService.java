package com.plant.lab.notice.model.service;

import java.util.List;

import com.plant.lab.notice.model.vo.NoticeVo;

public interface NoticeService {
	
	
	public List<NoticeVo>getNoticeList(NoticeVo vo);
	public int NoticeCnt();
	public int NoticeInsert(NoticeVo vo);
	public NoticeVo NoticeRead(int notice_no);

	public NoticeVo NoticeUpdate(NoticeVo n);
	public int NoticeDel(int vo);
	
}
