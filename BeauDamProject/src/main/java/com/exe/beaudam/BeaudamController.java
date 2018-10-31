package com.exe.beaudam;

import java.io.*;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.dao.memberDAO.*;
import com.dao.otherDAO.OtherServiceImpl;
import com.dao.productDAO.*;
import com.dao.saleDAO.*;
import com.dao.viewDAO.ViewService;
import com.table.memberDTO.*;
import com.table.otherDTO.BasketDTO;
import com.table.otherDTO.CouponDTO;
import com.view.view.*;

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

	@Resource(name = "viewService")
	private ViewService viewService;

	@Resource(name = "otherService")
	private OtherServiceImpl otherService;
	
	@Resource(name="productService")
	private ProductServiceImpl productService;

	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	@Resource(name="saleService")
	private SaleServiceImpl saleService;
	// ********************** Beaudam Page **********************

	
	
	
	@RequestMapping(value = "/main.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(HttpSession session, HttpServletRequest req) {

		String id = (String) session.getAttribute("id");
		
		List<SaleView> bestItems = otherService.getBestItem();	
		
		Iterator<SaleView> it = bestItems.iterator();
		
		List<ProductView> productList = new ArrayList<ProductView>();
		
		
		while(it.hasNext()) {
			SaleView saleVO = it.next();
			
			ProductView productVO = productService.getOneProductData(saleVO.getCode());		
			
			
			productVO.setThumb_Img("thumbImg\\"+productVO.getThumb_Img());
			productList.add(productVO);		
			
		}		
		
		req.setAttribute("bestItem", bestItems);
		req.setAttribute("productList", productList);		
		
		// ���� ������ �̵�
		return new ModelAndView("beaudam/main", "id", id);
	}

	@RequestMapping(value = "/productList.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productList(HttpSession session) {

		return new ModelAndView("beaudam/productList", "id", (String) session.getAttribute("id"));

	}

	@RequestMapping(value = "/productDetail.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productDetail(HttpSession session, HttpServletRequest req) {
			
		ProductView detailData = productService.getOneProductData(req.getParameter("code"));
		
		int point = (int) (detailData.getProduct_Price()*0.1);
		
		req.setAttribute("point", point);
		req.setAttribute("dto", detailData);
		

		// ��ǰ�� ������ �̵�
		return new ModelAndView("beaudam/productDetail", "id", (String) session.getAttribute("id"));

	}

	@RequestMapping(value = "/event.action", method = RequestMethod.GET)
	public ModelAndView event(HttpSession session) {

		// �̺�Ʈ ����Ʈ ������ �̵�
		return new ModelAndView("beaudam/event", "id", (String) session.getAttribute("id"));

	}

	@RequestMapping(value = "/event1.action", method = RequestMethod.GET)
	public ModelAndView event1(HttpSession session) {

		// �̺�Ʈ1 ������ �̵�
		return new ModelAndView("beaudam/event1", "id", (String) session.getAttribute("id"));

	}

	@RequestMapping(value = "/event2.action", method = RequestMethod.GET)
	public ModelAndView event2(HttpSession session) {

		// �̺�Ʈ2 ������ �̵�
		return new ModelAndView("beaudam/event2", "id", (String) session.getAttribute("id"));

	}

	@RequestMapping(value = "/event3.action", method = RequestMethod.GET)
	public ModelAndView event3(HttpSession session) {

		// �̺�Ʈ3 ������ �̵�
		return new ModelAndView("beaudam/event3", "id", (String) session.getAttribute("id"));
	}

	// msj
	@RequestMapping(value = "/pay.action", method = { RequestMethod.POST })
	public ModelAndView pay(HttpServletRequest request, HttpSession session) {

		ModelAndView mav = new ModelAndView();

		String pay = request.getParameter("pay");
		if (pay == "pay_ok") {
			mav.setViewName("beaudam/payOk");

			// �����Ϸ� ������ �̵�
			return mav;
		}

		mav.setViewName("beaudam/pay");

		List<BasketDTO> buyLists = new ArrayList<BasketDTO>();
		Map<String, Object> hm = new HashMap<String, Object>();

		// HttpSession session = request.getSession();
		// String id = (String) session.getAttribute("id");

		String id = (String) session.getAttribute("id");
		hm.put("id", id);

		MemberView member = viewService.getOneMemberData(id);

		int amount = 0;
		String check[] = request.getParameterValues("check");
		for (String selectedProduct : check) {
			amount = Integer.parseInt(request.getParameter("amount" + selectedProduct));
			hm.put("basket_Num", selectedProduct);
			BasketDTO dto = otherService.getBasketOneData(hm);
			dto.setQty(amount);
			buyLists.add(dto);
		}

		List<CouponDTO> couponLists = otherService.getCouponData(id);
		int couponCount = otherService.getCouponCount(id);		
		mav.addObject("member", member);
		mav.addObject("buyLists", buyLists);
		mav.addObject("couponLists", couponLists);
		mav.addObject("couponCount", couponCount);

		// ���� ������ �̵�
		return mav;
	}

	@RequestMapping(value = "/insertBasket.action", method = { RequestMethod.GET, RequestMethod.POST })
	public void insertBasket(HttpServletRequest req, HttpSession session) {
		
		String code = req.getParameter("code");
		int amount = Integer.parseInt(req.getParameter("amount"));
		String id = (String) session.getAttribute("id");
		
		ProductView pView = productService.getOneProductData(code);
		MemberView mView = memberService.getOneMemberData(id);
		
		BasketDTO dto = new BasketDTO();
		dto.setId(mView.getId());
		dto.setCode(code);
		dto.setBrand(pView.getBrand());
		dto.setProduct_Name(pView.getProduct_Name());
		dto.setColor_Code(pView.getColor_Code());
		dto.setColor_Name(pView.getColor_Name());
		dto.setThumb_Img(pView.getThumb_Img());
		dto.setProduct_Price(pView.getProduct_Price());
		dto.setQty(amount);		
		
		otherService.insertBasket(dto);	
		
	}

	@RequestMapping(value = "/deleteBasket.action", method = { RequestMethod.GET, RequestMethod.POST })
	public void deleteBasket(HttpServletRequest req, HttpSession session) {
	
		String basket_Num = req.getParameter("basket_Num");
		String id = req.getParameter("id");
		System.out.println(id);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("basket_Num", basket_Num);
		map.put("id", id);
		
		otherService.deleteBasket(map);
		
		
	}	
	@RequestMapping(value = "/deleteAllBasket.action", method = { RequestMethod.GET, RequestMethod.POST })
	public void deleteAllBasket(HttpServletRequest req, HttpSession session) {
	
		String id = (String) session.getAttribute("id");
		
		otherService.deleteAllBasket(id);	
		
	}
		
	@RequestMapping(value = "/payOK.action", method = { RequestMethod.POST })
	public String payOK(HttpServletRequest req) {
		
		//sale insert
		
//		saleService.insertSaleDate(dto);
//		saleService.insertSaleProduct(dto);
//		saleService.insertSaleClient(dto);;
		
		
		//product update
		String code = req.getParameter("code");
		int qty = Integer.parseInt(req.getParameter("qty"));
			
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("qty", qty);
		productService.updateQty(map);	
		
		//basket delete
		String id = req.getParameter("id");
		otherService.deleteAllBasket(id);
		
		//member update
		MemberView view = memberService.getOneMemberData(id);
		Member_GradeDTO dto = new Member_GradeDTO();
		dto.setId(id);
		dto.setPay(Integer.parseInt(req.getParameter("payResult")));		
		int point = (int) (dto.getPay()*0.1);
		dto.setPoint(point);
		
		if(view.getPay() >= 10000) {
			dto.setGrade("Silver");
		}else if(view.getPay() >= 50000) {
			dto.setGrade("Gold");
		}else if(view.getPay() >= 0) {
			dto.setGrade(view.getGrade());
		}	
		
		//coupon update
		
		return "redirect:/main.action";
	}
	
}
