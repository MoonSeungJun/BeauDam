package com.dao.viewDAO;

import java.util.*;

import com.table.memberDTO.*;
import com.view.view.*;

public interface ViewService {

//	select
	List<MemberView> getAllMemberData();
	MemberView getOneMemberData(String id);
	List<MemberView> getLeaveMemberData();
	List<ProductView> getAllProductData(HashMap<String, Object> searchPack);
	ProductView getOneProductData(String code);

	List<SaleView> getAllSaleView(HashMap<String, Object> saleSearchPack);
	SaleView getOneSaleView(String sale_Code);

	List<MemberView> getSearchMemberData(Member_InfoDTO dto);

		
}
