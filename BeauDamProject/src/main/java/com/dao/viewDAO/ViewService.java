package com.dao.viewDAO;

import java.util.*;

import com.table.memberDTO.*;
import com.view.view.*;

public interface ViewService {

//	select
	List<MemberView> getAllMemberData();
	MemberView getOneMemberData(String id);
	String getSearchId(HashMap<String, Object> nameBirth);
	String getSearchPwd(HashMap<String, Object> nameEmail);
	List<MemberView> getLeaveMemberData();
	List<ProductView> getAllProductData(HashMap<String, Object> searchPack);
	ProductView getOneProductData(String code);
	List<SaleView> getAllSaleView();
	SaleView getOneSaleView(String sale_Code);
	List<MemberView> getSearchMemberData(Member_InfoDTO dto);
	List<ProductView> getSearchProductDataList(HashMap<String, Object> searchValuePack);
	List<ProductView> getSearchProductList(HashMap map);
	
	int getSearchDataCount(HashMap<String, Object> searchCountPack);
	ProductView getProductDataRowNum(int selectRowNum);
	int getBrandSearchProductDataCount(HashMap<String, Object> searchPack);
	List<ProductView> getBrandSearchProductData(HashMap<String, Object> searchPack);
	List<SaleView> getBrandBestItems(String brand);
	int getPersonalSaleDataCount(String id);
	int getWeeklyPersonalSaleDataCount(String id);
	int getMonthlyPersonalSaleDataCount(HashMap<String, Object> monthlySalePack);
	int getInputDatePersonalSaleDataCount(HashMap<String, Object> inputSalePack);
}
