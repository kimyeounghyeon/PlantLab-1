package com.plant.lab.event.model.service;

import java.util.List;

import com.plant.lab.event.model.vo.Event_tb;

public interface EventService {
	//이벤트 전체 개수
	public int listCount();
	
	//특정 페이지 단위의 이벤트 조회
	public List<Event_tb> selectList(int startPage, int limit);
	
	//이벤트 상세보기 
	public Event_tb selectOne(int event_no);
	
	//이벤트 추가
	public int insertEvent(Event_tb e);
	
	//이벤트 수정
	public Event_tb updateEvent(Event_tb e);
		
	//이벤트 삭제
	public int deleteEvent(int event_no);
}

