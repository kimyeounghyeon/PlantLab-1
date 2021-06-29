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
	
	public List<NoticeVo> getNoticeList(NoticeVo vo) {
		return sqlSession.selectList("Notice.NoticeList",vo);
	}
	
	public int NoticeCnt() { 
	      return sqlSession.selectOne("Notice.NoticeCnt");
	   }
	
	
	
	
	  public int NoticeInsert(NoticeVo vo) {
		  		return sqlSession.insert("Notice.NoticeInsert", vo);
			
	    }
	  public NoticeVo NoticeRead(int notice_no) {
		  return sqlSession.selectOne("Notice.NoticeRead",notice_no);
	  }
	  
	
	
	  public int NoticeUpdate(NoticeVo n) { 
	      return sqlSession.update("Notice.NoticeUpdate",n);
	   }
	
	  public int NoticeDel(int vo) { 
	      return sqlSession.delete("Notice.NoticeDel",vo);
	   }	   
}
