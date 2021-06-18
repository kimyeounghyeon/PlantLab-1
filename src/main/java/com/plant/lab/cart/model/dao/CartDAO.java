package com.plant.lab.cart.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.cart.model.vo.Cart;

@Repository("cartDao")
public class CartDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//장바구니가 있는지 확인
	public Cart searchHasCart(int user_no) {
		return sqlSession.selectOne("selectHasCart",user_no);
	}
	
	//장바구니 추가
	public int cartInsert(Cart cart) {
		return sqlSession.insert("Cart.insertCart",cart);
	}
	
	//장바구니 리스트 전체 가져오기
	public List<Cart> searchList(int user_no){
		return sqlSession.selectList("Cart.selectList",user_no);
	}
	
	//장바구니 상품추가
	public int cartDetailInsert(Cart cart) {
		return sqlSession.insert("Cart.insertCartDetail",cart);
	}

	//장바구니 삭제
	public int cartDetailDel(Cart cart) {
		return sqlSession.delete("Cart.deleteCartDetail",cart);
	}
}
