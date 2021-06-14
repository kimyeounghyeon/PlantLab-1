package com.plant.lab.product.model.service;

import java.util.List;

import com.plant.lab.product.model.vo.Product;

public interface ProductService {
	
	//상품 전체 불러오기
	public int listCount();
	
	//상품 검색 조회
	public List<Product> searchList(String keyword);
	
	//특정 페이지 단위의 상품 조회
	public List<Product> selectList(int startPage, int limit);
	
	//상품 상세보기
	public Product selectOne(int pro_no);
	
	//상품추가
	public int insertProduct(Product product);
	
	//상품수정
	public int updateProduct(Product product);
	
	//상품삭제
	public int deleteProduct(int pro_no);
}
