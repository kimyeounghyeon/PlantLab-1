package com.plant.lab.cart.model.service;

import java.util.List;

import com.plant.lab.cart.model.vo.Cart;

public interface CartService {
	public Cart searchHasCart(int user_no);
	public int cartInsert(Cart cart);
	public List<Cart> serchList(int user_no);
	public int cartDetailInsert(Cart cart);
	public int cartDetailDel(Cart cart);
}
