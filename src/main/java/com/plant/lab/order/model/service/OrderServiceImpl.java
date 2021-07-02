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
		 result = orderDao.orderInsert(order);
		 
		 OrderDetail orderD = new OrderDetail();
		 for(int i=0; i<pro_no.size();i++) {
				orderD.setPro_no(pro_no.get(i));
				
				orderD.setPro_num(pro_num.get(i));
				result = orderDao.orderDetailInsert(orderD);
		}
		
		 
		for(int i = 0; i<cart.size(); i++){
			for(int j=0; j<pro_no.size(); j++) {
				if(cart.get(i).getPro_no() == pro_no.get(i)) {
					//카트삭제
					cart.get(i).setPro_no(pro_no.get(i));
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
	public int orderDetailInsert(OrderDetail detail) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int listCount(int user_no) {
		return orderDao.listCount(user_no);
	}
	
	@Override
	public List<Order> selectOrderList(int startPage, int limit,int user_no) {
		return orderDao.selectOrderList(startPage,limit,user_no);
	}
	
	@Override
	public List<OrderDetail> selectOrderDList(int buy_no) {
		return orderDao.selectOrderDList(buy_no);
	}
}
