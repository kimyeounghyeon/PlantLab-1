package com.plant.lab.product.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.product.model.dao.ProductDAO;
import com.plant.lab.product.model.vo.Product;

@Service("proService")
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDAO proDao;

	//상품개수
	@Override
	public int listCount() {
		return proDao.listCount();
	}

	//상품검색
	@Override
	public List<Product> searchList(String keyword) {
		return proDao.searchList(keyword);
	}
	
	//상품전체리스트
	@Override
	public List<Product> selectList(int startPage, int limit) {
		return proDao.selectList(startPage,limit);
	}

	@Override
	public int insertProduct(Product product) {
		return 0;
	}

	@Override
	public int updateProduct(Product product) {
		return 0;
	}

	@Override
	public int deleteProduct(int pro_no) {
		return 0;
	}
}
