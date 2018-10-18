package com.dao.viewDAO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.view.view.ProductView;
import com.view.view.SaleView;






public class ViewDAO {

	SqlSessionTemplate sessiontemplate;
	

	public List<ProductView> getllAllProductData(HashMap<String, Object>searchPack){
						
		List<ProductView> lists = sessiontemplate.selectList("beaudam.getAllProduct",searchPack);
				
		return lists;
	}
	
	public ProductView getOneProductData(String code) {
		
		ProductView dto = sessiontemplate.selectOne("beaudam.getOneProductData",code);
		
		return dto;
		
	}
	
	public List<SaleView> getAllSaleData(HashMap<String, Object> saleSearchPack){
	
		List<SaleView> lists = sessiontemplate.selectList("beaudam.getAllSaleView",saleSearchPack);
	
		return lists;
	
	}
	
	public SaleView getOneSaleCode(String sale_Code) {
		
			
		SaleView dto = sessiontemplate.selectOne("beaudam.getOneSaleView", sale_Code);
		
		return dto;
		
		
	}
	
}
