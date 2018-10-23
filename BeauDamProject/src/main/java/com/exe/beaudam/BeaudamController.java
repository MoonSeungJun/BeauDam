package com.exe.beaudam;

import java.io.*;
import java.util.*;

import javax.annotation.*;
import javax.servlet.http.*;

import org.json.simple.*;
import org.json.simple.parser.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import com.dao.adminDAO.*;
import com.dao.productDAO.*;
import com.dao.saleDAO.*;
import com.dao.viewDAO.*;
import com.file.upload.*;
import com.github.scribejava.core.model.*;
import com.naver.naverlogin.*;
import com.table.adminDTO.*;
import com.table.memberDTO.*;
import com.table.productDTO.*;
import com.table.saleDTO.*;
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

	@Resource(name="viewService")
	private ViewServiceImpl viewService1;


	@Resource(name="productService")
	private ProductServiceImpl productService;
	
	/* NaverLoginBO */
	@Resource(name="naverLoginBO")
	private NaverLoginBO naverLoginBO;

	@Resource(name="saleService")
	private SaleServiceImpl saleService;
	
	
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

		session.setAttribute("id", id);
		session.setAttribute("nickname", nickname);

		/*return new ModelAndView("beaudam/callback","result",result);*/
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

	@RequestMapping(value = "/mainTop.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainTop() {

		// 메인 페이지 이동
		return "beaudam/mainTop";
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
	@RequestMapping(value = "/adminUser.action", method = { RequestMethod.GET, RequestMethod.POST})	
	public String admin_user(HttpServletRequest req) {
		// 회원관리 페이지 이동			

		if(req.getMethod().equalsIgnoreCase("POST")) {
			Member_InfoDTO mv = new Member_InfoDTO();		
			
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String tel = req.getParameter("tel");
			String cellphone = req.getParameter("cellphone");
			String birth = req.getParameter("birth");
			
			System.out.println(id+name+tel+cellphone+birth);
			
			if(id != null && !id.equals("")) {
				mv.setId(id);
			}else {
				id = "";
				mv.setId(id);
			}
			if(name != null && !name.equals("")) {
				mv.setName(name);
			}else {
				name = "";
				mv.setName(name);
			}
			if(tel != null && !tel.equals("")) {
				mv.setTel(tel);
			}else {
				tel = "";
				mv.setTel(tel);
			}
			if(cellphone != null && !cellphone.equals("")) {
				mv.setCellphone(cellphone);
			}else {
				cellphone = "";
				mv.setCellphone(cellphone);
			}
			if(birth != null && !birth.equals("")) {
				mv.setBirth(birth);
			}else {
				birth = "";
				mv.setBirth(birth);
			}
			
			List<MemberView> lists = viewService1.getSearchMemberData(mv);
			
			req.setAttribute("searchList", lists);

			return "admin/adminUser"; 
			
		}
		
		List<MemberView> memberList = viewService1.getAllMemberData();		
		req.setAttribute("memberList", memberList);


		return "admin/adminUser";		
		
	}

	//syj
	@RequestMapping(value = "/adminProduct.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProduct(HttpServletRequest request) {


		HashMap<String, Object> searchPack = new HashMap<String, Object>();

		String searchValue1 = request.getParameter("searchValue1");
		String searchValue2 = request.getParameter("searchValue2");
		String searchValue3 = request.getParameter("searchValue3");
		String searchValue4 = request.getParameter("searchValue4");
		String searchValue5 = request.getParameter("searchValue5");


		if(searchValue1==null||searchValue1.equals("")) {
			searchValue1 = "";
		}
		if(searchValue2==null||searchValue2.equals("")) {
			searchValue2 = "";
		}
		if(searchValue3==null||searchValue3.equals("")) {
			searchValue3 = "";
		}
		if(searchValue4==null||searchValue4.equals("")) {
			searchValue4 = "";
		}
		if(searchValue5==null||searchValue5.equals("")) {
			searchValue5 = "";
		}	

		searchPack.put("searchValue1", searchValue1);
		searchPack.put("searchValue2", searchValue2);
		searchPack.put("searchValue3", searchValue3);
		searchPack.put("searchValue4", searchValue3);
		searchPack.put("searchValue5", searchValue3);


		List<ProductView> productView = viewService1.getAllProductData(searchPack);

		List<Admin_BrandDTO> brandLists = adminService.getAdminBrand();
		List<Admin_CategoryDTO> categoryLists = adminService.getAdminCategory();
		List<Admin_TypeDTO> typeLists = adminService.getAdminType();
			
		
		//페이징 처리 추가		

		//송출 데이터
		request.setAttribute("lists", productView);
		request.setAttribute("brandLists", brandLists);
		request.setAttribute("categoryLists", categoryLists);
		request.setAttribute("typeLists", typeLists);
		
		

		// 상품조회 페이지 이동
		return "admin/adminProduct";
	}

	//syj
	@RequestMapping(value = "/adminProduct_update.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProduct_update(
			BrandDTO bdto,ColorDTO cdto,ProductDTO pdto,HttpServletRequest request) {

		String pageNum = request.getParameter("pageNum");
		
		productService.updateBrand(bdto);
		productService.updateColor(cdto);
		productService.updateProduct(pdto);						
			
		// 상품수정완료 페이지 이동
		return "admin/adminProduct";
	}
	
	@RequestMapping(value = "/adminProductDelete.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProductdelete(HttpServletRequest request) {
		
		String pageNum = request.getParameter("pageNum");
		String code = request.getParameter("code");	
		
		ProductView view = productService.getOneProductData(code);
		
		productService.deleteBrand(code);
		productService.deleteColor(code);
		productService.deleteImg(code);
		productService.deleteProduct(code);
		
		String thumbPath = request.getSession().getServletContext().getRealPath("/thumbImg");
		String detailPath = request.getSession().getServletContext().getRealPath("/detailImg");
		
		
		File serverFile;
		
		serverFile = new File(thumbPath + File.separator + view.getThumb_Img());	
		
		serverFile.delete();
		serverFile = new File(detailPath + File.separator + view.getDetail_Img());
		serverFile.delete();
		
		return "redirect:/adminProduct.action?pageNum="+pageNum;
		
	}

	//syj
	@RequestMapping(value = "/adminProduct_new.action", method = { RequestMethod.GET})
	public String admin_new_product(HttpServletRequest req) {
		
		// 상품등록 페이지 이동 시 셀렉트박스 출력				
		List<Admin_BrandDTO> brand = adminService.getAdminBrand();
		List<Admin_CategoryDTO> cate = adminService.getAdminCategory();
		List<Admin_TypeDTO> type = adminService.getAdminType();
		
		//상품 등록 페이지 이동 시 상품 리스트 출력
		List<ProductView> lists = productService.getProductList();

		req.setAttribute("productList", lists);					
		req.setAttribute("brand", brand);
		req.setAttribute("cate", cate);
		req.setAttribute("type", type);
		
		return "admin/adminProduct_new";	
		
	}
	
	
	@RequestMapping(value="/adminProduct_newAjax.action", method=RequestMethod.POST)
	public void selectBoxAjax(HttpServletRequest req, HttpServletResponse resp, String params, String brand) {
		
		try {
			
			String category = params;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("brand", brand);
			map.put("category", category);
			
			List<AdminView> typeList = adminService.getAdminTypeData(map);			
			JSONArray jArray = new JSONArray();			
			
			for(int i=0;i<typeList.size();i++) {
				Object str = typeList.get(i).getType();
				
				jArray.add(str);				
			}			
			
			PrintWriter pw = resp.getWriter();
			pw.print(jArray.toString());
			pw.flush();
			pw.close();		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@RequestMapping(value="/adminProductAjax.action", method=RequestMethod.POST)
	public void productAjax(HttpServletRequest req, HttpServletResponse resp, String params, String brand) {
		
		try {
			
			String category = params;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("brand", brand);
			map.put("category", category);
			
			List<AdminView> typeList = adminService.getAdminTypeData(map);			
			JSONArray jArray = new JSONArray();			
			
			for(int i=0;i<typeList.size();i++) {
				Object str = typeList.get(i).getType();				
				jArray.add(str);				
			}			
			
			PrintWriter pw = resp.getWriter();
			pw.print(jArray.toString());
			pw.flush();
			pw.close();		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="/adminProduct_new.action",method=RequestMethod.POST)
	public ModelAndView admin_add_product( @RequestParam("thumbImg")MultipartFile f1, @RequestParam("detailImg")MultipartFile f2, ProductUpload command, HttpServletRequest req) throws Exception {
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/adminProduct_new.action");
		
		
		String originalFN1 = new String(f1.getOriginalFilename().getBytes("8859_1"),"UTF-8");
		String originalFN2 = new String(f2.getOriginalFilename().getBytes("8859_1"),"UTF-8");



		String ext1 = originalFN1.substring(originalFN1.lastIndexOf('.'));
		String ext2 = originalFN2.substring(originalFN2.lastIndexOf('.'));	
		
		String saveFileName1 = UUID.randomUUID().toString().replaceAll("-", "") + ext1;
		String saveFileName2 = UUID.randomUUID().toString().replaceAll("-", "") + ext2;	
		
		String thumbPath = req.getSession().getServletContext().getRealPath("/thumbImg");
		String detailPath = req.getSession().getServletContext().getRealPath("/detailImg");
		System.out.println(thumbPath);
		File tp = new File(thumbPath);
		File dp = new File(detailPath);

		try {

			if(!tp.exists()) {
				tp.mkdirs();
			}
			if(!dp.exists()) {
				dp.mkdirs();
			}		
			
			File serverFile;
			
			serverFile = new File(thumbPath + File.separator + saveFileName1);		
			f1.transferTo(serverFile);
			
			
			
			serverFile = new File(detailPath + File.separator + saveFileName2);	
			f2.transferTo(serverFile);			
			
            ProductDTO product = new ProductDTO();
            BrandDTO brand = new BrandDTO();
            ColorDTO color = new ColorDTO();
            ImgDTO img = new ImgDTO();          
            
            product.setCode(command.getCode());
            product.setProductName(command.getProductName());
            product.setProductPrice(Integer.parseInt(command.getPrice()));
            
            brand.setBrand(command.getBrand());
            brand.setCategory(command.getCategory());
            brand.setCode(command.getCode());
            brand.setType(command.getType());
            
            color.setCode(command.getCode());
            color.setColorCode(command.getColorCode());
            color.setColorName(command.getColor());
            color.setQty(Integer.parseInt(command.getCount()));
            
            img.setCode(command.getCode());
            img.setDetail_Img(saveFileName2);
            img.setThumb_Img(saveFileName1);
            
            productService.insertProduct(product);
            productService.insertBrand(brand);
            productService.insertColor(color);
            productService.insertImg(img);          
			
		} catch (FileNotFoundException e) {			
			e.printStackTrace();
		}

		return mav;
					
	}


	//esteban
	@RequestMapping(value = "/adminBrand.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminBrand(HttpServletRequest req) {


		// 브랜드 관리 페이지 이동		
		//브랜드 추가
		String addBrand = req.getParameter("addbrand");
		
		if(addBrand != null && !addBrand.equals("")) {				
			Admin_BrandDTO dto = new Admin_BrandDTO();			
			dto.setBrand(addBrand);	
			req.removeAttribute("addbrand");				
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

		List<Admin_CategoryDTO> category = adminService.getAdminCategory();
		List<Admin_BrandDTO> brand = adminService.getAdminBrand();
		List<Admin_TypeDTO> type = adminService.getAdminType();

		req.setAttribute("brand", brand);
		req.setAttribute("category", category);
		req.setAttribute("type", type);

		return "admin/adminBrand";
	}

	//esteban	
	@RequestMapping(value = "/adminOrder.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminOrder(HttpServletRequest request) {

		HashMap<String, Object> saleSearchPack = new HashMap<String, Object>();

		String searchValue1 = request.getParameter("searchValue1");
		String searchValue2 = request.getParameter("searchValue2");
		String searchValue3 = request.getParameter("searchValue3");


		if(searchValue1==null||searchValue1.equals("")) {
			searchValue1 = "";
		}
		if(searchValue2==null||searchValue2.equals("")) {
			searchValue2 = "";
		}
		if(searchValue3==null||searchValue3.equals("")) {
			searchValue3 = "";
		}

		saleSearchPack.put("searchValue1", searchValue1);
		saleSearchPack.put("searchValue2", searchValue2);
		saleSearchPack.put("searchValue3", searchValue3);


		List<SaleView> saleView = viewService1.getAllSaleView(saleSearchPack);

		//페이징 처리 추가	
		
		//리스트값 전송
		request.setAttribute("lists", saleView);	

		// 주문내역 관리 페이지 이동
		return "admin/adminOrder";
	}

	@RequestMapping(value = "/adminOrderUpdate", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminOrderUpdate(Sale_DateDTO dto, HttpServletRequest request) {

		saleService.updateSaleDate(dto);


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
