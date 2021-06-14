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
	
	public List<String> listDiary() {
		return sqlSession.selectList("Diary.listDiary");
	}
	
	public int writeDiary(DiaryVO vo) {
		int result = 0;
		result = sqlSession.insert("Diary.writeDiary", vo);
		return result;
	}
	
	public int like(LikeVO lvo) {
		System.out.println("dao" + lvo);
		int abc = sqlSession.insert("Like.like", lvo);
		System.out.println("abc를 찾아서" + abc);
		return abc;
	}
	
	public int likecnt() {
		return sqlSession.selectOne("Like.likecnt");
	}
	
	public int deletelike(int diary_no) {
		return sqlSession.delete("Like.deletelike", diary_no);
	}
}
