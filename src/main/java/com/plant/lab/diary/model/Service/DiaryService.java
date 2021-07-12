package com.plant.lab.diary.model.Service;

import java.util.List;

import com.plant.lab.diary.model.vo.CommentVO;
import com.plant.lab.diary.model.vo.DiaryImgVO;
import com.plant.lab.diary.model.vo.DiaryVO;
import com.plant.lab.diary.model.vo.LikeVO;

public interface DiaryService {
	
	// 게시글
	public List<DiaryVO> listDiary();
	public List<DiaryVO> detailDiary(int diary_no);
	public List<DiaryVO> searchId(String keyword);
	public List<DiaryVO> searchId(int startPage, int limit, String keyword);
	public List<DiaryVO> searchContent(String keyword);
	public List<DiaryVO> searchContent(int startPage, int limit, String keyword);
	
	public int getSearchIdListCount(String keyword);
	public int getSearchContentListCount(String keyword);
	public int getSearchContentMyListCount(DiaryVO vo);
	
	public int getlistCount(int diary_write);
	public int getListCountAll();
	
	public List<DiaryImgVO> diaryImg (int diary_no);
	
	// 좋아요
	public List<Integer> likeList(LikeVO lvo);
	public int insertLike(LikeVO lvo);
	public int deleteLike(LikeVO lvo);
	public int likeCnt(LikeVO lvo);
	
	
	// 글쓰기
	
	public int writeDiary(DiaryVO vo, List<String> diary_img_src);
	public int modifyDiary(DiaryVO vo, List<String> diary_img_src);
	public int deleteDiary(DiaryVO vo);
	public int deleteImg(int diary_img_num);

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
