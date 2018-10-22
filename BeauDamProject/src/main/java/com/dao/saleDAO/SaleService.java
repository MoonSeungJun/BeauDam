package com.dao.saleDAO;

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
	
	
	
}
