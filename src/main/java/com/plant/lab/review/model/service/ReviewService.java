package com.plant.lab.review.model.service;

import java.util.HashMap;
import java.util.List;

import com.plant.lab.review.model.vo.Review;

public interface ReviewService {
	//리뷰 가져오기
	public List<Review> searchList(int pro_no);
	
	//리뷰 사진 가져오기
	public List<Review> selectImgList(Review review);
	
	//상품별 총 리뷰수 
	public int listCount(int pro_no);
	
	//상품별 별점 수
	public int starCount(HashMap<String, Integer> map);
	
	//리뷰추가
	public int insertReview(Review review,List<String> img,List<Integer> pro_no);
	
	//리뷰작성여부 체크
	public int checkRv(int buy_no);
}
