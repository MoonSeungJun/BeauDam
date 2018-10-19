package com.dao.saleDAO;

import javax.annotation.*;

import org.springframework.stereotype.*;

import com.table.saleDTO.*;

@Service("saleService")
public class SaleServiceImpl implements SaleService {

	@Resource(name="saleDAO")
	private SaleDAO dao;
	
	@Override
	public void insertSaleDate(Sale_DateDTO dto) {
		dao.insertSaleDate(dto);
		
	}

	@Override
	public void insertSaleProduct(Sale_ProductDTO dto) {
		dao.insertSaleProduct(dto);
		
	}

	@Override
	public void insertSaleClient(Sale_ClientDTO dto) {
		dao.insertSaleClient(dto);
		
	}

	@Override
	public void updateSaleDate(Sale_DateDTO dto) {
		dao.updateSaleDate(dto);
		
	}

}
