package com.plant.lab.event.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.event.model.vo.Event_tb;

@Repository("eDao")
public class EventDao {
	   @Autowired
	   private SqlSession sqlSession;
	   
	   // 이벤트전체 글 조회
	   public int listCount() { 
		      return sqlSession.selectOne("Event_tb.listCount");
		   }
	   	//이벤트 상세보기
		public Event_tb selectOne(int event_no) { 
		      return sqlSession.selectOne("Event_tb.selectOne", event_no);
		   }
		
		//특정 페이지 단위의 이벤트 조회
		public List<Event_tb> selectList(int startPage, int limit) {
				int startRow = (startPage - 1) * limit;
				RowBounds row = new RowBounds(startRow, limit);
				return sqlSession.selectList("Event_tb.selectList",null,row);
			}
		//이벤트 추가
		  public int insertEvent(Event_tb e) { // 글 입력
		      return sqlSession.insert("Event_tb.insertEvent", e);
		   }

		//이벤트 수정
		  public int updateEvent(Event_tb e) { // 글 수정
		      return sqlSession.update("Event_tb.updateEvent", e);
		   }
		//이벤트 삭제
		  public int deleteEvent(int event_no) { // 글 삭제
		      return sqlSession.delete("Event_tb.deleteEvent", event_no);
		   }	   
}
		

