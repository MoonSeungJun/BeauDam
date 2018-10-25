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
	void updateNotification(NotificationDTO dto);
//	delete
	void deleteBasket(HashMap<String, Object> map);
	void deleteReview(int num);
	void deleteNotification(int num);
//	select
	int getCouponCount(String id);
	List<CouponDTO> getCouponData(String id);
	int getWeekCouponCount(String id);
	List<CouponDTO> getWeekCouponData(String id);
	List<ReviewDTO> getReviewData (String sale_Code);
	int getNotificationMaxNum();
	List<NotificationDTO> getNotificationAllData(int start,int end,String searchKey,String searchValue);
	public NotificationDTO getOneNotification(int num);
	int getNotificationCount(String searchKey,String searchValue);
}
