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
	public int writeDiary(DiaryVO vo) {
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
	public List<CommentVO> currentComment(int comm_no) {
		List<CommentVO> list = null;
		try {
			list = dDao.currentComment(comm_no);
		} catch(Exception e) {
			e.printStackTrace();
		}
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






}
