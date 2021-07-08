package com.plant.lab.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plant.lab.product.model.dao.ProductContentDAO;
import com.plant.lab.product.model.vo.Product;
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
	
	//인서트
	@Transactional
	@Override
	public int insertProD(ProductContnet product) {
		return proConDao.insertProD(product);
	}
	
	@Transactional
	@Override
	public int updateProD(Product pro, List<String> img) {
		int result = 0;
		ProductContnet proCon = new ProductContnet();
		proCon.setPro_cate(pro.getPro_cate());
		proCon.setPro_no(pro.getPro_no());
		
		for(int i = 0; i<img.size(); i++) {
			proCon.setPro_detail(img.get(i));
			result = proConDao.updateProD(proCon);
		}
		return result;
	}
	
	//삭제
	@Transactional
	@Override
	public int deleteProD(int pro_no) {
		return proConDao.deleteProD(pro_no);
	}
	
	//하나만 삭제
	@Transactional
	@Override
	public int deleteProDOne(ProductContnet product) {
		return proConDao.deleteProDOne(product);
	}
}
