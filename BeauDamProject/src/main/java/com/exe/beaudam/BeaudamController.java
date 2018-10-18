package com.exe.beaudam;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*
 *  1. method mapping을 다 기본적으로 get, post 모두 설정해뒀음
 *   -> 그냥 냅두지말고 필요에 따라 get, post, get/post 중 사용할 방식 선택해서 세팅할 것
 *   
 *  2. return 형식을 다 String을 기본으로 세팅
 *   -> ModelandView로 변환하여 사용해도 무방
 *  
 *  3. jsp파일은 각각 해당하는 폴더에 생성하기
 *   -> 해당 폴더는 컨트롤러에 *표시된 주석 참조
 *   -> views/해당폴더/~.jsp
 *   -> jsp파일명은 return값에 써져있는 이름과 똑같이 만들기
 *   
 *  4. 각자 맡은 페이지에 자신의 이름 주석 달아놓기
 *  
 *  5. image파일은 resources의 image의 해당하는 폴더에 맡은 페이지 폴더 생성하여 그 폴더에 넣을 것
 *   -> resources/image/해당 폴더(*표시)/폴더(페이지명)/~.jpg
 *   -> 폴더명은 3번과 같이 자신의 페이지명과 똑같이 할 것
 *   -> 이미지명은 어떤 용도의 이미지인지 알 수 있도록 지을 것
 *   
 *  6. css파일은 resources의 css의 해당하는 폴더에 맡은 페이지 폴더 생성하여 그 폴더에 넣을 것
 *   -> resources/css/해당 폴더(*표시)/폴더(페이지명)/~.css
 *   -> 폴더명은 3번과 같이 자신의 페이지명과 똑같이 할 것
 *   -> css명은 어떤 용도의 이미지인지 알 수 있도록 지을 것
 */

@Controller
public class BeaudamController {

	
	
	
	
	
	
	// ********************** Beaudam Page **********************
	
	@RequestMapping(value = "/login.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(HttpServletRequest request) {

		// 로그인 정보 받아오기
		String id = request.getParameter("id");

		// 로그인 정보 체크
		if (id != null) {
			return "beaudam/main";
		}

		// 로그인 페이지 이동
		return "beaudam/login";
	}

	@RequestMapping(value = "/newUser.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String newUser() {

		// 회원가입 페이지 이동
		return "beaudam/newUser";
	}

	@RequestMapping(value = "/main.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String main() {

		// 메인 페이지 이동
		return "beaudam/main";
	}
	
	@RequestMapping(value = "/mainTop.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainTop() {

		// 메인 페이지 이동
		return "beaudam/mainTop";
	}
	
	@RequestMapping(value = "/mainBottom.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainBottom() {

		// 메인 페이지 이동
		return "beaudam/mainBottom";
	}

	@RequestMapping(value = "/productList.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String productList() {

		// 상품리스트 페이지 이동
		return "beaudam/productList";
	}

	@RequestMapping(value = "/productDetail.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String productDetail() {

		// 상품상세 페이지 이동
		return "beaudam/productDetail";
	}
	
	// msj
	@RequestMapping(value = "/pay.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String pay(HttpServletRequest request) {
		
		String pay = request.getParameter("pay");
		if(pay != null) {
			
			// 결제완료 페이지 이동
			return "beaudam/payOk";
		}
		
		// 결제 페이지 이동
		return "beaudam/pay";
	}
	
	
	

	// ********************** My Page **********************

	@RequestMapping(value = "/myPage.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPage() {

		// 마이페이지 이동
		return "myPage/myPage";
	}	
	
	@RequestMapping(value = "/myBasket.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myBasket() {

		// 장바구니 (마이페이지) 페이지 이동
		return "myPage/myBasket";
	}

	@RequestMapping(value = "/myInfo.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myInfo() {

		// 회원정보 수정 (마이페이지) 페이지 이동
		return "myPage/myInfo";
	}

	// msj
	@RequestMapping(value = "/myCoupon.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myCoupon() {

		// 보유쿠폰 (마이페이지) 페이지 이동
		return "myPage/myCoupon";
	}

	// msj
	@RequestMapping(value = "/myOrder.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myOrder() {

		// 주문정보 (마이페이지) 페이지 이동
		return "myPage/myOrder";
	}

	// msj
	@RequestMapping(value = "/myLeave.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myLeave() {

		// 회원탈퇴 (마이페이지) 페이지 이동
		return "myPage/myLeave";
	}

	
	
	
	
	// ********************** Admin Page **********************

	//syj
	@RequestMapping(value = "/adminUser.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String admin_user() {
		
		
		

		// 회원관리 페이지 이동
		return "admin/adminUser";
	}
	
	//syj
	@RequestMapping(value = "/adminProduct.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProduct() {

		// 상품조회 페이지 이동
		return "admin/adminProduct";
	}

	//syj
	@RequestMapping(value = "/adminProduct_update.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProduct_update() {

		// 상품수정 페이지 이동
		return "admin/adminProduct_update";
	}

	//syj
	@RequestMapping(value = "/adminProduct_new.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String admin_new_product() {

		// 상품등록 페이지 이동
		return "admin/adminProduct_new";
	}
	
	
	//esteban
	@RequestMapping(value = "/adminBrand.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminBrand() {
		
		// 브랜드 관리 페이지 이동
		return "admin/adminBrand";
	}
	
	//esteban	
	@RequestMapping(value = "/adminOrder.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminOrder() {
		
		// 주문내역 관리 페이지 이동
		return "admin/adminOrder";
	}
	
	//esteban
	@RequestMapping(value = "/adminSales.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminSales() {
		
		// 매출 페이지 이동
		return "admin/adminSales";
	}
	
	

	
	
	
	
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
