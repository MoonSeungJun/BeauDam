package com.dao.memberDAO;

import java.util.*;

import com.table.memberDTO.*;
import com.view.view.*;

public interface MemberService {

//	insert
	void insertMember(MemberDTO dto);
	void insertMemberInfo(Member_InfoDTO dto);
	void insertMemberGrade(Member_GradeDTO dto);	
	
//	update
	void updateMember(MemberDTO dto);
	void updateMemberInfo(Member_InfoDTO dto);
	void updateMemberGrade(Member_GradeDTO dto);
	void updateIsLeave(String id);
	
//	delete

	
}
