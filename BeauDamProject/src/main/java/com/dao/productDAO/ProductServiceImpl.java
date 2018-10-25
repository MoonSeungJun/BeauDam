package com.dao.productDAO;

import java.util.*;

import javax.annotation.*;

import org.springframework.stereotype.*;

import com.table.productDTO.*;
import com.view.view.*;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Resource(name="productDAO")
	private ProductDAO dao;
	
	@Override
	public void insertProduct(ProductDTO dto) {
		dao.insertProduct(dto);
		
	}

	@Override
	public void insertBrand(BrandDTO dto) {
		dao.insertBrand(dto);
		
	}

	@Override
	public void insertImg(ImgDTO dto) {
		dao.insertImg(dto);
		
	}

	@Override
	public void insertColor(ColorDTO dto) {
		dao.insertColor(dto);
		
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		dao.updateProduct(dto);
		
	}

	@Override
	public void updateBrand(BrandDTO dto) {
		dao.updateBrand(dto);
		
	}

	@Override
	public void updateImg(ImgDTO dto) {
		dao.updateImg(dto);
		
	}

	@Override
	public void updateColor(ColorDTO dto) {
		dao.updateColor(dto);
		
	}

	@Override
	public void deleteProduct(String code) {
		dao.deleteProduct(code);
		
	}

	@Override
	public void deleteBrand(String code) {
		dao.deleteBrand(code);
		
	}

	@Override
	public void deleteColor(String code) {
		dao.deleteColor(code);
		
	}

	@Override
	public void deleteImg(String code) {
		dao.deleteImg(code);
		
	}

	@Override
	public List<ProductView> getProductList() {
		List<ProductView> lists = dao.getProductList();
		return lists;
	}
	
	@Override
	public ProductView getOneProductData(String code) {
		ProductView view = dao.getOneProductData(code);
		return view;
	}

	@Override
	public List<ProductView> getAllProductData(Map<String,Object> map) {
		List<ProductView> lists = dao.getAllProductData(map);
		return lists;
	}
	
}
