package com.plant.lab.review.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plant.lab.order.model.vo.OrderDetail;
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
	public int listCountRv(Review review) {
		return reviewDao.listCountRv(review);
	}
	
	@Override
	public List<Review> searchList(int pro_no) {
		return reviewDao.searchList(pro_no);
	}
	
	@Override
	public Review selectReview(Review review) {
		return reviewDao.selectReview(review);
	}
	
	@Override
	public List<Review> selectRvList(Review review) {
		return reviewDao.selectRvList(review);
	}
	
	@Override
	public List<Review> selectSearch(String keyword){
		return reviewDao.selectSearch(keyword);
	}
	

	@Override
	public List<Review> selectImgList(Review review){
		System.out.println("테스트용:::"+review.getRv_no());
		System.out.println("테스트용:::"+review.getBuy_no());
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
		result = reviewDao.insertReview(review);

		for(int i=0; i<pro_no.size();i++) {	
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
	
	//리뷰삭제하기
	@Transactional
	@Override
	public int deleteReview(Review review,List<OrderDetail> img) {
		int result = 0;
		
		Product pro = new Product();
		pro.setPro_totalStar(review.getRv_star());

		for(int i=0; i<img.size();i++) {
			pro.setPro_no(img.get(i).getPro_no());
			result = proDao.updateDelStar(pro);
			System.out.println("평점삭제::::"+result);
		}

		result = reviewDao.deleteReview(review);
		System.out.println("리뷰삭제::::"+result);
		
		result = reviewDao.deleteRvImg(review);
		System.out.println("리뷰이미지삭제::::"+result);
		
		
		return result;
	}
	
	@Override
	public int deleteRvImg(Review review) {
		return reviewDao.deleteRvImg(review);
	}
}
