package com.dao.otherDAO;

import java.util.*;

import javax.annotation.*;

import org.springframework.stereotype.*;

import com.table.otherDTO.*;
import com.view.view.*;

@Service("otherService")
public class OtherServiceImpl implements OtherService {

	@Resource(name="otherDAO")
	private OtherDAO dao;
	
	@Override
	public void deleteAllBasket(String id) {
		dao.deleteAllBasket(id);
		
	}
	
	@Override
	public void insertCoupon(CouponDTO dto) {
		dao.insertCoupon(dto);
		
	}

	@Override
	public void insertNotification(NotificationDTO dto) {
		dao.insertNotification(dto);
		
	}

	@Override
	public void insertReview(ReviewDTO dto) {
		dao.insertReview(dto);
		
	}

	@Override
	public void insertBasket(BasketDTO dto) {
		dao.insertBasket(dto);
		
	}

	@Override
	public void updateCoupon(HashMap<String, Object> map) {
		dao.updateCoupon(map);
		
	}

	@Override
	public void updateHitCount(int num) {
		dao.updateHitCount(num);
		
	}

	@Override
	public void deleteBasket(Map<String, Object> map) {
		dao.deleteBasket(map);
		
	}

	@Override
	public void deleteReview(int num) {
		dao.deleteReview(num);
		
	}

	@Override
	public void deleteNotification(int num) {
		dao.deleteNotification(num);
		
	}

	@Override
	public int getCouponCount(String id) {
		int count = dao.getCouponCount(id);
		return count;
	}

	@Override
	public List<CouponDTO> getCouponData(String id) {
		List<CouponDTO> lists = dao.getCouponData(id);
		return lists;
	}

	@Override
	public int getWeekCouponCount(String id) {
		int count = dao.getWeekCouponCount(id);
		return count;
	}

	@Override
	public List<CouponDTO> getWeekCouponData(String id) {
		List<CouponDTO> lists = dao.getWeekCouponData(id);
		return lists;
	}

	@Override
	public List<ReviewDTO> getReviewData(String sale_Code) {
		List<ReviewDTO> lists = dao.getReviewData(sale_Code);		
		return lists;
	}

	@Override
	public void updateNotification(NotificationDTO dto) {
		dao.updateNotification(dto);
		
	}

	@Override
	public int getNotificationMaxNum() {
		int result = dao.getNotificationMaxNum();
		return result;
	}

	@Override
	public List<NotificationDTO> getNotificationAllData(int start, int end, String searchKey, String searchValue) {
		List<NotificationDTO> lists = dao.getNotificationAllData(start, end, searchKey, searchValue);
	
		return lists;
		
	}

	@Override
	public NotificationDTO getOneNotification(int num) {
		
		NotificationDTO dto = dao.getOneNotification(num);
		return dto;
	}

	@Override
	public int getNotificationCount(String searchKey, String searchValue) {
		
		int result = dao.getNotificationCount(searchKey, searchValue);
		
		return result;
	}

	public List<BasketDTO> getBasketData(String id) {
		List<BasketDTO> lists = dao.getBasketData(id);
		return lists;
	}

	public BasketDTO getBasketOneData(Map<String, Object> hm) {
		BasketDTO dto = dao.getBasketOneData(hm);
		
		return dto;
	}
	@Override
	public List<SaleView> getBestItem() {
		List<SaleView> lists = dao.getBestItem();
		return lists;
	}
	
	
}
