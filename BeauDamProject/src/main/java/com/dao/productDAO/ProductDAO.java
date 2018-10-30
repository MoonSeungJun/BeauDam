package com.dao.productDAO;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.table.productDTO.*;
import com.view.view.*;

@Repository("productDAO")
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	 
	public void insertProduct(ProductDTO dto) {
		sessionTemplate.insert("beaudam.insertProduct",dto);
		
	}

	 
	public void insertBrand(BrandDTO dto) {
		sessionTemplate.insert("beaudam.insertBrand",dto);
		
	}

	 
	public void insertImg(ImgDTO dto) {
		sessionTemplate.insert("beaudam.insertImg",dto);
		
	}

	 
	public void insertColor(ColorDTO dto) {
		sessionTemplate.insert("beaudam.insertColor",dto);
		
	}

	 
	public void updateProduct(ProductDTO dto) {
		sessionTemplate.update("beaudam.updateProduct",dto);
		
	}

	 
	public void updateBrand(BrandDTO dto) {
		sessionTemplate.update("beaudam.updateBrand",dto);
		
	}

	 
	public void updateImg(ImgDTO dto) {
		sessionTemplate.update("beaudam.updateImg",dto);
		
	}
	public void updateQty(Map<String, Object> map) {
		sessionTemplate.update("beaudam.updateQty",map);
	}
	 
	public void updateColor(ColorDTO dto) {
		sessionTemplate.update("beaudam.updateColor",dto);
		
	}

	 
	public void deleteProduct(String code) {
		sessionTemplate.delete("beaudam.deleteProduct",code); 
		
	}

	 
	public void deleteBrand(String code) {
		sessionTemplate.delete("beaudam.deleteBrand",code);
		
	}

	 
	public void deleteColor(String code) {
		sessionTemplate.delete("beaudam.deleteColor",code);
		
	}

	 
	public void deleteImg(String code) {
		sessionTemplate.delete("beaudam.deleteImg",code);
		
	}
	
	public List<ProductView> getProductList(){
		List<ProductView> lists = sessionTemplate.selectList("beaudam.getProductList");
		return lists;
		
	}
	
	public ProductView getOneProductData(String code) {
		ProductView view = sessionTemplate.selectOne("beaudam.getOneProductData",code);
		return view;
	}
	
	public List<ProductView> getAllProductData(Map<String,Object> map) {
		List<ProductView> lists = sessionTemplate.selectList("beaudam.getAllProductData",map);
		return lists;
	}
	
	
	
}
