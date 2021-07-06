package com.plant.lab.diary.model.Service;

import java.util.List;

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
	
	
	// 검색
	// 아이디 검색
	@Override
	public List<DiaryVO> searchId(String keyword) {
		List<DiaryVO> list = null;
		try {
			list = dDao.searchId(keyword);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	// 내용 검색
	@Override
	public List<DiaryVO> searchContent(String keyword) {
		List<DiaryVO> list = null;
		try {
			list = dDao.searchContent(keyword);
		} catch(Exception e) {
			e.printStackTrace();
		} 
		 return list;
	}
	
	
	// 게시글 수 구하기
	@Override
	public int getlistCount(int diary_write) {
		int cnt = -1;
		try {
			cnt = dDao.getlistCount(diary_write);
		} catch(Exception e) {
			e.printStackTrace();
		}
		 return cnt;
	}
	
	@Override
	public int getListCountAll() {
		int cnt = -1;
		try {
			cnt = dDao.getListCountAll();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
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
		return result;
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
	public int modifyDiary(DiaryVO vo) {
		int result = -1;
		try {
			result = dDao.modifyDiary(vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int modifyImg(DiaryVO vo) {
		int result = -1;
		try {
			result = dDao.modifyImg(vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int deleteDiary(DiaryVO vo) {
		int result = -1;
		try {
			result = dDao.deleteDiary(vo);
		} catch(Exception e) {
			e.printStackTrace();
		} 
		return result;
	}

	public int getSequence() {
		int diary_no = -1;
		
		try {
			diary_no = dDao.getSequence();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return diary_no;
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


	@Override
	   public List<DiaryVO> myDiary(int startPage, int limit, int diary_write) {
	      return dDao.myDiary(startPage, limit, diary_write);
	   }
	
	@Override
	public List<DiaryVO> myContent(int startPage, int limit, DiaryVO vo) {
		return dDao.myContent(startPage, limit, vo);
	}
	
	@Override
	public List<DiaryVO> admlistDiary(int startPage, int limit) {
		return dDao.admlistDiary(startPage, limit);
	}
	
}
