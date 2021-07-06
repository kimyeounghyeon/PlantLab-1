package com.plant.lab.diary.model.Service;

import java.util.List;
import java.util.Map;

import com.plant.lab.diary.model.vo.CommentVO;
import com.plant.lab.diary.model.vo.DiaryVO;
import com.plant.lab.diary.model.vo.LikeVO;

public interface DiaryService {
	
	// 게시글
	public List<DiaryVO> listDiary();
	public List<DiaryVO> detailDiary(int diary_no);
	public List<DiaryVO> searchId(String keyword);
	public List<DiaryVO> searchContent(String keyword);
	public int getlistCount(int diary_write);
	public int getListCountAll();
	
	// 좋아요
	public List<Integer> likeList(LikeVO lvo);
	public int insertLike(LikeVO lvo);
	public int deleteLike(LikeVO lvo);
	public int likeCnt(LikeVO lvo);
	
	
	// 글쓰기
	public int writeDiary(DiaryVO vo);
	public int writeImg(DiaryVO vo);
	public int modifyDiary(DiaryVO vo);
	public int modifyImg(DiaryVO vo);
	public int deleteDiary(DiaryVO vo);

	// 댓글
	public List<CommentVO> selectComment(int diary_no);
	public int insertComment(CommentVO cvo);
	public int updateComment(CommentVO cvo);
	public int deleteComment(CommentVO cvo);
	
	
	// 게시글 번호 불러오기
	public int getSequence();
	
	public int detailWrite(int diary_no);

	// 내가 쓴 글
	public List<DiaryVO> myDiary(int startPage, int limit, int diary_write);
	public List<DiaryVO> myContent(int startPage, int limit, DiaryVO vo);
	
	// 관리자 일기 관리
	public List<DiaryVO> admlistDiary(int startPage, int limit);
	
	}
