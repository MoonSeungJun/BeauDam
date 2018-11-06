package com.dao.saleDAO;


import java.util.*;

import org.apache.commons.logging.impl.SLF4JLocationAwareLog;
import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.table.saleDTO.*;

import com.view.view.*;

@Repository("saleDAO")
public class SaleDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	public List<SaleView> getPersonalSaleData(String id) {
		List<SaleView> view = sessionTemplate.selectList("beaudam.getPersonalSaleData", id);
		return view;
	}
	
	
	
	public String getMaxSaleCode() {
		String str = sessionTemplate.selectOne("beaudam.getMaxSaleCode");
		return str;
	}
	
	public void insertSaleDate(Sale_DateDTO dto) {
		sessionTemplate.insert("beaudam.insertSaleDate",dto);
	}

	public void insertSaleProduct(Sale_ProductDTO dto) {
		sessionTemplate.insert("beaudam.insertSaleProduct",dto);

	}

	public void insertSaleClient(Sale_ClientDTO dto) {
		sessionTemplate.insert("beaudam.insertSaleClient",dto);

	}

	public void updateSaleDate(SaleView dto) {
		sessionTemplate.update("beaudam.updateSaleDate", dto);

	}	
	
	public List<SaleView> getAllSaleData() {
		List<SaleView> lists = sessionTemplate.selectList("beaudam.getAllSaleData");
		return lists;
	}

	
	public SaleView getOneSaleData(String sale_Code) {
		SaleView dto = sessionTemplate.selectOne("beaudam.getOneSaleData",sale_Code);
		return dto;
	}

	
	public List<SaleView> getSearchSaleData(Map<String, Object> salesSearchKeyPack) {
		List<SaleView> lists = sessionTemplate.selectList("beaudam.getSearchSaleData",salesSearchKeyPack);
		return lists;
	}
	
	public List<Sale_DateDTO> getAdminDaySales() {
		List<Sale_DateDTO> lists = sessionTemplate.selectList("beaudam.getAdminDaySales");
		return lists;
	}
	
	public List<Sale_DateDTO> getAdminMonthSales(HashMap<String, Object> yearSearchPack){
		List<Sale_DateDTO> lists = sessionTemplate.selectList("beaudam.getAdminMonthSales",yearSearchPack);
		
		return lists;
	}
	public List<Sale_DateDTO> getAdminYearSales(){
		List<Sale_DateDTO> lists = sessionTemplate.selectList("beaudam.getAdminYearSales");
		
		return lists;
	}
	
	public List<Sale_DateDTO> getSalesYears() {
		List<Sale_DateDTO> lists = sessionTemplate.selectList("beaudam.getSalesYears");
		
		return lists;
	}
	
	public List<SaleView> getWeekPersonalSaleData(String id){
		List<SaleView> view = sessionTemplate.selectList("beaudam.getWeekPersonalSaleData", id);
		return view;	
	}
	
	public List<SaleView> getMonthPersonalSaleData(HashMap<String, Object> monthRange){
		List<SaleView> view = sessionTemplate.selectList("beaudam.getMonthPersonalSaleData", monthRange);
		return view;	
	}
	
	public List<SaleView> getInputDatePersonalSaleData(HashMap<String, Object> inputDateRange){
		List<SaleView> view = sessionTemplate.selectList("beaudam.getInputDatePersonalSaleData", inputDateRange);
		return view;	
	}

	
}
