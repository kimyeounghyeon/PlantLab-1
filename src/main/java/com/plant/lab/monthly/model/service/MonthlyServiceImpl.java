package com.plant.lab.monthly.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.monthly.model.dao.MonthlyDao;
import com.plant.lab.monthly.model.vo.Monthly;


@Service("mService")
public class MonthlyServiceImpl implements MonthlyService {
	
		@Autowired
		private MonthlyDao mDao;
		
		@Override
		public int totalCount() {
			return mDao.listCount();
		}
		
		@Override
		public Monthly selectMonthly(int monthly_no) {
			return mDao.selectOne(monthly_no);
		}
		@Override
		public int insertMonthly(Monthly m) {
			return mDao.insertMonthly(m);
		}

		@Override
		public Monthly updateMonthly(Monthly m) {
			int result = mDao.updateMonthly(m);
			if (result > 0) {
				m =mDao.selectOne(m.getMonthly_no());
			} else {
				m = null;
			}
			return m;
		}

		@Override
		public int deleteMonthly(int monthly_no) {
			return mDao.deleteMonthly(monthly_no);
		}
}
