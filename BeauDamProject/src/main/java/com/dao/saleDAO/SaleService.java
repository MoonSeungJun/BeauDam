package com.dao.saleDAO;

import java.util.*;

import com.table.saleDTO.*;
import com.view.view.*;

public interface SaleService {

//	insert
	void insertSaleDate(Sale_DateDTO dto);
	void insertSaleProduct(Sale_ProductDTO dto);
	void insertSaleClient(Sale_ClientDTO dto);
//	update
	void updateSaleDate(SaleView dto);
//	delete
//	select
	List<SaleView> getAllSaleData();
	SaleView getOneSaleData(String sale_Code);
	List<SaleView> getSearchSaleData(Map<String, Object> map);
	
}
