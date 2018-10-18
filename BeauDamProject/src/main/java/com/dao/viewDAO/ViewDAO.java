package com.dao.viewDAO;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.stereotype.*;

import com.view.view.*;

@Repository("viewDAO")
public class ViewDAO {

	
	private SqlSessionTemplate sessionTemplate;
	
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception {
		this.sessionTemplate = sessionTemplate;		
	}
	
	
	public List<MemberView> getAllMemberData() {
		
		List<MemberView> lists = sessionTemplate.selectList("beaudam.getAllMemberData");
		
		return lists;		
		
	}
	
	public List<MemberView> getLeaveMemberData() {
		
		List<MemberView> lists = sessionTemplate.selectList("beaudam.getLeaveMemberData");
		return lists;
		
	}
	
	public MemberView getOneMemberData(String id) {
		
		MemberView dto = sessionTemplate.selectOne("beaudam.getOneMemberData");
		return dto;
		
	}
	
}
