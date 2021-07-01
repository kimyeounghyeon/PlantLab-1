package com.plant.lab.report.model.service;

import com.plant.lab.report.model.vo.Report;

public interface ReportService {
	public int insertReport(Report report);
	public int countReport(int diary_no);
}
