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

	
	public List<ProductView> getSearchProductList(HashMap map) {
		List<ProductView> view = sessionTemplate.selectList("beaudam.getSearchProductList", map);
		return view;
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
		
		MemberView dto = sessionTemplate.selectOne("beaudam.getOneMemberData", id);
		return dto;
		
	}
	
	public String getSearchId(HashMap<String, Object> nameBirth) {
		
		String id = sessionTemplate.selectOne("beaudam.getSearchId", nameBirth);
		return id;
		
	}
	
	public String getSearchPwd(HashMap<String, Object> nameEmail) {
		
		String pwd = sessionTemplate.selectOne("beaudam.getSearchPwd", nameEmail);
		return pwd;
		
	}

	public List<ProductView> getAllproductData(HashMap<String, Object> searchPack) {
		
		List<ProductView> lists = sessionTemplate.selectList("beaudam.getAllProductData", searchPack);		
		
		return lists;
	}
	
	public ProductView getOneProductData(String code) {
		
		ProductView dto = sessionTemplate.selectOne("beaudam.getOneProductData", code);
		
		return dto;
		
	}
	
	public List<SaleView> getAllSaleView(){
		
		List<SaleView> lists = sessionTemplate.selectList("beaudam.getAllSaleView");
		
		return lists;
		
	}
	
	public SaleView getOneSaleView(String sale_Code) {
		
		SaleView dto =  sessionTemplate.selectOne("beaudam.getOneSaleView",sale_Code);
		
		return dto;

	}

	public List<MemberView> getSearchMemberData(Member_InfoDTO dto) {
		List<MemberView> searchMemberList = sessionTemplate.selectList("beaudam.getSearchMemberData",dto);
		return searchMemberList;

	}
	
	public List<ProductView> getSearchProductDataList(HashMap<String, Object> searchValuePack){
		List<ProductView> getSearchProductDataList = sessionTemplate.selectList("beaudam.getSearchProductDataList",searchValuePack);
		
		return getSearchProductDataList;
	
	}
	
	public int getSearchDataCount(HashMap<String, Object> searchCountPack) {
		int result = sessionTemplate.selectOne("beaudam.getSearchDataCount", searchCountPack);
		
		return result;
	}
	
	public ProductView getProductDataRowNum(int selectRowNum){
		
		ProductView getProductDataRowNum = sessionTemplate.selectOne("beaudam.getProductDataRowNum",selectRowNum);
		
		return getProductDataRowNum;
	
	}
	
	
	public int getBrandSearchProductDataCount(HashMap<String, Object> searchPack) {
		
		int result = sessionTemplate.selectOne("beaudam.getBrandSearchProductDataCount",searchPack);
		
		return result;
	}
	
	
	public List<ProductView> getBrandSearchProductData(HashMap<String, Object> searchPack){
		
		List<ProductView> getBrandSearchProductData = sessionTemplate.selectList("beaudam.getBrandSearchProductData",searchPack);
		
		return getBrandSearchProductData;
	}
	
	public List<SaleView> getBrandBestItems(String brand) {
		List<SaleView> getBrandBestItems = sessionTemplate.selectList("beaudam.getBrandBestItems",brand);
		return getBrandBestItems;
	}
	
	public int getPersonalSaleDataCount(String id) {
		int result = sessionTemplate.selectOne("beaudam.getPersonalSaleDataCount",id);
		
		return result;
	}
	
	public int getWeeklyPersonalSaleDataCount(String id) {
		int result = sessionTemplate.selectOne("beaudam.getWeeklyPersonalSaleDataCount",id);
		return result;
	}
	
	public int getMonthlyPersonalSaleDataCount(HashMap<String, Object> monthlySalePack) {
		int result = sessionTemplate.selectOne("beaudam.getMonthlyPersonalSaleDataCount",monthlySalePack);
		return result;
	}
	
	public int getInputDatePersonalSaleDataCount(HashMap<String, Object> inputSalePack) {
		int result = sessionTemplate.selectOne("beaudam.getInputDatePersonalSaleDataCount",inputSalePack);
		return result;
	}
	
}
