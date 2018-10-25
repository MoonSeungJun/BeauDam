package com.dao.memberDAO;


import javax.annotation.*;

import org.springframework.stereotype.*;

import com.table.memberDTO.*;


@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name="memberDAO")
	private MemberDAO dao;
	
	@Override
	public void insertMember(MemberDTO dto) {
		dao.insertMember(dto);
		
	}

	@Override
	public void insertMemberInfo(Member_InfoDTO dto) {
		dao.insertMemberInfo(dto);
		
	}

	@Override
	public void insertMemberGrade(Member_GradeDTO dto) {
		dao.insertMemberGrade(dto);
		
	}

	@Override
	public void updateMember(MemberDTO dto) {
		dao.updateMember(dto);
		
	}

	@Override
	public void updateMemberInfo(Member_InfoDTO dto) {
		dao.updateMemberInfo(dto);
		
	}

	@Override
	public void updateMemberGrade(Member_GradeDTO dto) {
		dao.updateMemberGrade(dto);
		
	}

	@Override
	public void updateIsLeave(String id) {
		dao.updateIsLeave(id);
		
	}

	@Override
	public void deleteMember(String id) {
		dao.deleteMember(id);
		
	}

	@Override
	public void deleteMemberGrade(String id) {
		dao.deleteMemberGrade(id);
		
	}

	@Override
	public void deleteMemberInfo(String id) {
		dao.deleteMemberInfo(id);
		
	}

	@Override
	public void deleteCoupon(String id) {
		dao.deleteCoupon(id);
		
	}

	
	
	
}
