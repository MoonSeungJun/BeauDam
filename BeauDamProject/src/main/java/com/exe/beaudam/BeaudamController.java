package com.exe.beaudam;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
 *  5. image������ resources�� image������ ���� ������ ���� �����Ͽ� �� ������ ���� ��
 *   -> resources/image/����(��������)/~.jpg
 *   -> �������� 3���� ���� �ڽ��� ��������� �Ȱ��� �� ��
 *   -> �̹������� � �뵵�� �̹������� �� �� �ֵ��� ���� ��
 */

@Controller
public class BeaudamController {

	// ********************** Beaudam Page **********************
	
	@RequestMapping(value = "/login.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(HttpServletRequest request) {

		// �α��� ���� �޾ƿ���
		String id = request.getParameter("id");

		// �α��� ���� üũ
		if (id != null) {
			return "beaudam/main";
		}

		// �α��� ������ �̵�
		return "beaudam/login";
	}

	@RequestMapping(value = "/newUser.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String newUser() {

		// ȸ������ ������ �̵�
		return "beaudam/newUser";
	}

	@RequestMapping(value = "/main.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String main() {

		// ���� ������ �̵�
		return "beaudam/main";
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
	
	@RequestMapping(value = "/pay.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String pay(HttpServletRequest request) {
		
		// -----������-----
		
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

		// ȸ������ ����(����������) ������ �̵�
		return "myPage/myInfo";
	}
	
	@RequestMapping(value = "/myEdit.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myEdit() {

		// ȸ������ ����(����������) ������ �̵�
		return "myPage/myEdit";
	}

	@RequestMapping(value = "/myCoupon.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myCoupon() {

		// ��������(����������) ������ �̵�
		return "myPage/myCoupon";
	}

	@RequestMapping(value = "/myOrder.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myOrder() {

		// ��������(����������) ������ �̵�
		return "myPage/myOrder";
	}

	@RequestMapping(value = "/myLeave.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myLeave() {

		// ��������(����������) ������ �̵�
		return "myPage/myLeave";
	}

	
	
	
	
	// ********************** Admin Page **********************

	@RequestMapping(value = "/adminUser.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String admin_user() {

		// ȸ������ ������ �̵�
		return "admin/adminUser";
	}

	@RequestMapping(value = "/adminProduct.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProduct() {

		// ��ǰ��ȸ ������ �̵�
		return "admin/adminProduct";
	}

	@RequestMapping(value = "/adminProduct_update.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProduct_update() {

		// ��ǰ���� ������ �̵�
		return "admin/adminProduct_update";
	}

	@RequestMapping(value = "/adminProduct_new.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String admin_new_product() {

		// ��ǰ��� ������ �̵�
		return "admin/adminProduct_new";
	}
	
	
	@RequestMapping(value = "/adminBrand.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminBrand() {
		
		// �귣�� ���� ������ �̵�
		return "admin/adminBrand";
	}
	
	
	@RequestMapping(value = "/adminOrder.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminOrder() {
		
		// �ֹ����� ���� ������ �̵�
		return "admin/adminOrder";
	}
	
	
	@RequestMapping(value = "/adminSales.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminSales() {
		
		// ���� ������ �̵�
		return "admin/adminSales";
	}
	
	

	
	
	
	
	// ********************** Customer Center Page **********************

	// ������ default ������
	@RequestMapping(value = "/faq.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String faq() {

		// FAQ ������ �̵�
		return "faq";
	}

	@RequestMapping(value = "/inquire.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String inquire() {

		// 1:1 ���� ������ �̵�
		return "inquire";
	}

	@RequestMapping(value = "/notification.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String notification() {

		// �������� ������ �̵�
		return "notification";
	}

}
