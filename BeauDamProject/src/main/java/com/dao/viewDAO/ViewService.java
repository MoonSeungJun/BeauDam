package com.dao.viewDAO;

import java.util.*;

import com.view.view.*;

public interface ViewService {

//	select
	List<MemberView> getAllMemberData();
	MemberView getOneMemberData(String id);
	List<MemberView> getLeaveMemberData();
	List<ProductView> getllAllProductData(HashMap<String, Object> searchPack);
	ProductView getOneProductData(String code);
	List<SaleView> getAllSaleData(HashMap<String, Object> saleSearchPack);
	SaleView getOneSaleCode(String sale_Code);
		
}
