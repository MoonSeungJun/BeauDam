package com.dao.adminDAO;

import com.table.adminDTO.*;

public interface AdminService {

//	insert	
	void insertBrand(Admin_BrandDTO dto);
	void insertCategory(Admin_CategoryDTO dto);
	void insertType(Admin_TypeDTO dto);

	
//	select
	
	
//	update
//	delete
	void deleteBrand(String brand);
	void deleteCategory(String category);
	void deleteType(String type);
	
	
	
	
}
