package com.exe.beaudam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.exe.util.MyUtil;
import com.naver.naverlogin.NaverLoginBO;

import ch.qos.logback.classic.sift.MDCBasedDiscriminator;

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
		
		// ���� ������ �̵�
		return new ModelAndView("beaudam/main","id",(String) session.getAttribute("id"));
	}

	@Autowired
	MyUtil myUtil;
	
	// ********************** Beaudam Page **********************
	
	@RequestMapping(value="/productList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView productList(HttpSession session) {
		
		return new ModelAndView("beaudam/productList","id",(String) session.getAttribute("id"));
	
	}

	@RequestMapping(value = "/productDetail.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productDetail(HttpSession session) {

		// ��ǰ�� ������ �̵�
		return new ModelAndView("beaudam/productDetail","id",(String) session.getAttribute("id"));

	}
	
	@RequestMapping(value = "/event.action", method = RequestMethod.GET)
	public ModelAndView event(HttpSession session) {

		// �̺�Ʈ ����Ʈ ������ �̵�
		return new ModelAndView("beaudam/event","id",(String) session.getAttribute("id"));

	}
	
	@RequestMapping(value = "/event1.action", method = RequestMethod.GET)
	public ModelAndView event1(HttpSession session) {

		// �̺�Ʈ1 ������ �̵�
		return new ModelAndView("beaudam/event1","id",(String) session.getAttribute("id"));
		
	}
	
	@RequestMapping(value = "/event2.action", method = RequestMethod.GET)
	public ModelAndView event2(HttpSession session) {

		// �̺�Ʈ2 ������ �̵�
		return new ModelAndView("beaudam/event2","id",(String) session.getAttribute("id"));

	}
	
	@RequestMapping(value = "/event3.action", method = RequestMethod.GET)
	public ModelAndView event3(HttpSession session) {
		
		// �̺�Ʈ1 ������ �̵�
		return new ModelAndView("beaudam/event3","id",(String) session.getAttribute("id"));		
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

}
