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
	public List<SaleView> getPersonalSaleData(String id) {
		List<SaleView> view = dao.getPersonalSaleData(id);
		return view;
	}
	@Override
	public List<SaleView> getPersonalAllSaleData(HashMap<String, Object> searchSalePack) {
		List<SaleView> view = dao.getPersonalAllSaleData(searchSalePack);
		return view;
	}
	
	@Override
	public String getMaxSaleCode() {
		String str = dao.getMaxSaleCode();
		return str;
	}
	
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
	public List<SaleView> getSearchSaleData(Map<String, Object> salesSearchKeyPack) {
		List<SaleView> lists = dao.getSearchSaleData(salesSearchKeyPack);
		return lists;
	}

	@Override
	public List<Sale_DateDTO> getAdminDaySales() {
		List<Sale_DateDTO> lists = dao.getAdminDaySales();
		return lists;
	}


	@Override
	public List<Sale_DateDTO> getAdminMonthSales(HashMap<String, Object> yearSearchPack) {
		List<Sale_DateDTO> lists = dao.getAdminMonthSales(yearSearchPack);
		return lists;
	}	

	@Override
	public List<Sale_DateDTO> getAdminYearSales() {
		List<Sale_DateDTO> lists = dao.getAdminYearSales();
		return lists;
	}

	@Override
	public List<Sale_DateDTO> getSalesYears() {
		List<Sale_DateDTO> lists = dao.getSalesYears();
		return lists;
	}

	@Override
	public List<SaleView> getWeekPersonalSaleData(HashMap<String, Object> weekRange) {
		List<SaleView> view = dao.getWeekPersonalSaleData(weekRange);
		return view;
	}

	@Override
	public List<SaleView> getMonthPersonalSaleData(HashMap<String, Object> monthRange) {
		List<SaleView> view = dao.getMonthPersonalSaleData(monthRange);
		return view;
	}

	@Override
	public List<SaleView> getInputDatePersonalSaleData(HashMap<String, Object> inputDateRange) {
		List<SaleView> view = dao.getInputDatePersonalSaleData(inputDateRange);
		return view;
	}

	
	

}
