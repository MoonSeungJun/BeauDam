package com.dao.saleDAO;

<<<<<<< HEAD
import java.util.*;

import com.table.saleDTO.*;
import com.view.view.*;
=======
import java.util.List;

import com.table.saleDTO.*;
import com.view.view.SaleView;
>>>>>>> 1696839a53f603cd4c87c3d31c1409a1b91531e9

public interface SaleService {

//	insert
	void insertSaleDate(Sale_DateDTO dto);
	void insertSaleProduct(Sale_ProductDTO dto);
	void insertSaleClient(Sale_ClientDTO dto);
//	update
	void updateSaleDate(SaleView dto);
//	delete
//	select
<<<<<<< HEAD
	List<SaleView> getAllSaleData();
	SaleView getOneSaleData(String sale_Code);
	List<SaleView> getSearchSaleData(Map<String, Object> map);
	
=======
	List<Sale_DateDTO> getAdminDaySales();
	List<Sale_DateDTO> getAdminMonthSales(String yearSearchValue);
	List<Sale_DateDTO> getAdminYearSales();
>>>>>>> 1696839a53f603cd4c87c3d31c1409a1b91531e9
}
