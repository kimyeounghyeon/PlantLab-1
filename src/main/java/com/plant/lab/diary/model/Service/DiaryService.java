package com.plant.lab.diary.model.Service;

import java.util.List;

import com.plant.lab.diary.model.vo.DiaryVO;
import com.plant.lab.diary.model.vo.LikeVO;

public interface DiaryService {
	public List<DiaryVO> listDiary();
	public List<Integer> likeList(LikeVO lvo);
	
	public int insertLike(LikeVO lvo);
	public int deleteLike(LikeVO lvo);
	public int likeCnt(LikeVO lvo);
	
	
	public int writeDiary(DiaryVO vo);
}
