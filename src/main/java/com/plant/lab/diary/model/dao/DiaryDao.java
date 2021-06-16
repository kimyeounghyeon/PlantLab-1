package com.plant.lab.diary.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.diary.model.vo.DiaryVO;
import com.plant.lab.diary.model.vo.LikeVO;

@Repository("dDao")
public class DiaryDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<DiaryVO> listDiary() {
		return sqlSession.selectList("Diary.listDiary");
	}
	public List<Integer> likeList(LikeVO lvo) {
		return sqlSession.selectList("Diary.likeList", lvo);
	}
	
	
	public int writeDiary(DiaryVO vo) {
		int result = 0;
		result = sqlSession.insert("Diary.writeDiary", vo);
		return result;
	}
	
	public int insertLike(LikeVO lvo) {
		System.out.println("dao" + lvo);
		int abc = sqlSession.insert("Diary.insertLike", lvo);
		System.out.println("abc는" + abc);
		return abc;
	}
	public int deleteLike(LikeVO lvo) {
		return sqlSession.delete("Diary.deleteLike", lvo);
	}
	public int likeCnt(LikeVO lvo) {
		return sqlSession.delete("Diary.likeCnt", lvo);
	}

	
}
