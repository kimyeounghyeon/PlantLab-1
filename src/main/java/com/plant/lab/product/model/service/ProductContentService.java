package com.plant.lab.product.model.service;

import java.util.List;

import com.plant.lab.product.model.vo.Product;
import com.plant.lab.product.model.vo.ProductContnet;

public interface ProductContentService {
	public List<ProductContnet> searchList(int pro_no);
	public int insertProD(ProductContnet product);
	public int updateProD(Product pro, List<String> img);
	public int deleteProD(int pro_no);
	public int deleteProDOne(ProductContnet product);
}
