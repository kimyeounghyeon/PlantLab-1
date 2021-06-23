package com.plant.lab.monthly.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.monthly.model.dao.MonthlyDao;
import com.plant.lab.monthly.model.vo.Monthly;


@Service("moService")
public class MonthlyServiceImpl implements MonthlyService {
	
		@Autowired
		private MonthlyDao moDao;
		//이달의 식물 전체 개수
		@Override
		public int listCount() {
			return moDao.listCount();
		}
		//특정 페이지 단위의 상품 조회
		public List<Monthly> selectList(int startPage, int limit){
		return moDao.selectList(startPage,limit);
		}

		//이달의 식물 상세보기
		@Override
		public Monthly selectOne(int monthly_no) {
			return moDao.selectOne(monthly_no);
		}
		//이달의 식물 상세보기
		@Override
		public Monthly selectMain() {
			return moDao.selectMain();
				}
		//이달의 식물 추가
		@Override
		public int insertMonthly(Monthly m) {
			return moDao.insertMonthly(m);
		}
		//이달의 식물 수정
		@Override
		public Monthly updateMonthly(Monthly m) {
			int result = moDao.updateMonthly(m);
			if (result > 0) {
				m =moDao.selectOne(m.getMonthly_no());
			} else {
				m = null;
			}
			return m;
		}
		//이달의 식물 삭제
		@Override
		public int deleteMonthly(int monthly_no) {
			return moDao.deleteMonthly(monthly_no);
		}
}
