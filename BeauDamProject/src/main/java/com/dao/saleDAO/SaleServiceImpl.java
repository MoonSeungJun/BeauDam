package com.dao.saleDAO;


import java.util.*;
import javax.annotation.*;
import org.springframework.stereotype.*;
import com.table.saleDTO.*;
import com.view.view.*;




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
	public List<SaleView> getAllSaleData() {
		List<SaleView> lists = dao.getAllSaleData();
		return lists;
	}

	@Override
	public SaleView getOneSaleData(String sale_Code) {
		SaleView dto = dao.getOneSaleData(sale_Code);
		return dto;
	}

	@Override
	public List<SaleView> getSearchSaleData(Map<String, Object> map) {
		List<SaleView> lists = dao.getSearchSaleData(map);
		return lists;
	}

}
