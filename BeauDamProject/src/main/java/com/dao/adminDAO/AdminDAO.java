package com.dao.adminDAO;

import org.mybatis.spring.*;
import org.springframework.stereotype.*;

import com.table.adminDTO.*;

@Repository("adminDAO")
public class AdminDAO {
	
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
	
}
