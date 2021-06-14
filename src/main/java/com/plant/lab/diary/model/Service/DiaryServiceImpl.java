package com.plant.lab.diary.model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.diary.model.dao.DiaryDao;
import com.plant.lab.diary.model.vo.DiaryVO;
import com.plant.lab.diary.model.vo.LikeVO;

@Service("dService")
public class DiaryServiceImpl implements DiaryService {

	@Autowired
	private DiaryDao dDao;

	@Override
	public List<String> listDiary() {
		List<String> list = null;
		try {
			list = dDao.listDiary();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int writeDiary(DiaryVO vo) {
		return dDao.writeDiary(vo);
	}

	@Override
	public int like(LikeVO lvo) {
		return dDao.like(lvo);
	}

	@Override
	public int likecnt() {
		int likecnt = dDao.likecnt();
		return likecnt;
	}

	@Override
	public int deletelike(int diary_no) {
		return dDao.deletelike(diary_no);
	}

}
