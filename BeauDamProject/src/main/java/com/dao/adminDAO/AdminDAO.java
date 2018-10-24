package com.dao.adminDAO;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.table.adminDTO.*;
import com.view.view.*;


@Repository("adminDAO")
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception {
		this.sessionTemplate = sessionTemplate;		
	}
	
	public void insertAdminBrand(Admin_BrandDTO dto) {			
		sessionTemplate.insert("beaudam.insertAdminBrand", dto);		
	}
	
	public void insertAdminCategory(Admin_CategoryDTO dto) {
		sessionTemplate.insert("beaudam.insertAdminCategory",dto);
	}
	
	public void insertAdminType(Admin_TypeDTO dto) {
		sessionTemplate.insert("beaudam.insertAdminType",dto);
	}
	
	public void deleteAdminBrand(String brand) {
		sessionTemplate.delete("beaudam.deleteAdminBrand", brand);
	}
	
	public void deleteAdminCategory(String category) {
		sessionTemplate.delete("beaudam.deleteAdminCategory",category);
	}
	
	public void deleteAdminType(String type) {
		sessionTemplate.delete("beaudam.deleteAdminType",type);
	}
	

	public List<Admin_BrandDTO> getAdminBrand() {
		List<Admin_BrandDTO> lists = sessionTemplate.selectList("beaudam.getAdminBrand");
		return lists;
	}

	
	public List<Admin_CategoryDTO> getAdminCategory() {
		List<Admin_CategoryDTO> lists = sessionTemplate.selectList("beaudam.getAdminCategory");
		return lists;
	}

	
	public List<Admin_TypeDTO> getAdminType() {
		List<Admin_TypeDTO> lists = sessionTemplate.selectList("beaudam.getAdminType");
		return lists;
	}	
	
	public List<AdminView> getAdminTypeData(Map<String, Object> map) {
		List<AdminView> lists = sessionTemplate.selectList("beaudam.getAdminTypeData",map);
		return lists;
	}
	
}
