package com.dao.saleDAO;

import com.table.saleDTO.*;

public interface SaleService {

//	insert
	void insertSaleDate(Sale_DateDTO dto);
	void insertSaleProduct(Sale_ProductDTO dto);
	void insertSaleClient(Sale_ClientDTO dto);
//	update
	void updateSaleDate(Sale_DateDTO dto);
//	delete
//	select
	
	
}
