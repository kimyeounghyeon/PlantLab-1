package com.plant.lab.review.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plant.lab.product.model.dao.ProductDAO;
import com.plant.lab.product.model.vo.Product;
import com.plant.lab.review.model.dao.ReviewDAO;
import com.plant.lab.review.model.vo.Review;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDAO reviewDao;
	@Autowired
	private ProductDAO proDao;
	
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
	
	@Transactional
	@Override
	public int insertReview(Review review,List<String> img,List<Integer> pro_no) {
		int result = 0;
		for(int i=0; i<pro_no.size();i++) {
			review.setPro_no(pro_no.get(i));
			result = reviewDao.insertReview(review);
			
			if(result == 1) {
				if(img.size()>0) {
					for(int j=0; j<img.size();j++) {
						Review imgR = new Review();
						imgR.setRv_img_num(j+1);
						imgR.setRv_img_src(img.get(j));
						reviewDao.insertRvImg(imgR);				
					}					
				}
			}
			
			Product pro = new Product();
			pro.setPro_totalStar(review.getRv_star());
			pro.setPro_no(pro_no.get(i));
			System.out.println("review.getRv_star()체크::::"+pro.getPro_totalStar());
			result = proDao.updateStar(pro);
		}
		
		return result;
	}
	
	//리뷰작성여부
	@Override
	public int checkRv(int buy_no) {
		
		return reviewDao.checkRv(buy_no);
	}
}
