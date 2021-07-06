package com.plant.lab.order.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
	
	//회원별 주문상세 개수
	public int listCount(Order order) {
		return sqlSession.selectOne("Order.listCount",order);
	}
	
	//회원별 주문검색
	public List<Order> selectOrderList(int startPage, int limit,Order order){
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Order.selectOrderList",order,row);
	}
	
	//주문상세정보
	public List<OrderDetail> selectOrderDList(int buy_no){
		return sqlSession.selectList("OrderDetail.selectOrderDList",buy_no);
	}
	
	//주문상세내역조회
	public Order selectOrder(int buy_no) {
		return sqlSession.selectOne("Order.selectOrder",buy_no);
	}
}
