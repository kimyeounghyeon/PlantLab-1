package com.plant.lab.diary.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.diary.model.vo.CommentVO;
import com.plant.lab.diary.model.vo.DiaryVO;
import com.plant.lab.diary.model.vo.LikeVO;

@Repository("dDao")
public class DiaryDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 게시글 조회
	public List<DiaryVO> listDiary() {
		return sqlSession.selectList("Diary.listDiary");
	}
	
	// 좋아요 리스트 조회
	public List<Integer> likeList(LikeVO lvo) {
		return sqlSession.selectList("Diary.likeList", lvo);
	}
	
	// 게시글 세부 내용 조회
	public List<DiaryVO> detailDiary(int diary_no) {
		return sqlSession.selectList("Diary.detailDiary", diary_no);
	}
	
	
//	// 게시글 세부 내용 조회 map 사용
//	public List<DiaryVO> detailDiary(Map<String, Integer> map) {
//		return sqlSession.selectList("Diary.detailDiary", map);
//	}
	
	// 글 작성
	public int writeDiary(DiaryVO vo) {
		int result = 0;
		result = sqlSession.insert("Diary.writeDiary", vo);
		return result;
	}
	
	// 좋아요 클릭
	public int insertLike(LikeVO lvo) {
		return sqlSession.insert("Diary.insertLike", lvo);
	}
	
	// 좋아요 해제
	public int deleteLike(LikeVO lvo) {
		return sqlSession.delete("Diary.deleteLike", lvo);
	}
	
	// 좋아요 갯수
	public int likeCnt(LikeVO lvo) {
		return sqlSession.selectOne("Diary.likeCnt", lvo);
	}
	
	// 댓글 조회
	public List<CommentVO> selectComment(int diary_no) {
		return sqlSession.selectList("Diary.selectComment", diary_no);
	}
	
	// 최근 댓글 조회
	 public List<CommentVO> currentComment(int comm_no) {
		 return sqlSession.selectList("Diary.currentComment", comm_no);
	 }
	
	
	// 댓글 등록
	public int insertComment(CommentVO cvo) {
		return sqlSession.insert("Diary.insertComment", cvo);
		
	}



	
}
