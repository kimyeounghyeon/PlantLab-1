package com.plant.lab.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.plant.lab.notice.model.vo.NoticeVo;

@Repository("nDao")
public class NoticeDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<NoticeVo> getNoticeList() {
		return sqlSession.selectList("Notice.NoticeList");
	}
	  public int NoticeInsert(NoticeVo vo) {
		  		return sqlSession.insert("Notice.NoticeInsert", vo);
		  		
			
	    }

}
