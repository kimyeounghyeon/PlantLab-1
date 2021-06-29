package com.plant.lab.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.plant.lab.notice.model.dao.NoticeDao;
import com.plant.lab.notice.model.vo.NoticeVo;



@org.springframework.stereotype.Service("nService")
public class NoticeServiceimpl implements NoticeService{
	
	@Autowired
	private NoticeDao nDao;

	@Override
	public List<NoticeVo> getNoticeList(NoticeVo vo) {
		  return nDao.getNoticeList(vo);
		
	}

	@Override
	public int NoticeInsert(NoticeVo vo) {
		return nDao.NoticeInsert(vo);
	}

	@Override
	public NoticeVo NoticeRead(int notice_no) {
		return nDao.NoticeRead(notice_no);		
	}
	


	@Override
	public NoticeVo NoticeUpdate(NoticeVo n) {
		int result =nDao.NoticeUpdate(n);
		if(result>0) {
		n=nDao.NoticeRead(n.getNotice_no());
		}
	else {
		n=null;
		}
		return n;
		}	

	

	@Override
	public int NoticeDel(int vo) {
		return nDao.NoticeDel(vo);
	}

	@Override
	public int NoticeCnt() {
		return nDao.NoticeCnt();
	
	}

	}	
	

