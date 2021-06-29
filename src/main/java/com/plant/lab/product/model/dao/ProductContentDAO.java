package com.plant.lab.product.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.product.model.vo.Product;
import com.plant.lab.product.model.vo.ProductContnet;

@Repository("proConDao")
public class ProductContentDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//상품 상세설명 가져오기
	public List<ProductContnet> searchList(int pro_no) {
		return sqlSession.selectList("ProductCon.selectList",pro_no);
	}
	
	//상품 이미지 가져오기
}
