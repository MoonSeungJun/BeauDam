package com.dao.otherDAO;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.table.memberDTO.*;
import com.table.otherDTO.*;

@Repository("otherDAO")
public class OtherDAO {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	
	
	public void insertCoupon(CouponDTO dto) {
		sessionTemplate.insert("beaudam.insertCoupon",dto);
		
	}

	 
	public void insertNotification(NotificationDTO dto) {
		sessionTemplate.insert("beaudam.insertNotification",dto);
		
	}

	 
	public void insertReview(ReviewDTO dto) {
		sessionTemplate.insert("beaudam.insertReview",dto);
		
	}

	 
	public void insertBasket(BasketDTO dto) {
		sessionTemplate.insert("beaudam.insertBasket",dto);
		
	}

	 
	public void updateCoupon(HashMap<String, Object> map) {
		sessionTemplate.update("beaudam.updateCoupon",map);
		
	}

	 
	public void updateHitCount(int num) {
		sessionTemplate.update("beaudam.updateHitCount",num);
		
	}

	 
	public void deleteBasket(HashMap<String, Object> map) {
		sessionTemplate.delete("beaudam.deleteBasket",map);
		
	}

	 
	public void deleteReview(int num) {
		sessionTemplate.delete("beaudam.deleteReview",num);
		
	}

	 
	public void deleteNotification(int num) {
		sessionTemplate.delete("beaudam.deleteNotification",num);
		
	}

	 
	public int getCouponCount(String id) {
		int couponCount = sessionTemplate.selectOne("beaudam.getCouponCount", id);
		return couponCount;
	}

	 
	public List<CouponDTO> getCouponData(String id) {
		List<CouponDTO> lists = sessionTemplate.selectList("beaudam.getCountData", id);
		return lists;
	}

	 
	public int getWeekCouponCount(String id) {
		int couponCount = sessionTemplate.selectOne("beaudam.getWeekCouponCount",id);
		return couponCount;
	}

	 
	public List<CouponDTO> getWeekCouponData(String id) {
		List<CouponDTO> lists = sessionTemplate.selectList("beaudam.getWeekCouponData",id);
		return lists;
	}
	
	public ReviewDTO reviewData(String sale_Code) {
		
		ReviewDTO dto = sessionTemplate.selectOne("beaudam.reviewData", sale_Code);
		
		return dto;
	}
	
	
}
