package com.dao.saleDAO;

import java.util.List;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.table.saleDTO.*;
import com.view.view.SaleView;

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

}
