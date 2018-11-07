package com.dao.otherDAO;

import java.util.*;

import com.table.memberDTO.*;
import com.table.otherDTO.*;
import com.view.view.*;

public interface OtherService {
	
//	insert
	void insertCoupon(CouponDTO dto);
	void insertNotification(NotificationDTO dto);
	void insertReview(ReviewDTO dto);
	void insertBasket(BasketDTO dto);
	
//	update
	void updateCoupon(int num);
	void updateHitCount(int num);
	void updateNotification(NotificationDTO dto);

//	delete
	void deleteBasket(Map<String, Object> map);
	void deleteReview(int num);
	void deleteNotification(int num);
	void deleteAllBasket(String id);
	
//	select
	int getCouponCount(String id);
	List<CouponDTO> getCouponData(String id);
	int getWeekCouponCount(String id);
	List<CouponDTO> getWeekCouponData(String id);
	List<ReviewDTO> getReviewData (String code);

	int getNotificationMaxNum();
	List<NotificationDTO> getNotificationAllData(int start,int end,String searchKey,String searchValue);
	public NotificationDTO getOneNotification(int num);
	int getNotificationCount(String searchKey,String searchValue);
	List<BasketDTO> getBasketData(String id);
	BasketDTO getBasketOneData(Map<String, Object> hm);
	String selectCouponData(int couponNum);
	List<SaleView> getBestItem();
	int getNotificationRowNum();
	
}
