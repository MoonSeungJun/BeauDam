package com.dao.viewDAO;

import java.util.*;

import com.view.view.*;

public interface ViewService {

//	select
	List<MemberView> getAllMemberData();
	MemberView getOneMemberData(String id);
	List<MemberView> getLeaveMemberData();
	
}
