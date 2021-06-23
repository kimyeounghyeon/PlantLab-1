package com.plant.lab.order.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.order.model.vo.Order;
import com.plant.lab.order.model.vo.OrderDetail;

@Repository("orderDao")
public class OrderDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//주문 테이블 추가
	public int orderInsert(Order order) {
		return sqlSession.insert("Order.insertOrder",order);
	}
	
	//주문 상세 테이블 추가
	public int orderDetailInsert(OrderDetail detail) {
		return sqlSession.insert("OrderDetail.insertOrderDetail",detail);
	}
}
