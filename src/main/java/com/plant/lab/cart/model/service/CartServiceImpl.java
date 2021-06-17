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
	
	//카트 전체 리스트
	@Override
	public List<Cart> serchList(int user_no){
		return cartDao.searchList(user_no);
	}
	
	@Transactional
	@Override
	public int cartInsert(Cart cart) {
		return cartDao.cartInsert(cart);
	}
}
