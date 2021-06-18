package com.plant.lab.cart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plant.lab.cart.model.dao.CartDAO;
import com.plant.lab.cart.model.vo.Cart;


@Service("cartService")
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAO cartDao;
	
	//카트여부 확인
	@Override
	public Cart searchHasCart(int user_no) {
		return cartDao.searchHasCart(user_no);
	}
	
	//카트 전체 리스트
	@Override
	public List<Cart> serchList(int user_no){
		return cartDao.searchList(user_no);
	}

	//카트 추가
	@Transactional
	@Override
	public int cartInsert(Cart cart) {
		return cartDao.cartInsert(cart);
	}
	
	//카트 상품추가
	@Transactional
	@Override
	public int cartDetailInsert(Cart cart) {
		return cartDao.cartDetailInsert(cart);
	}
	
	//카트삭제
	@Transactional
	@Override
	public int cartDetailDel(Cart cart) {
		return cartDao.cartDetailDel(cart);
	}
}
