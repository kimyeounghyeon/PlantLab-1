package com.plant.lab.diary.model.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plant.lab.diary.model.dao.DiaryDao;
import com.plant.lab.diary.model.vo.CommentVO;
import com.plant.lab.diary.model.vo.DiaryVO;
import com.plant.lab.diary.model.vo.LikeVO;

@Service("dService")
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired
	private DiaryDao dDao;

	@Override
	public List<DiaryVO> listDiary() {
		List<DiaryVO> list = null;
		try {
			list = dDao.listDiary();
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("[영현]listDiary() list중 1개:" + list.get(0).toString());
		return list;
	}

	
	// 글 세부 정보
	@Override
	public List<DiaryVO> detailDiary(int diary_no) {
		List<DiaryVO> list = null;
		
		try {
			list = dDao.detailDiary(diary_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	// 좋아요
	//@Transactional
	@Override
	public int insertLike(LikeVO lvo) {
		int result = -1;
		try {
			result = dDao.insertLike(lvo);
			//if(result>0)
			result = dDao.likeCnt(lvo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteLike(LikeVO lvo) {
		int result = -1;
		try {
			result = dDao.deleteLike(lvo);
			//if(result>0)
			result = dDao.likeCnt(lvo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int likeCnt(LikeVO lvo) {
		int result = -1;
		try {
			result = dDao.likeCnt(lvo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

	@Override
	public List<Integer> likeList(LikeVO lvo) {
		List<Integer> list = null;
		try {
			list = dDao.likeList(lvo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("[영현]likeList() :" + list);
		return list;
	}
	
	
	
	// 일기
	@Override
	public int writeDiary(DiaryVO vo) {
		int result = -1;
		try { 
			result = dDao.writeDiary(vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return dDao.writeDiary(vo);
	}
	
	@Override
	public int writeImg(DiaryVO vo) {
		int result = -1;
		try {
			result = dDao.writeImg(vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	@Override
	public int deleteDiary(DiaryVO vo) {
		int result = -2;
		try {
			result = dDao.deleteDiary(vo);
		} catch(Exception e) {
			e.printStackTrace();
		} 
		return result;
	}

	public int getSequence() {
		int diaryNo = -1;
		
		try {
			diaryNo = dDao.getSequence();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return diaryNo;
	}
	
	
	// 댓글
	@Override
	public List<CommentVO> selectComment(int diary_no) {
		List<CommentVO> list = null;
		try {
			list = dDao.selectComment(diary_no);
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("댓글 시작" + list);
		return list;
	}

	
	@Override
	public int insertComment(CommentVO cvo) {
		int result = -1;
		try {
		result = dDao.insertComment(cvo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	@Override
	public int updateComment(CommentVO cvo) {
		int result = -1;
		try {
			result = dDao.updateComment(cvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public int deleteComment(CommentVO cvo) {
		int result = -1;
		try {
			result = dDao.deleteComment(cvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		  return result;
	}
	
	@Override
	public int detailWrite(int diary_no) {
		return dDao.detailWrite(diary_no);
	}
}
