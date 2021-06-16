package com.plant.lab.monthly.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.monthly.model.vo.Monthly;

@Repository("moDao")
public class MonthlyDao {
	   @Autowired
	   private SqlSession sqlSession;
	   
	   //이달의 식물 전체 글 수 조회
	   public int listCount() { 
		      return sqlSession.selectOne("Monthly.listCount");
		   }
	   	//이달의 식물 상세보기
		public Monthly selectOne(int monthly_no) { 
		      return sqlSession.selectOne("Monthly.selectOne", monthly_no);
		   }
		 
		//특정 페이지 단위의 이달의 식물 조회
		public List<Monthly> selectList(int startPage, int limit) {
				int startRow = (startPage - 1) * limit;
				RowBounds row = new RowBounds(startRow, limit);
				return sqlSession.selectList("Monthly.selectList",null,row);
			}
		//이달의 식물 추가
		  public int insertMonthly(Monthly m) { // 글 입력
		      return sqlSession.insert("Monthly.insertMonthly", m);
		   }

		//이달의 식물 수정
		  public int updateMonthly(Monthly m) { // 글 수정
		      return sqlSession.update("Monthly.updateMonthly", m);
		   }
		//이달의 식물 삭제
		  public int deleteMonthly(int monthly_no) { // 글 삭제
		      return sqlSession.delete("Monthly.deleteMonthly", monthly_no);
		   }	   
}
