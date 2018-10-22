package com.dao.viewDAO;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import com.table.memberDTO.*;
import com.view.view.*;

@Repository("viewDAO")
public class ViewDAO {

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception {
		this.sessionTemplate = sessionTemplate;		
	}
	
	
	public List<MemberView> getAllMemberData() {
		
		List<MemberView> lists = sessionTemplate.selectList("beaudam.getAllMemberData");
		
		return lists;		
		
	}
	
	public List<MemberView> getLeaveMemberData() {
		
		List<MemberView> lists = sessionTemplate.selectList("beaudam.getLeaveMemberData");
		return lists;
		
	}
	
	public MemberView getOneMemberData(String id) {
		
		MemberView dto = sessionTemplate.selectOne("beaudam.getOneMemberData");
		return dto;
		
	}
	
	public List<ProductView> getAllproductData(HashMap<String, Object> searchPack) {
		
		List<ProductView> lists = sessionTemplate.selectList("beaudam.getAllProductData", searchPack);		
		
		return lists;
	}
	
	public ProductView getOneProductData(String code) {
		
		ProductView dto = sessionTemplate.selectOne("beaudam.getOneProductData", code);
		
		return dto;
		
	}
	
	public List<SaleView> getAllSaleView(HashMap<String, Object> saleSearchPack){
		
		List<SaleView> lists = sessionTemplate.selectList("beaudam.getAllSaleView", saleSearchPack);
		
		return lists;
		
	}
	
	public SaleView getOneSaleView(String sale_Code) {
		
		SaleView dto =  sessionTemplate.selectOne("beaudam.getOneSaleView",sale_Code);
		
		return dto;
		
	}
	
		
	public List<ProductView> getAllProductData(HashMap<String, Object> searchPack) {
		// TODO Auto-generated method stub
		return null;
	}

	 
	
	 
	public List<SaleView> getAllSaleData(HashMap<String, Object> saleSearchPack) {
		// TODO Auto-generated method stub
		return null;
	}

	 
	public List<MemberView> getSearchMemberData(Member_InfoDTO dto) {
		List<MemberView> searchMemberList = sessionTemplate.selectList("beaudam.getSearchMemberData",dto);
		return searchMemberList;

	}
	
	
	
}
