package com.plant.lab.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plant.lab.product.model.dao.ProductContentDAO;
import com.plant.lab.product.model.vo.ProductContnet;

@Service("proConService")
public class ProductContentImpl implements ProductContentService{
	@Autowired
	private ProductContentDAO proConDao;
	
	//상품상세 정보
	@Override
	public List<ProductContnet> searchList(int pro_no) {
		
		return proConDao.searchList(pro_no);
	}
}
