package com.dao.otherDAO;

import java.util.*;

import org.springframework.stereotype.*;

import com.table.memberDTO.*;
import com.table.otherDTO.*;

@Service("otherService")
public class OtherServiceImpl implements OtherService {

	@Override
	public void insertCoupon(CouponDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertNotification(NotificationDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertReview(ReviewDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertBasket(BasketDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCoupon(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateHitCount(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBasket(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReview(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteNotification(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getCouponCount(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CouponDTO getCouponData(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getWeekCouponCount(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CouponDTO getWeekCouponData(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
