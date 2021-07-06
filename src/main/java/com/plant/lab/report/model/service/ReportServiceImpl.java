package com.plant.lab.report.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.report.model.dao.ReportDAO;
import com.plant.lab.report.model.vo.Report;

@Service("reportService")
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportDAO reportDao;
	
	//신고추가
	@Override
	public int insertReport(Report report) {
		return reportDao.insertReport(report);
	}
	
	//신고수
	@Override
	public int countReport(int diary_no) {
		return reportDao.countReport(diary_no);
	}
	
	//신고체크
	@Override
	public int checkReport(Report report) {
		return reportDao.checkReport(report);
	}
}
