package com.dao.viewDAO;

import java.util.*;

import javax.annotation.*;

import org.springframework.stereotype.*;

import com.view.view.*;

@Service("viewService")
public class ViewServiceImpl implements ViewService {

	@Resource(name="viewDAO")
	private ViewDAO dao;
	
	@Override
	public List<MemberView> getAllMemberData() {
		List<MemberView> lists =  dao.getAllMemberData();
		return lists;
	}

	@Override
	public MemberView getOneMemberData(String id) {
		MemberView dto = dao.getOneMemberData(id);
		return dto;
	}

	@Override
	public List<MemberView> getLeaveMemberData() {
		List<MemberView> lists = dao.getLeaveMemberData();
		return lists;
	}

}
