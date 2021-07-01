package com.plant.lab.report.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.report.model.vo.Report;


@Repository("reportDao")
public class ReportDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//신고추가
	public int insertReport(Report report) {
		return sqlSession.insert("Report.insertReport",report);
	}
	
	//게시물 누적 신고수 조회
	public int countReport(int diary_no) {
		return sqlSession.selectOne("Report.countReport",diary_no);
	}
}
