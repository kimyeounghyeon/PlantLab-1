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
	public List<NoticeVo> getNoticeList() {
		  return nDao.getNoticeList();
		
	}

	@Override
	public int NoticeInsert(NoticeVo vo) {
		return nDao.NoticeInsert(vo);
	}


		
	}

