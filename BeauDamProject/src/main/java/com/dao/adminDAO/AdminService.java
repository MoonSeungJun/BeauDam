package com.dao.adminDAO;

import java.util.*;

import com.table.adminDTO.*;


public interface AdminService {

//	insert	
	void insertBrand(Admin_BrandDTO dto);
	void insertCategory(Admin_CategoryDTO dto);
	void insertType(Admin_TypeDTO dto);

	
//	select
	List<Admin_BrandDTO> getAdminBrand();
	List<Admin_CategoryDTO> getAdminCategory();
	List<Admin_TypeDTO> getAdminType();
//	update
//	delete
	void deleteBrand(String brand);
	void deleteCategory(String category);
	void deleteType(String type);
	
	
	
	
}
