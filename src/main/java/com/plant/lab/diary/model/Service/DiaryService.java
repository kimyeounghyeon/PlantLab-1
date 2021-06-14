package com.plant.lab.diary.model.Service;

import java.util.List;

import com.plant.lab.diary.model.vo.DiaryVO;
import com.plant.lab.diary.model.vo.LikeVO;

public interface DiaryService {
	public List<String> listDiary();
	
	public int writeDiary(DiaryVO vo);

	public int like(LikeVO lvo);
	
	public int likecnt();
	
	public int deletelike(int diary_no);
}
