package com.dao.saleDAO;


import java.util.*;
import com.table.saleDTO.*;
import com.view.view.SaleView;


public interface SaleService {

//	insert
	void insertSaleDate(Sale_DateDTO dto);
	void insertSaleProduct(Sale_ProductDTO dto);
	void insertSaleClient(Sale_ClientDTO dto);
//	update
	void updateSaleDate(SaleView dto);
//	delete
//	select
	String getMaxSaleCode();
	List<SaleView> getAllSaleData();
	SaleView getOneSaleData(String sale_Code);
	List<SaleView> getSearchSaleData(Map<String, Object> salesSearchKeyPack);
	List<Sale_DateDTO> getAdminDaySales();
	List<Sale_DateDTO> getAdminMonthSales(HashMap<String, Object>yearSearchPack);
    List<Sale_DateDTO> getAdminYearSales();
    List<Sale_DateDTO> getSalesYears();
    List<SaleView> getPersonalSaleData(String id);
}
