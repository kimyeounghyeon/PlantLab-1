package com.plant.lab.monthly.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.monthly.model.vo.Monthly;

@Repository("mDao")
public class MonthlyDao {
	   @Autowired
	   private SqlSession sqlSession;
	  
	   public int listCount() { // 전체 글 수 조회
		      return sqlSession.selectOne("Monthly.listCount");
		   }

		   public Monthly selectOne(int monthly_no) { // 글 가져오기
		      return sqlSession.selectOne("Monthly.selectOne", monthly_no);
		   }

		   public int insertMonthly(Monthly m) { // 글 입력
		      return sqlSession.insert("Monthly.insertBoard", m);
		   }

		  
		   public int updateMonthly(Monthly m) { // 글 수정
		      return sqlSession.update("Monthly.updateMonthly", m);
		   }

		   public int deleteMonthly(int monthly_no) { // 글 삭제
		      return sqlSession.delete("Monthly.deleteMonthly", monthly_no);
		   }	   
}
