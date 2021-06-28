package com.plant.lab.review.model.service;

import java.util.List;

import com.plant.lab.review.model.vo.Review;

public interface ReviewService {
	//리뷰 가져오기
	public List<Review> searchList(int pro_no);
	
	//리뷰 사진 가져오기
	public List<Review> selectImgList(Review review);
	
}
