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
@Controller("MyPageController")
public class MyPageController {

	@Resource(name = "otherService")
	private OtherServiceImpl OtherService;
	
	@Resource(name="viewService")
	private ViewServiceImpl viewService;

	// ********************** My Page **********************

	@RequestMapping(value = "/myPage.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPage(HttpSession session) {
	
		// ���������� �̵�
		return "myPage/myPage";
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
	
	@RequestMapping(value = "/myLeave.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myLeave(HttpSession session) {

		// �ֹ����� (����������) ������ �̵�

		return "myPage/myLeave";
	}

	/* khn ���� ��
	@RequestMapping(value = "/myLeave_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myLeave_ok(HttpServletRequest request, HttpSession session) {
		
		// ��й�ȣ ���� �޾ƿ���
		String pwd = request.getParameter("password");

		// �Է��� ��й�ȣ ��ȸ
		MemberView dto = viewService.getOneMemberData(pwd);
		String ck_pwd = dto.getPwd();
		
		if(!pwd.equals(ck_pwd)) {
			String errormessage = "�߸��� ��й�ȣ�Դϴ�";	
			
			return new ModelAndView("myPage/leave", "message", errormessage);
		}
		
		return new ModelAndView("redirect:/main.action");
	}*/

	// msj
	@RequestMapping(value = "/myBasket.action", method = { RequestMethod.GET })
	public ModelAndView myBasket() {

		// ��ٱ���(����������) ������ �̵�

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
