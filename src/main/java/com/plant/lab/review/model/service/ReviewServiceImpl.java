package com.plant.lab.review.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.review.model.dao.ReviewDAO;
import com.plant.lab.review.model.vo.Review;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDAO reviewDao;
	
	@Override
	public List<Review> searchList(int pro_no) {
		return reviewDao.searchList(pro_no);
	}

	@Override
	public List<Review> selectImgList(Review review){
		return reviewDao.selectImgList(review);
	}

	@Override
	public int listCount(int pro_no) {
		return reviewDao.listCount(pro_no);
	}

	@Override
	public int starCount(HashMap<String, Integer> map) {
		return reviewDao.starCount(map);
	}
}
