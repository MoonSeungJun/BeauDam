package com.exe.beaudam;

import java.io.IOException;
import java.util.*;

import javax.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dao.adminDAO.*;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.naver.naverlogin.NaverLoginBO;
import com.table.adminDTO.*;
import com.view.view.*;

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
public class BeaudamController {

	@Resource(name="adminService")
	private AdminServiceImpl adminService;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	
	/* NaverLoginBO */
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		
		this.naverLoginBO = naverLoginBO;
		
	}
	
	// ********************** Beaudam Page **********************
	
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpSession session) {
		
		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        /* 생성한 인증 URL을 View로 전달 */
        return new ModelAndView("beaudam/login", "url", naverAuthUrl);

	}
	
	@RequestMapping(value="/login_ok.action", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView doLogin(HttpServletRequest request, HttpSession session) {
		
		// 로그인 정보 받아오기
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");
		
		// 입력한 id 조회

		if(id.equals("beaudam") && pwd.equals("a123")) {
			
			session.setAttribute("id", id);
			//DB에서 가져올 때부터는 닉네임으로 올리기

			return new ModelAndView("redirect:/main.action");
			
		}else {
		
			String errormessage = "아이디 또는 비밀번호가 잘못되었습니다.";

			return new ModelAndView("beaudam/login", "message", errormessage);
		
		}
	}
	
	@RequestMapping(value = "/logout.action", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpSession session) {
		
		session.removeAttribute("id");
        
        /* 생성한 인증 URL을 View로 전달 */
        return new ModelAndView("redirect:/main.action");

	}
	
	@RequestMapping(value = "/callback.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		
		JSONParser parser = new JSONParser();
		
		JSONObject obj1 = (JSONObject) parser.parse(apiResult);
			
		JSONObject obj2 =  (JSONObject) obj1.get("response");
		
		String id = (String) obj2.get("id");
		String nickname = (String) obj2.get("nickname");
		String gender = (String) obj2.get("gender");
		String email = (String) obj2.get("email");
		String name = (String) obj2.get("name");
		String birth = (String) obj2.get("birthday");
		
		String result = "id는 " + id + ", nickname은 " + nickname + ", gender는 " +gender+
				", email은 " + email + ", 이름은 " +name + ", 생일은 " + birth;
		
		session.setAttribute("id", id);
		session.setAttribute("nickname", nickname);
		
		return new ModelAndView("redirect:/main.action");
	}
	
	@RequestMapping(value = "/newTerm.action", method = RequestMethod.GET)
	public String newTerm() {

		// 약관 페이지 이동
		return "beaudam/newTerm";
	}

	@RequestMapping(value = "/newUser.action", method = RequestMethod.GET)
	public String newUser() {

		// 회원가입 페이지 이동
		return "beaudam/newUser";
	}

	@RequestMapping(value = "/main.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(HttpSession session) {
		
		String id = (String) session.getAttribute("id");

		// 메인 페이지 이동
		return new ModelAndView("beaudam/main","id",id);
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

		// 장바구니(마이페이지) 페이지 이동

		return "myPage/myBasket";
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
	public String adminBrand(HttpServletRequest req) {
		
		//브랜드 추가
		String addBrand = req.getParameter("addbrand");
		
		if(addBrand != null && !addBrand.equals("")) {				
			Admin_BrandDTO dto = new Admin_BrandDTO();			
			dto.setBrand(addBrand);	
			req.removeAttribute("addbrand");			
			List<Admin_BrandDTO> lists = adminService.getAdminBrand();			
			Iterator<Admin_BrandDTO> it = lists.iterator();			
			while(it.hasNext()) {				
				Admin_BrandDTO vo = it.next(); 				
				if(vo.getBrand().equals(addBrand)) {
					req.setAttribute("data", "오류");
					return "redirect:/adminBrand.action";
				}				
			}			
			adminService.insertBrand(dto);			
			return "redirect:/adminBrand.action";
		}
		
		//브랜드 삭제
		String delBrand = req.getParameter("delbrand");				
		if(delBrand != null && !delBrand.equals("")) {				
			req.removeAttribute("delBrand");			
			adminService.deleteBrand(delBrand);			
			return "redirect:/adminBrand.action";
		}
		
		//카테고리 추가
		String addCate = req.getParameter("addCate");
		if(addCate != null && !addCate.equals("")) {				
			Admin_CategoryDTO dto = new Admin_CategoryDTO();			
			dto.setCategory(addCate);
			req.removeAttribute("addCate");			
			List<Admin_CategoryDTO> lists = adminService.getAdminCatogory();			
			Iterator<Admin_CategoryDTO> it = lists.iterator();			
			while(it.hasNext()) {				
				Admin_CategoryDTO vo = it.next(); 				
				if(vo.getCategory().equals(addCate)) {
					req.setAttribute("data", "오류");
					return "redirect:/adminBrand.action";
				}				
			}			
			adminService.insertCategory(dto);			
			return "redirect:/adminBrand.action";
		}
		//카테고리 삭제
		String delCate = req.getParameter("delCate");						
		if(delCate != null && !delCate.equals("")) {				
			req.removeAttribute("delCate");			
			adminService.deleteCategory(delCate);			
			return "redirect:/adminBrand.action";
		}
		
		//타입 추가
		String addType = req.getParameter("addType");
		if(addType != null && !addType.equals("")) {				
			Admin_TypeDTO dto = new Admin_TypeDTO();			
			dto.setType(addType);
			req.removeAttribute("addType");			
			List<Admin_TypeDTO> lists = adminService.getAdminType();			
			Iterator<Admin_TypeDTO> it = lists.iterator();			
			while(it.hasNext()) {				
				Admin_TypeDTO vo = it.next(); 				
				if(vo.getType().equals(addCate)) {
					req.setAttribute("data", "오류");
					return "redirect:/adminBrand.action";
				}				
			}			
			adminService.insertType(dto);			
			return "redirect:/adminBrand.action";
		}
		//타입 삭제
		String delType = req.getParameter("delType");
		if(delType != null && !delType.equals("")) {				
			req.removeAttribute("delType");			
			adminService.deleteType(delType);			
			return "redirect:/adminBrand.action";
		}
		//관리 페이지 이동
		List<Admin_CategoryDTO> category = adminService.getAdminCatogory();
		List<Admin_BrandDTO> brand = adminService.getAdminBrand();		
		List<Admin_TypeDTO> type = adminService.getAdminType();
		
		req.setAttribute("brand", brand);
		req.setAttribute("category", category);
		req.setAttribute("type", type);
		
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
