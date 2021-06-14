package com.plant.lab.monthly.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.monthly.model.dao.MonthlyDao;
import com.plant.lab.monthly.model.vo.Monthly;


@Service("moService")
public class MonthlyServiceImpl implements MonthlyService {
	
		@Autowired
		private MonthlyDao moDao;
		
		@Override
		public int totalCount() {
			return moDao.listCount();
		}
		
		@Override
		public Monthly selectMonthly(int monthly_no) {
			return moDao.selectOne(monthly_no);
		}
		@Override
		public int insertMonthly(Monthly m) {
			return moDao.insertMonthly(m);
		}

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

		@Override
		public int deleteMonthly(int monthly_no) {
			return moDao.deleteMonthly(monthly_no);
		}
}
