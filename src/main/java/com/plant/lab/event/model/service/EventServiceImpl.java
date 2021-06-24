package com.plant.lab.event.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.event.model.dao.EventDao;
import com.plant.lab.event.model.vo.Event_tb;

@Service("eService")
public class EventServiceImpl implements EventService {

		@Autowired
		private EventDao eDao;
		
		//이벤트 전체 개수
		@Override
		public int listCount() {
			return eDao.listCount();
				}
		//특정 페이지 단위의 이벤트 조회
		public List<Event_tb> selectList(int startPage, int limit){
			return eDao.selectList(startPage,limit);
				}

		//이벤트 상세보기
		@Override
		public Event_tb selectOne(int event_no) {
			return eDao.selectOne(event_no);
				}
				
		//이벤트 추가
		@Override
		public int insertEvent(Event_tb e) {
			return eDao.insertEvent(e);
				}
			
		//이벤트 수정
		@Override
		public Event_tb updateEvent(Event_tb e) {
			int result = eDao.updateEvent(e);
			if (result > 0) {
				e =eDao.selectOne(e.getEvent_no());
			} else {
				e = null;
			}
			return e;
		}
		//이벤트 삭제
		@Override
		public int deleteEvent(int event_no) {
			return eDao.deleteEvent(event_no);
		}
		
		//이벤트 조회 수 증가
		@Override
		public int addReadCount(int event_no) {
			return eDao.addReadCount(event_no);
		}
	}
