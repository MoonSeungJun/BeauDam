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
}
