package com.exe.beaudam;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

/*
 * 	쿼리 insert, delete 테이블 순서
 * 	
 * 	insert 할 때
 * 	member - member_Info - member_grade - coupon
 * 	product - brand - img - color - basket  
 * 	admin테이블 - brand
 * 	delete 할 때 insert 역순
 * 	
 * 
 * 	리뷰 delete 할 때 sale_code로 id 검증 후 삭제 시킬 것
 * 	
 * 	notification delete는 num만 있으면 삭제 되므로 관리자 계정일 때만
 * 	삭제버튼 활성화	
 * 
 * 	DB insert 필독
 * 	디폴트 값이 있어 추가하지 않아도 되는 데이터
 * 	
 * 	Member 관련 컬럼
 * 	- isLeave, created, pay, grade, point, num, period, use_date
 * 
 * 	Sale 관련 컬럼
 * 	- saleDate, pay_status, delivery_status
 * 
 * 	Notificaiton 관련 컬럼
 * 	- num, id, hitCount, created
 * 
 * 	Review 관련 컬럼
 *  - created  
 *
 *	DB update 필독
 *	파라미터 타입이 다들 다르니 사용 전 사용할 Mapper를 확인할 것
 *
 */
@Controller
public class CustomCenterController {

	
	
	// ********************** Customer Center Page **********************

	// 고객센터 default 페이지
	@RequestMapping(value = "/faq.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String faq() {

		// FAQ 페이지 이동
		return "customerCenter/faq";
	}

	@RequestMapping(value = "/inquire.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String inquire() {

		// 1:1문의 페이지 이동
		return "customerCenter/inquire";
	}

	@RequestMapping(value = "/notification.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String notification() {

		// 공지사항 페이지 이동
		return "customerCenter/notification";
	}

	
	
}
