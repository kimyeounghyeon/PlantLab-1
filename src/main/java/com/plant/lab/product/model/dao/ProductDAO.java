package com.plant.lab.product.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.product.model.vo.Product;

@Repository("proDao")
public class ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//상품 전체 불러오기
	public int listCount(String cate) {
		return sqlSession.selectOne("Product.listCount",cate);
	}
	
	//상품 검색 조회
	public List<Product> searchList(String keyword) {
		return sqlSession.selectList("Product.searchList",keyword);
	}
	
	//특정 페이지 단위의 상품 조회
	public List<Product> selectList(int startPage, int limit,String cate,String orderby) {
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Product.selectList",cate,row);
	}
	
	//판매량순 조회(재고순)
	public List<Product> selectListOrderBest(int startPage, int limit,String cate,String orderby) {
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Product.selectListOrderBest",cate,row);
	}

	//가격낮은순 조회
	public List<Product> selectListOrderLow(int startPage, int limit,String cate,String orderby) {
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Product.selectListOrderLow",cate,row);
	}
	
	//가격높은순 조회
	public List<Product> selectListOrderHigh(int startPage, int limit,String cate,String orderby) {
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Product.selectListOrderHigh",cate,row);
	}
	
	
	
	//상품 상세보기
	public Product selectOne(int pro_no) {
		return sqlSession.selectOne("Product.selectOne", pro_no);
	}
	
	//상품추가
	public int insertPro(Product product) { 
		return sqlSession.insert("Product.insertPro", product);
	}
	
	//상품수정
	public int updatePro(Product product) { 
		return sqlSession.update("Product.updatePro",product);
	}
	
	//상품제고수정
	public int updateStock(Product product) {
		return sqlSession.update("Product.updateStock",product);
		//return sqlSession.update("Product.updateStock",product);
	}
	
	//상품삭제
	public int deletePro(int pro_no) { 
		return sqlSession.delete("Product.deletePro",pro_no);
	}
	
	//상품 별점 업데이트
	public int updateStar(Product product) {
		return sqlSession.update("Product.updateStar",product);
	}
}
