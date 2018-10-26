package com.dao.memberDAO;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.table.memberDTO.*;



@Repository("memberDAO")
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	public void insertMember(MemberDTO dto) {
		sessionTemplate.insert("beaudam.insertMember", dto);
	}
	
	public void insertMemberInfo(Member_InfoDTO dto) {
		sessionTemplate.insert("beaudam.insertMemberInfo",dto);
	}
	
	public void insertMemberInfoEX(Member_InfoDTO dto) {
		sessionTemplate.insert("beaudam.insertMemberInfoEX",dto);
	}
	
	public void insertMemberGrade(Member_GradeDTO dto) {
		sessionTemplate.insert("beaudam.insertMemberGrade", dto);
	}
	
	public void updateMember(MemberDTO dto) {
		sessionTemplate.update("beaudam.updateMember", dto);
	}
	
	public void updateMemberInfo(Member_InfoDTO dto) {
		sessionTemplate.update("beaudam.updateMemberInfo",dto);
	}
	
	public void updateMemberGrade(Member_GradeDTO dto) {
		sessionTemplate.update("beaudam.updateMemberGrade", dto);
	}
	
	public void updateIsLeave(String id) {
		sessionTemplate.update("beaudam.updateIsLeave",id);
	}
	
	public void deleteMember(String id) {
		sessionTemplate.delete("beaudam.deleteMember",id);
		
	}

	public void deleteMemberGrade(String id) {
		sessionTemplate.delete("beaudam.deleteMemberGrade",id);
		
	}


	public void deleteMemberInfo(String id) {
		sessionTemplate.delete("beaudam.deleteMemberInfo",id);
		
	}

	public void deleteCoupon(String id) {
		sessionTemplate.delete("beaudam.deleteCoupon",id);
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
