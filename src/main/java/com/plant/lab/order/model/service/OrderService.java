package com.plant.lab.order.model.service;

import java.util.List;

import com.plant.lab.cart.model.vo.Cart;
import com.plant.lab.order.model.vo.Order;
import com.plant.lab.order.model.vo.OrderDetail;

public interface OrderService {
	public int orderDetailInsert(OrderDetail detail);
	public int orderInsert(Order order, List<Integer> pro_no, List<Integer> pro_num, List<Cart> cart);
}
