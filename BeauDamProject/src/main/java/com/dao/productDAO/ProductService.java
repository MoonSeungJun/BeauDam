package com.dao.productDAO;

import com.table.productDTO.*;

public interface ProductService {

	
//	insert
	void insertProduct(ProductDTO dto);
	void insertBrand(BrandDTO dto);
	void inserImg(ImgDTO dto);
	void insertColoe(ColorDTO dto);
//	update
	void updateProduct(ProductDTO dto);
	void updateBrand(BrandDTO dto);
	void updateImg(ImgDTO dto);
	void updateColor(ColorDTO dto);
//	delete
	void deleteProduct(String code);
	void deleteBrand(String code);
	void deleteColor(String code);
	void deleteImg(String code);
//	select
}
