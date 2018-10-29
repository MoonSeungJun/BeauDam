package com.exe.beaudam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.dao.memberDAO.MemberServiceImpl;
import com.dao.otherDAO.OtherServiceImpl;
import com.dao.viewDAO.ViewService;
import com.table.memberDTO.MemberDTO;
import com.table.otherDTO.BasketDTO;
import com.table.otherDTO.CouponDTO;
import com.view.view.MemberView;

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

	// ********************** Beaudam Page **********************

	@RequestMapping(value = "/main.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(HttpSession session) {

		String id = (String) session.getAttribute("id");

		// ���� ������ �̵�
		return new ModelAndView("beaudam/main", "id", id);
	}

	@RequestMapping(value = "/productList.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productList(HttpSession session) {

		return new ModelAndView("beaudam/productList", "id", (String) session.getAttribute("id"));

	}

	@RequestMapping(value = "/productDetail.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productDetail(HttpSession session) {

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
	public ModelAndView pay(HttpServletRequest request) {

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

		String id = "esteban"; // test Data
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

}
