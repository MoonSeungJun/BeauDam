package com.dao.otherDAO;

import java.util.*;

import com.table.memberDTO.*;
import com.table.otherDTO.*;

public interface OtherService {
	
//	insert
	void insertCoupon(CouponDTO dto);
	void insertNotification(NotificationDTO dto);
	void insertReview(ReviewDTO dto);
	void insertBasket(BasketDTO dto);
	
//	update
	void updateCoupon(HashMap<String, Object> map);
	void updateHitCount(int num);
//	delete
	void deleteBasket(HashMap<String, Object> map);
	void deleteReview(int num);
	void deleteNotification(int num);
//	select
	int getCouponCount(String id);
	CouponDTO getCouponData(String id);
	int getWeekCouponCount(String id);
	CouponDTO getWeekCouponData(String id);
	
}
