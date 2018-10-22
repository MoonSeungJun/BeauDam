package com.dao.saleDAO;

import java.util.List;

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
	List<Sale_DateDTO> getAdminDaySales();
	List<Sale_DateDTO> getAdminMonthSales();
	List<Sale_DateDTO> getAdminYearSales();
}
