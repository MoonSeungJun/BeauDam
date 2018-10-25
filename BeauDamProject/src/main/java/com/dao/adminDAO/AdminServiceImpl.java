package com.dao.adminDAO;

import java.util.*;

import javax.annotation.*;

import org.springframework.stereotype.*;

import com.table.adminDTO.*;
import com.view.view.*;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Resource(name = "adminDAO")
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

	@Override
	public List<Admin_BrandDTO> getAdminBrand() {
		List<Admin_BrandDTO> lists = dao.getAdminBrand();
		return lists;
	}

	@Override
	public List<Admin_CategoryDTO> getAdminCategory() {
		List<Admin_CategoryDTO> lists = dao.getAdminCategory();
		return lists;
	}

	@Override
	public List<Admin_TypeDTO> getAdminType() {
		List<Admin_TypeDTO> lists = dao.getAdminType();
		return lists;
	}

	@Override
	public List<AdminView> getAdminTypeData(Map<String, Object> map) {
		List<AdminView> lists = dao.getAdminTypeData(map);
		return lists;
	}
	@Override
	public void deleteCateType(String category) {
		dao.deleteCateType(category);
		
	}

}
