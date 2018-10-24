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

import com.dao.otherDAO.OtherServiceImpl;
import com.table.otherDTO.BasketDTO;

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

	@Resource(name = "otherService")
	private OtherServiceImpl OtherService;

	// ********************** Beaudam Page **********************

	@RequestMapping(value = "/main.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(HttpSession session) {

		String id = (String) session.getAttribute("id");

		// ���� ������ �̵�
		return new ModelAndView("beaudam/main", "id", id);
	}

	@RequestMapping(value = "/productList.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String productList() {

		// ��ǰ����Ʈ ������ �̵�
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
		return"beaudam/event2";
	}

	@RequestMapping(value = "/event3.action", method = RequestMethod.GET)
	public String event3() {
		
		// �̺�Ʈ3 ������ �̵�
		return "beaudam/event3";
		
	}

	// msj
	@RequestMapping(value = "/pay.action", method = { RequestMethod.POST })
	public ModelAndView pay(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		String pay = request.getParameter("pay_ok");
		if (pay != null) {
			mav.setViewName("beaudam/payOk");

			// �����Ϸ� ������ �̵�
			return mav;
		}

		mav.setViewName("beaudam/pay");

		// HttpSession session = request.getSession();
		// String id = (String) session.getAttribute("id");

		List<BasketDTO> lists = new ArrayList<BasketDTO>();
		Map<String, Object> hm = new HashMap<String, Object>();

		String id = "esteban"; // test Data
		hm.put("id", id);

		String check[] = request.getParameterValues("check");
		for (String s : check) {
			hm.put("basket_Num", s);
			BasketDTO dto = OtherService.getBasketOneData(hm);
			lists.add(dto);
		}

		mav.addObject("lists", lists);

		// ���� ������ �̵�
		return mav;
	}

}
