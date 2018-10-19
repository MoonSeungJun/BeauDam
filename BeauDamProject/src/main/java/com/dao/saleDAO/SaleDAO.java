package com.dao.saleDAO;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.table.saleDTO.*;

@Repository("saleDAO")
public class SaleDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	public void insertSaleDate(Sale_DateDTO dto) {
		sessionTemplate.insert("beaudam.insertSaleDate",dto);
	}

	public void insertSaleProduct(Sale_ProductDTO dto) {
		sessionTemplate.insert("beaudam.insertSaleProduct",dto);

	}

	public void insertSaleClient(Sale_ClientDTO dto) {
		sessionTemplate.insert("beaudam.insertSaleClient",dto);

	}

	public void updateSaleDate(Sale_DateDTO dto) {
		sessionTemplate.update("beaudam.updateSaleDate", dto);

	}

}
