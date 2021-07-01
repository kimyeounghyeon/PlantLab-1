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
	
	// 좋아요
	public List<Integer> likeList(LikeVO lvo);
	public int insertLike(LikeVO lvo);
	public int deleteLike(LikeVO lvo);
	public int likeCnt(LikeVO lvo);
	
	
	// 글쓰기
	public int writeDiary(DiaryVO vo);
	public int writeImg(DiaryVO vo);
	public int deleteDiary(DiaryVO vo);

	// 댓글
	public List<CommentVO> selectComment(int diary_no);
	public int insertComment(CommentVO cvo);
	public int updateComment(CommentVO cvo);
	public int deleteComment(CommentVO cvo);
	
	
	// 게시글 번호 불러오기
	public int getSequence();
}
