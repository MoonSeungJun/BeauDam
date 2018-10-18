package com.dao.adminDAO;

import javax.annotation.*;

import org.springframework.stereotype.*;

import com.table.adminDTO.*;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Resource(name="adminDAO")
	private AdminDAO dao;
	
	@Override
	public void insertBrand(Admin_BrandDTO dto) {		
		dao.insertAdminBrand(dto);		
	}

	@Override
	public void insertCategory(Admin_CategoryDTO dto) {
		dao.insertAdminCategory(dto);		
	}

	@Override
	public void insertType(Admin_TypeDTO dto) {
		dao.insertAdminType(dto);		
	}

	@Override
	public void deleteBrand(String brand) {
		dao.deleteAdminBrand(brand);
	}

	@Override
	public void deleteCategory(String category) {
		dao.deleteAdminCategory(category);		
	}

	@Override
	public void deleteType(String type) {
		dao.deleteAdminType(type);		
	}	
	
	
	
}
