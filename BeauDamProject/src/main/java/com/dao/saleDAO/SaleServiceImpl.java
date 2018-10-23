package com.dao.saleDAO;

import java.util.List;

import javax.annotation.*;

import org.springframework.stereotype.*;

import com.table.saleDTO.*;
import com.view.view.SaleView;

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
	public void updateSaleDate(SaleView dto) {
		dao.updateSaleDate(dto);
		
	}

	@Override
	public List<Sale_DateDTO> getAdminDaySales() {
		
		List<Sale_DateDTO> lists = dao.getAdminDaySales();
		
		return lists;
	}

	@Override
	public List<Sale_DateDTO> getAdminMonthSales(String yearSearchValue) {
		List<Sale_DateDTO> lists = dao.getAdminMonthSales(yearSearchValue);
		
		return lists;
	}

	@Override
	public List<Sale_DateDTO> getAdminYearSales() {
		List<Sale_DateDTO> lists = dao.getAdminYearSales();
		
		return lists;
	}

}
