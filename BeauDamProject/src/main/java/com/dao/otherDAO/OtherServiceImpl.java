package com.dao.otherDAO;

import java.util.*;

import javax.annotation.*;

import org.springframework.stereotype.*;

import com.table.memberDTO.*;
import com.table.otherDTO.*;

@Service("otherService")
public class OtherServiceImpl implements OtherService {

	@Resource(name="otherDAO")
	private OtherDAO dao;
	
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
	public void deleteBasket(HashMap<String, Object> map) {
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


}
