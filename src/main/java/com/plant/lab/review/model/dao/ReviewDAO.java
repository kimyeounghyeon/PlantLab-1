package com.plant.lab.review.model.dao;

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
}
