package com.plant.lab.product.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.product.model.vo.Product;

@Repository("productDao")
public class ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//상품 전체 불러오기
	public int listCount() {
		return 1;
	}
	
	//상품 검색 조회
	public List<Product> searchList(String keyword) {
		List<Product> ll = null;
		return ll;
	}
	
	//특정 페이지 단위의 상품 조회
	public List<Product> selectList(int startPage, int limit) {
		List<Product> ll = null;
		return ll;
	}
	
	//상품추가
	public int insertProduct(Product product) { 
		return 1;
	}
	
	//상품수정
	public int updateProduct(Product product) { 
		return 1;
	}
	
	//상품삭제
	public int deleteProduct(int pro_no) { 
		return 1;
	}
}
