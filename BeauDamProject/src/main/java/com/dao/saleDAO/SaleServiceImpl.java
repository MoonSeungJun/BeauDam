package com.dao.saleDAO;

<<<<<<< HEAD
import java.util.*;
=======
import java.util.List;
>>>>>>> 1696839a53f603cd4c87c3d31c1409a1b91531e9

import javax.annotation.*;

import org.springframework.stereotype.*;

import com.table.saleDTO.*;
<<<<<<< HEAD
import com.view.view.*;
=======
import com.view.view.SaleView;
>>>>>>> 1696839a53f603cd4c87c3d31c1409a1b91531e9

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
<<<<<<< HEAD
	public List<SaleView> getAllSaleData() {
		List<SaleView> lists = dao.getAllSaleData();
=======
	public List<Sale_DateDTO> getAdminDaySales() {
		
		List<Sale_DateDTO> lists = dao.getAdminDaySales();
		
>>>>>>> 1696839a53f603cd4c87c3d31c1409a1b91531e9
		return lists;
	}

	@Override
<<<<<<< HEAD
	public SaleView getOneSaleData(String sale_Code) {
		SaleView dto = dao.getOneSaleData(sale_Code);
		return dto;
	}

	@Override
	public List<SaleView> getSearchSaleData(Map<String, Object> map) {
		List<SaleView> lists = dao.getSearchSaleData(map);
		return lists;
	}


	
	

=======
	public List<Sale_DateDTO> getAdminMonthSales(String yearSearchValue) {
		List<Sale_DateDTO> lists = dao.getAdminMonthSales(yearSearchValue);
		
		return lists;
	}

	@Override
	public List<Sale_DateDTO> getAdminYearSales() {
		List<Sale_DateDTO> lists = dao.getAdminYearSales();
		
		return lists;
	}

>>>>>>> 1696839a53f603cd4c87c3d31c1409a1b91531e9
}
