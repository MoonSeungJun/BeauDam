package com.dao.productDAO;

import org.mybatis.spring.*;
import org.springframework.stereotype.*;

import com.table.productDTO.*;

@Repository("productDAO")
public class ProductDAO {

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

	 
	public void inserImg(ImgDTO dto) {
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
	
	
	
	
	
}
