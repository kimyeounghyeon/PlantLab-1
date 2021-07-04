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
	
	// 게시글 세부 내용 조회
	public List<DiaryVO> detailDiary(int diary_no) {
		return sqlSession.selectList("Diary.detailDiary", diary_no);
	}
	
	// 아이디로 게시글 검색
	public List<DiaryVO> searchId(String keyword) {
		return sqlSession.selectList("Diary.searchId",keyword);
	}
	
	// 글 내용으로 게시글 검색
	public List<DiaryVO> searchContent(String keyword) {
		return sqlSession.selectList("Diary.searchContent",keyword);
	}
	
	// 좋아요 리스트 조회
	public List<Integer> likeList(LikeVO lvo) {
		return sqlSession.selectList("Diary.likeList", lvo);
	}
	

	//글 작성
	public int writeDiary(DiaryVO vo) {
		int result = 0;
		result = sqlSession.insert("Diary.writeDiary", vo);
		return result;
	}
	
	// 이미지 첨부
	public int writeImg(DiaryVO vo) {
		return sqlSession.insert("Diary.writeImg", vo);
	}
	
	// 글 수정
	public int modifyDiary(DiaryVO vo) {
		return sqlSession.update("Diary.modifyDiary", vo);
	}

	// 이미지 수정
	public int modifyImg(DiaryVO vo) {
		return sqlSession.update("Diary.modifyImg", vo);
	}
	
	// 글 삭제
	public int deleteDiary(DiaryVO vo) {
		return sqlSession.delete("Diary.deleteDiary", vo);
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
	
	// 댓글 등록
	public int insertComment(CommentVO cvo) {
		return sqlSession.insert("Diary.insertComment", cvo);
	}
	
	// 댓글 수정
	public int updateComment(CommentVO cvo) {
		return sqlSession.update("Diary.updateComment", cvo);
	}
	
	// 댓글 삭제
	public int deleteComment(CommentVO cvo) {
		return sqlSession.delete("Diary.deleteComment", cvo);
	}

	
	
	// 시퀀스 번호 알아오기
	public int getSequence() {
		return sqlSession.selectOne("Diary.getSequence");
	}
	
	
	public int detailWrite(int diary_no) {
		return sqlSession.selectOne("Diary.detailWrite",diary_no);
	}
	
	// 내가 쓴 글
	public List<DiaryVO> mydiary(int diary_write) {
		return sqlSession.selectList("Diary.mydiary", diary_write);
	}
}
