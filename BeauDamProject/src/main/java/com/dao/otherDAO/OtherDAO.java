package com.dao.otherDAO;

import org.mybatis.spring.SqlSessionTemplate;

import com.table.otherDTO.ReviewDTO;

public class OtherDAO {

	SqlSessionTemplate sessiontemplate;
	
	
	public ReviewDTO reviewData(String sale_Code) {
		
		ReviewDTO dto = sessiontemplate.selectOne("beaudam.reviewData", sale_Code);
		
		return dto;
	}
	
}
