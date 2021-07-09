package com.plant.lab.order.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plant.lab.cart.model.dao.CartDAO;
import com.plant.lab.cart.model.vo.Cart;
import com.plant.lab.order.model.dao.OrderDAO;
import com.plant.lab.order.model.vo.Order;
import com.plant.lab.order.model.vo.OrderDetail;
import com.plant.lab.product.model.dao.ProductDAO;
import com.plant.lab.product.model.vo.Product;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDao;
	@Autowired
	private CartDAO cartDao;
	@Autowired
	private ProductDAO productDao;
	
	//주문 테이블 추가
	@Transactional
	@Override
	public int orderInsert(Order order,List<Integer> pro_no,List<Integer> pro_num,List<Cart> cart) {
		 int result = 0;
		 System.out.println("::::::::::::::::::::::"+order.getReserv_no());
		 result = orderDao.orderInsert(order);
		 
		 
		 OrderDetail orderD = new OrderDetail();
		 for(int i=0; i<pro_no.size();i++) {
				orderD.setPro_no(pro_no.get(i));
				
				orderD.setPro_num(pro_num.get(i));
				result = orderDao.orderDetailInsert(orderD);
		}
		
		System.out.println("카트페이지 :::"+cart.size());
		 
		for(int i = 0; i<cart.size(); i++){
			for(int j=0; j<pro_no.size(); j++) {
				if(cart.get(i).getPro_no() == pro_no.get(j)) {
					//카트삭제
					cart.get(i).setPro_no(pro_no.get(j));
					cart.get(i).setUser_no(order.getUser_no());
					result = cartDao.cartDetailDel(cart.get(i));
				}
			}
		}
		
		Product pro = new Product();
		for(int i = 0; i<pro_no.size(); i++){
			 pro = productDao.selectOne(pro_no.get(i));
			 pro.setPro_stock(pro.getPro_stock() - pro_num.get(i));
			 
			 result = productDao.updateStock(pro);
		}
		
		 return result;
	}
	
	@Override
	public int orderInsert(Order order) {
		 int result = 0;
		 System.out.println(order.getReserv_no());
		 result = orderDao.orderInsert(order);
		
		 return result;
	}
//디테일
	@Override
	public int orderDetailInsert(OrderDetail detail) {
//		int D_result = orderDao.orderDetailInsert(detail);
		return 0;
	}
	
	//회원별 주문리스트 개수
	@Override
	public int listCount(Order order) {
		return orderDao.listCount(order);
	}
	
	//회원별 주문내역 리스트
	@Override
	public List<Order> selectOrderList(int startPage, int limit,Order order) {
		return orderDao.selectOrderList(startPage,limit,order);
	}
	
	//주문상세리스트
	@Override
	public List<OrderDetail> selectOrderDList(int buy_no) {
		return orderDao.selectOrderDList(buy_no);
	}
	
	//주문상세조회
	@Override
	public Order selectOrder(int buy_no) {
		return orderDao.selectOrder(buy_no);
	}
}
