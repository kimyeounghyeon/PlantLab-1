package com.plant.lab.product.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plant.lab.product.model.dao.ProductContentDAO;
import com.plant.lab.product.model.dao.ProductDAO;
import com.plant.lab.product.model.vo.Product;
import com.plant.lab.product.model.vo.ProductContnet;

@Service("proService")
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDAO proDao;
	@Autowired
	private ProductContentDAO proConDao;

	//상품개수
	@Override
	public int listCount(String cate) {
		return proDao.listCount(cate);
	}

	//상품검색
	@Override
	public List<Product> searchList(String keyword) {
		return proDao.searchList(keyword);
	}
	
	//상품전체리스트
	@Override
	public List<Product> selectList(int startPage, int limit,String cate,String orderby) {
		
		if(orderby.equals("new")) {
			return proDao.selectList(startPage,limit,cate,orderby);
		}else if(orderby.equals("low")) {
			return proDao.selectListOrderLow(startPage,limit,cate,orderby);
		}else if(orderby.equals("high")) {
			return proDao.selectListOrderHigh(startPage,limit,cate,orderby);
		}else {
			return proDao.selectListOrderBest(startPage, limit, cate, orderby);
		}
	}
	
	//상품 상세보기
	@Override
	public Product selectOne(int pro_no) {
		
		return proDao.selectOne(pro_no);
	};

	@Transactional
	@Override
	public int insertPro(Product product,List<String> img) {
		int result = 0;
		result = proDao.insertPro(product);
		if(result == 1) {
			ProductContnet proc = new ProductContnet();
			proc.setPro_cate(product.getPro_cate());

			if(img.size()!=0) {
				for(int i = 0; i<img.size();i++) {
					proc.setPro_detail(img.get(i));
					result = proConDao.insertProD(proc);
				}
			}
		}
		return result;
	}


	@Transactional
	@Override
	public int updateProduct(Product product) {
		return 0;
	}

	@Transactional
	@Override
	public int updateStock(Product product) {
		return proDao.updateStock(product);
	}
	
	@Transactional
	@Override
	public int deleteProduct(int pro_no) {
		return 0;
	}
	
	//별점업데이트
	@Override
	public int updateStar(Product product) {
		return proDao.updateStar(product);
	}
}
