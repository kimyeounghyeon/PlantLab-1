package com.plant.lab.diary.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.diary.model.vo.DiaryVO;

@Repository("dDao")
public class DiaryDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<String> listDiary() {
		return sqlSession.selectList("");
	}
	
	public int writeDiary(DiaryVO vo) {
		return sqlSession.insert("");
	}
}
