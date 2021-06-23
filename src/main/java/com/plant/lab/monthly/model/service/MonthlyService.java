package com.plant.lab.monthly.model.service;

import java.util.List;

import com.plant.lab.monthly.model.vo.Monthly;

public interface MonthlyService {
	
	//이달의 식물 전체 개수
	public int listCount();
	
	//특정 페이지 단위의 이달의 식물 조회
	public List<Monthly> selectList(int startPage, int limit);
	
	//이달의 식물  monthly->one??
	public Monthly selectOne(int monthly_no);
	
	//
	public Monthly selectMain();
	
	//이달의 식물 추가
	public int insertMonthly(Monthly m);
	
	//이달의 식물 수정
	public Monthly updateMonthly(Monthly m);
	
	//이달의 식물 삭제
	public int deleteMonthly(int monthly_no);
}
