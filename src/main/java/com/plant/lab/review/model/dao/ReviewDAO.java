package com.plant.lab.review.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.product.model.vo.ProductContnet;
import com.plant.lab.review.model.vo.Review;

@Repository("reviewDao")
public class ReviewDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//리뷰 가져오기
	public List<Review> searchList(int pro_no) {
		return sqlSession.selectList("Review.selectList",pro_no);
	}
	
	//리뷰 사진 가져오기
	public List<Review> selectImgList(Review review) {
		return sqlSession.selectList("Review.selectImgList",review);
	}
	
	//상품별 총 리뷰수 
	public int listCount(int pro_no) {
		return sqlSession.selectOne("Review.listCount",pro_no);
	}
	
	//상품별 별점 수
	public int starCount(HashMap<String, Integer> map) {
		return sqlSession.selectOne("Review.starCount",map);
	}
	
	//리뷰추가
	public int insertReview(Review review){
		return sqlSession.insert("Review.insertReview",review);
	}
	
	//리뷰이미지추가
	public int insertRvImg(Review review){
		return sqlSession.insert("Review.insertRvImg",review);
	}
	
	//리뷰작성여부 체크
	public int checkRv(int buy_no) {
		return sqlSession.selectOne("Review.checkRv",buy_no);
	}
}
