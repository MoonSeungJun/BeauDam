package com.dao.viewDAO;

import java.util.*;

import javax.annotation.*;

import org.springframework.stereotype.*;

import com.table.memberDTO.*;
import com.view.view.*;

@Service("viewService")
public class ViewServiceImpl implements ViewService {

	@Resource(name="viewDAO")
	private ViewDAO dao;
	
	@Override
	public List<MemberView> getAllMemberData() {
		List<MemberView> lists =  dao.getAllMemberData();
		return lists;
	}

	@Override
	public MemberView getOneMemberData(String id) {
		MemberView dto = dao.getOneMemberData(id);
		return dto;
	}

	@Override
	public List<MemberView> getLeaveMemberData() {
		List<MemberView> lists = dao.getLeaveMemberData();
		return lists;
	}

	@Override
	public List<ProductView> getAllProductData(HashMap<String, Object> searchPack) {
		List<ProductView> lists = dao.getAllproductData(searchPack);
		
		return lists;
	}

	@Override
	public ProductView getOneProductData(String code) {
		ProductView dto = dao.getOneProductData(code);
		return dto;
	}


	@Override
	public SaleView getOneSaleView(String sale_Code) {
		SaleView dto = dao.getOneSaleView(sale_Code);
		
		return dto;
		
	}

	@Override
	public List<MemberView> getSearchMemberData(Member_InfoDTO dto) {
		List<MemberView> searchMemberList = dao.getSearchMemberData(dto);
		return searchMemberList;
	}

	@Override
	public List<SaleView> getAllSaleView(HashMap<String, Object> saleSearchPack) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SaleView> getAllSaleData(HashMap<String, Object> saleSearchPack) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
