package com.dao.productDAO;

import java.util.*;

import com.table.productDTO.*;
import com.view.view.*;

public interface ProductService {

	
//	insert
	void insertProduct(ProductDTO dto);
	void insertBrand(BrandDTO dto);
	void insertImg(ImgDTO dto);
	void insertColor(ColorDTO dto);
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
	List<ProductView> getProductList();
	ProductView getOneProductData(String code);
	List<ProductView> getAllProductData(Map<String,Object> map);
}
