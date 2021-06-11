package com.plant.lab.monthly.model.service;

import com.plant.lab.monthly.model.vo.Monthly;

public interface MonthlyService {
	int totalCount();
	Monthly selectMonthly(int monthly_no);
	int insertMonthly(Monthly b);
	Monthly updateMonthly(Monthly b);
	int deleteMonthly(int monthly_no);
}
