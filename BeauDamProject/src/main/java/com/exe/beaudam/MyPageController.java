package com.exe.beaudam;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.dao.otherDAO.OtherServiceImpl;
import com.dao.viewDAO.ViewService;
import com.dao.viewDAO.ViewServiceImpl;
import com.table.otherDTO.BasketDTO;
import com.view.view.MemberView;

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
@Controller("MyPageController")
public class MyPageController {

	@Resource(name = "otherService")
	private OtherServiceImpl OtherService;
	
	@Resource(name="viewService")
	private ViewServiceImpl viewService;

	// ********************** My Page **********************

	@RequestMapping(value = "/myPage.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPage(HttpSession session) {
	
		// 마이페이지 이동
		return "myPage/myPage";
	}

	@RequestMapping(value = "/myInfo.action", method = RequestMethod.GET)
	public String myInfo() {

		// 마이페이지 비밀번호확인 페이지 이동
		return "myPage/myInfo";
	}

	@RequestMapping(value = "/myEdit.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myEdit() {

		// 회원정보 수정2(마이페이지) 페이지 이동
		return "myPage/myEdit";

	}

	// msj
	@RequestMapping(value = "/myCoupon.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myCoupon() {

		// 보유쿠폰(마이페이지) 페이지 이동

		return "myPage/myCoupon";
	}

	// msj
	@RequestMapping(value = "/myOrder.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myOrder() {

		// 주문정보 (마이페이지) 페이지 이동

		return "myPage/myOrder";
	}
	
	@RequestMapping(value = "/myLeave.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myLeave(HttpSession session) {

		// 주문정보 (마이페이지) 페이지 이동

		return "myPage/myLeave";
	}

	/* khn 수정 중
	@RequestMapping(value = "/myLeave_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myLeave_ok(HttpServletRequest request, HttpSession session) {
		
		// 비밀번호 정보 받아오기
		String pwd = request.getParameter("password");

		// 입력한 비밀번호 조회
		MemberView dto = viewService.getOneMemberData(pwd);
		String ck_pwd = dto.getPwd();
		
		if(!pwd.equals(ck_pwd)) {
			String errormessage = "잘못된 비밀번호입니다";	
			
			return new ModelAndView("myPage/leave", "message", errormessage);
		}
		
		return new ModelAndView("redirect:/main.action");
	}*/

	// msj
	@RequestMapping(value = "/myBasket.action", method = { RequestMethod.GET })
	public ModelAndView myBasket() {

		// 장바구니(마이페이지) 페이지 이동

		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPage/myBasket");

		// HttpSession session = request.getSession();
		// String id = (String) session.getAttribute("id");

		String id = "esteban"; // test Data

		List<BasketDTO> lists = OtherService.getBasketData(id);

		mav.addObject("lists", lists);

		return mav;
	}

}
