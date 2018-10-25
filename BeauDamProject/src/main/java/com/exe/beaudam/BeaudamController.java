package com.exe.beaudam;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dao.adminDAO.AdminServiceImpl;
import com.dao.productDAO.ProductServiceImpl;
import com.dao.saleDAO.SaleServiceImpl;
import com.dao.viewDAO.ViewServiceImpl;
import com.exe.util.MyUtil;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.naver.naverlogin.NaverLoginBO;
import com.table.adminDTO.Admin_BrandDTO;
import com.table.adminDTO.Admin_CategoryDTO;
import com.table.adminDTO.Admin_TypeDTO;
import com.table.memberDTO.Member_InfoDTO;
import com.table.productDTO.BrandDTO;
import com.table.productDTO.ColorDTO;
import com.table.productDTO.ProductDTO;
import com.table.saleDTO.Sale_DateDTO;
import com.view.view.MemberView;
import com.view.view.ProductView;
import com.view.view.SaleView;

import javax.servlet.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


/*
 *  1. method mapping�� �� �⺻������ get, post ��� �����ص���
 *   -> �׳� ���������� �ʿ信 ���� get, post, get/post �� ����� ��� �����ؼ� ������ ��
 *   
 *  2. return ������ �� String�� �⺻���� ����
 *   -> ModelandView�� ��ȯ�Ͽ� ����ص� ����
 *  
 *  3. jsp������ ���� �ش��ϴ� ������ �����ϱ�
 *   -> �ش� ������ ��Ʈ�ѷ��� *ǥ�õ� �ּ� ����
 *   -> views/�ش�����/~.jsp
 *   -> jsp���ϸ��� return���� �����ִ� �̸��� �Ȱ��� �����
 *   
 *  4. ���� ���� �������� �ڽ��� �̸� �ּ� �޾Ƴ���
 *  
 *  5. image������ resources�� image�� �ش��ϴ� ������ ���� ������ ���� �����Ͽ� �� ������ ���� ��
 *   -> resources/image/�ش� ����(*ǥ��)/����(��������)/~.jpg
 *   -> �������� 3���� ���� �ڽ��� ��������� �Ȱ��� �� ��
 *   -> �̹������� � �뵵�� �̹������� �� �� �ֵ��� ���� ��
 *   
 *  6. css������ resources�� css�� �ش��ϴ� ������ ���� ������ ���� �����Ͽ� �� ������ ���� ��
 *   -> resources/css/�ش� ����(*ǥ��)/����(��������)/~.css
 *   -> �������� 3���� ���� �ڽ��� ��������� �Ȱ��� �� ��
 *   -> css���� � �뵵�� �̹������� �� �� �ֵ��� ���� ��
 */

/*
 * 	���� insert, delete ���̺� ����
 * 	
 * 	insert �� ��
 * 	member - member_Info - member_grade - coupon
 * 	product - brand - img - color - basket  
 * 	admin���̺� - brand
 * 	delete �� �� insert ����
 * 	
 * 
 * 	���� delete �� �� sale_code�� id ���� �� ���� ��ų ��
 * 	
 * 	notification delete�� num�� ������ ���� �ǹǷ� ������ ������ ����
 * 	������ư Ȱ��ȭ	
 * 
 * 	DB insert �ʵ�
 * 	����Ʈ ���� �־� �߰����� �ʾƵ� �Ǵ� ������
 * 	
 * 	Member ���� �÷�
 * 	- isLeave, created, pay, grade, point, num, period, use_date
 * 
 * 	Sale ���� �÷�
 * 	- saleDate, pay_status, delivery_status
 * 
 * 	Notificaiton ���� �÷�
 * 	- num, id, hitCount, created
 * 
 * 	Review ���� �÷�
 *  - created  
 *
 *	DB update �ʵ�
 *	�Ķ���� Ÿ���� �ٵ� �ٸ��� ��� �� ����� Mapper�� Ȯ���� ��
 *
 */
@Controller("BeaudamController")
public class BeaudamController {
	
	@RequestMapping(value = "/main.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		
		// ���� ������ �̵�
		return new ModelAndView("beaudam/main","id",id);
	}


	@Resource(name="adminService")
	private AdminServiceImpl adminService;

	@Resource(name="viewService")
	private ViewServiceImpl viewService;

	@Resource(name="saleService")
	private SaleServiceImpl saleService;

	@Resource(name="productService")
	private ProductServiceImpl productServiece;
	
	@Autowired
	MyUtil myUtil;
	
	private NaverLoginBO naverLoginBO;
	
	// ********************** Beaudam Page **********************
	
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpSession session) {
		
		/* �׾Ʒ� ���� URL�� �����ϱ� ���Ͽ� getAuthorizationUrl�� ȣ�� */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        /* ������ ���� URL�� View�� ���� */
        return new ModelAndView("beaudam/login", "url", naverAuthUrl);

	}
	@RequestMapping(value="/productList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String productList() {
		
		return "beaudam/productList";		
	}

	@RequestMapping(value = "/productDetail.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String productDetail() {

		// ��ǰ�� ������ �̵�
		return "beaudam/productDetail";
	}
	
	@RequestMapping(value = "/event.action", method = RequestMethod.GET)
	public String event() {

		// �̺�Ʈ ����Ʈ ������ �̵�
		return "beaudam/event";
	}
	
	@RequestMapping(value = "/event1.action", method = RequestMethod.GET)
	public String event1() {

		// �̺�Ʈ1 ������ �̵�
		return "beaudam/event1";
		
	}
	
	@RequestMapping(value = "/event2.action", method = RequestMethod.GET)
	public String event2() {

		// �̺�Ʈ2 ������ �̵�
		return "beaudam/event2";
	}
	
	@RequestMapping(value = "/event3.action", method = RequestMethod.GET)
	public String event3() {
		
		// �̺�Ʈ1 ������ �̵�
		return "beaudam/event3";
		
	}

	// msj
	@RequestMapping(value = "/pay.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String pay(HttpServletRequest request) {

		String pay = request.getParameter("pay");
		if(pay != null) {

			// �����Ϸ� ������ �̵�
			return "beaudam/payOk";
		}

		// ���� ������ �̵�
		return "beaudam/pay";
	}





	// ********************** My Page **********************

	@RequestMapping(value = "/myPage.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPage() {

		// ���������� �̵�
		return "myPage/myPage";
	}	

	@RequestMapping(value = "/myBasket.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myBasket() {

		// ��ٱ���(����������) ������ �̵�

		return "myPage/myBasket";
	}

	@RequestMapping(value = "/myInfo.action", method = RequestMethod.GET)
	public String myInfo() {

		// ���������� ��й�ȣȮ�� ������ �̵�
		return "myPage/myInfo";
	}

	@RequestMapping(value = "/myEdit.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myEdit() {

		// ȸ������ ����2(����������) ������ �̵�
		return "myPage/myEdit";

	}

	// msj
	@RequestMapping(value = "/myCoupon.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myCoupon() {

		// ��������(����������) ������ �̵�

		return "myPage/myCoupon";
	}

	// msj
	@RequestMapping(value = "/myOrder.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myOrder() {

		// �ֹ����� (����������) ������ �̵�

		return "myPage/myOrder";
	}

	// msj
	@RequestMapping(value = "/myLeave.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myLeave() {

		// ȸ��Ż�� (����������) ������ �̵�

		return "myPage/myLeave";
	}


	// ********************** Admin Page **********************

	//syj
	@RequestMapping(value = "/adminUser.action", method = { RequestMethod.GET, RequestMethod.POST})	
	public String admin_user(HttpServletRequest req) {
		// ȸ������ ������ �̵�			

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
			
			List<MemberView> lists = viewService.getSearchMemberData(mv);
			
			req.setAttribute("searchList", lists);

			return "admin/adminUser"; 
			
		}
		
		List<MemberView> memberList = viewService.getAllMemberData();		
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


		List<ProductView> productView = viewService.getAllProductData(searchPack);

		List<Admin_BrandDTO> brandLists = adminService.getAdminBrand();
		List<Admin_CategoryDTO> categoryLists = adminService.getAdminCategory();
		List<Admin_TypeDTO> typeLists = adminService.getAdminType();
			
		
		//����¡ ó�� �߰�		

		//���� ������
		request.setAttribute("lists", productView);
		request.setAttribute("brandLists", brandLists);
		request.setAttribute("categoryLists", categoryLists);
		request.setAttribute("typeLists", typeLists);
		
		

		// ��ǰ��ȸ ������ �̵�
		return "admin/adminProduct";
	}

	//syj
	@RequestMapping(value = "/adminProduct_update.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProduct_update(
			BrandDTO bdto,
			ColorDTO cdto,
			ProductDTO pdto,
			HttpServletRequest request) {

		String pageNum = request.getParameter("pageNum");
		
		productServiece.updateBrand(bdto);
		productServiece.updateColor(cdto);
		productServiece.updateProduct(pdto);						
			
		// ��ǰ�����Ϸ� ������ �̵�
		return "admin/adminProduct";
	}
	
	@RequestMapping(value = "/adminProductDelete.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProductdelete(HttpServletRequest request) {
		
		String pageNum = request.getParameter("pageNum");
		String code = request.getParameter("code");	
		
		productServiece.deleteBrand(code);
		productServiece.deleteColor(code);
		productServiece.deleteImg(code);
		productServiece.deleteProduct(code);
		
		return "redirect:/adminProduct.action?pageNum="+pageNum;
		
	}

	//syj
	@RequestMapping(value = "/adminProduct_new.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String admin_new_product() {

		// ��ǰ��� ������ �̵�
		return "admin/adminProduct_new";
	}


	//esteban
	@RequestMapping(value = "/adminBrand.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminBrand(HttpServletRequest req) {


		// �귣�� ���� ������ �̵�
		List<Admin_CategoryDTO> category = adminService.getAdminCategory();
		List<Admin_BrandDTO> brand = adminService.getAdminBrand();


		
		//�귣�� �߰�
		String addBrand = req.getParameter("addbrand");
		
		if(addBrand != null && !addBrand.equals("")) {				
			Admin_BrandDTO dto = new Admin_BrandDTO();			
			dto.setBrand(addBrand);	
			req.removeAttribute("addbrand");				
			adminService.insertBrand(dto);			
			return "redirect:/adminBrand.action";
		}
		
		//�귣�� ����
		String delBrand = req.getParameter("delbrand");				
		if(delBrand != null && !delBrand.equals("")) {				
			req.removeAttribute("delBrand");			
			adminService.deleteBrand(delBrand);			
			return "redirect:/adminBrand.action";
		}
		
		//ī�װ� �߰�
		String addCate = req.getParameter("addCate");
		if(addCate != null && !addCate.equals("")) {				
			Admin_CategoryDTO dto = new Admin_CategoryDTO();			
			dto.setCategory(addCate);
			req.removeAttribute("addCate");		
			adminService.insertCategory(dto);			
			return "redirect:/adminBrand.action";
		}
		//ī�װ� ����
		String delCate = req.getParameter("delCate");						
		if(delCate != null && !delCate.equals("")) {				
			req.removeAttribute("delCate");			
			adminService.deleteCategory(delCate);			
			return "redirect:/adminBrand.action";
		}
		
		//Ÿ�� �߰�
		String addType = req.getParameter("addType");
		if(addType != null && !addType.equals("")) {				
			Admin_TypeDTO dto = new Admin_TypeDTO();			
			dto.setType(addType);
			req.removeAttribute("addType");			
			adminService.insertType(dto);			
			return "redirect:/adminBrand.action";
		}
		//Ÿ�� ����
		String delType = req.getParameter("delType");
		if(delType != null && !delType.equals("")) {				
			req.removeAttribute("delType");			
			adminService.deleteType(delType);			
			return "redirect:/adminBrand.action";
		}
		//���� ������ �̵�
		List<Admin_CategoryDTO> category1 = adminService.getAdminCategory();
		List<Admin_BrandDTO> brand1 = adminService.getAdminBrand();		

		List<Admin_TypeDTO> type = adminService.getAdminType();

		req.setAttribute("brand", brand1);
		req.setAttribute("category", category1);
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


		List<SaleView> saleView = viewService.getAllSaleView(saleSearchPack);

		//����¡ ó�� �߰�	
		
		//����Ʈ�� ����
		request.setAttribute("lists", saleView);	

		// �ֹ����� ���� ������ �̵�
		return "admin/adminOrder";
	}

	@RequestMapping(value = "/adminOrderUpdate", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminOrderUpdate(SaleView dto, HttpServletRequest request) {

		String sale_Code = request.getParameter("sale_Code");
		
		dto = viewService.getOneSaleView(sale_Code);
		
		saleService.updateSaleDate(dto);


		return "admin/adminOrder";
	}

	//esteban
	@RequestMapping(value = "/adminSales.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminSales(HttpServletRequest request) {

		//y
		
		String yearSearchValue = request.getParameter("yearSearchValue");
		
		

		List<Sale_DateDTO> dayDto = saleService.getAdminDaySales();
		List<Sale_DateDTO> monthDto = saleService.getAdminMonthSales(yearSearchValue);
		List<Sale_DateDTO> yearDto = saleService.getAdminYearSales();
			
		
		//����¡ ó�� �߰�		

		//���� ������
		
		request.setAttribute("dayDto", dayDto);
		request.setAttribute("monthDto", monthDto);
		request.setAttribute("yearDto", yearDto);
		
		
		
		
		
		// ���� ������ �̵�
		return "admin/adminSales";
	}

	// ********************** Customer Center Page **********************

	// ������ default ������
	@RequestMapping(value = "/faq.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String faq() {

		// FAQ ������ �̵�
		return "customerCenter/faq";
	}

	@RequestMapping(value = "/inquire.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String inquire() {

		// 1:1���� ������ �̵�
		return "customerCenter/mailForm";
	}

	@RequestMapping(value = "/notification_list.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String notification_list() {

		// �������� ������ �̵�
		return "customerCenter/notification_list";
	}
	
	@RequestMapping(value = "/notification_create.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String notification_create() {

		// �������� ��� �̵�
		return "customerCenter/notification_create";
	}
	
	@RequestMapping(value = "/notification_update.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String notification_update() {

		// �������� ���� �̵�
		return "customerCenter/notification_update";
	}
	
	
	@RequestMapping(value = "/notification_delete.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String notification_delete() {

		// �������� ���� �̵�
		return "customerCenter/notification_delete";
	}
	

}
