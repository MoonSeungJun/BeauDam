package com.dao.saleDAO;

<<<<<<< HEAD
import java.util.*;
=======
import java.util.List;
>>>>>>> 1696839a53f603cd4c87c3d31c1409a1b91531e9

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.table.saleDTO.*;
<<<<<<< HEAD
import com.view.view.*;
=======
import com.view.view.SaleView;
>>>>>>> 1696839a53f603cd4c87c3d31c1409a1b91531e9

@Repository("saleDAO")
public class SaleDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
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
	
<<<<<<< HEAD
	
	
	public List<SaleView> getAllSaleData() {
		List<SaleView> lists = sessionTemplate.selectList("beaudam.getAllSaleData");
		return lists;
	}

	
	public SaleView getOneSaleData(String sale_Code) {
		SaleView dto = sessionTemplate.selectOne("beaudam.getOneSaleData",sale_Code);
		return dto;
	}

	
	public List<SaleView> getSearchSaleData(Map<String, Object> map) {
		List<SaleView> lists = sessionTemplate.selectList("beaudam.getSearchSaleData",map);
		return lists;
	}

=======
	public List<Sale_DateDTO> getAdminDaySales(){
		List<Sale_DateDTO> lists = sessionTemplate.selectList("beaudam.getAdminDaySales");
		return lists;
	}
	
	public List<Sale_DateDTO> getAdminMonthSales(String yearSearchValue){
		List<Sale_DateDTO> lists = sessionTemplate.selectList("beaudam.getAdminMonthSales");
		return lists;
	}

	public List<Sale_DateDTO> getAdminYearSales(){
		List<Sale_DateDTO> lists = sessionTemplate.selectList("beaudam.getAdminYearSales");
		return lists;
	}
>>>>>>> 1696839a53f603cd4c87c3d31c1409a1b91531e9

}
