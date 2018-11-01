package com.exe.beaudam;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.dao.memberDAO.*;
import com.dao.otherDAO.OtherServiceImpl;
import com.dao.productDAO.*;
import com.dao.saleDAO.*;
import com.view.view.*;
import com.dao.viewDAO.ViewServiceImpl;
import com.table.otherDTO.*;




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

	
	@Resource(name="productService")
	private ProductServiceImpl productService;
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	
	@Resource(name="saleService")
	private SaleServiceImpl saleService;
	
	
	// ********************** My Page **********************

	@RequestMapping(value = "/myPage.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPage(HttpServletRequest req) {
	
		String id = (String) req.getSession().getAttribute("id");
		
		MemberView dto = memberService.getOneMemberData(id);		
		req.setAttribute("dto", dto);
		
		int couponCount = OtherService.getCouponCount(id);		
		req.setAttribute("couponCount", couponCount);		
		
		List<SaleView> view = saleService.getPersonalSaleData(id);
		
		Iterator<SaleView> it = view.iterator();
		
		int payready = 0;
		int payCompl = 0;
		int deliReady = 0;
		int deliIng = 0;
		int deliCompl = 0;
		
		while(it.hasNext()) {
			
			SaleView vo = it.next();
			
			if(vo.getPay_Status().equals("�Աݴ��")) {
				payready++;
			}else {
				payCompl++;
			}
			
			if(vo.getDelivery_Status().equals("��ǰ �غ���") || vo.getDelivery_Status().equals("ready")) {
				deliReady++;
			}else if (vo.getDelivery_Status().equals("ing")) {
				deliIng++;
			}else {
				deliCompl++;
			}
			
			
		}		
		
		req.setAttribute("payReady", payready);
		req.setAttribute("payCompl", payCompl);
		req.setAttribute("deliReady", deliReady);
		req.setAttribute("deliIng", deliIng);
		req.setAttribute("deliCompl", deliCompl);		
		
		
		// ���������� �̵�
		return "myPage/myPage";

	}

	@RequestMapping(value = "/myInfo.action", method = RequestMethod.GET)
	public String myInfo() {

		// ���������� ��й�ȣȮ�� ������ �̵�
		return "myPage/myInfo";
	}

	@RequestMapping(value = "/myEdit.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myEdit(HttpServletRequest req) {

		
		if(req.getMethod().equalsIgnoreCase("POST")) {
			
			
			
		}
		
		
		String id = (String) req.getSession().getAttribute("id");
		
		MemberView view = memberService.getOneMemberData(id);
		req.setAttribute("dto", view);
		
		String[] birth = view.getBirth().split("-");
		
		String year = birth[0];
		String month = birth[1];
		String date = birth[2];	
		
		req.setAttribute("y", year);
		req.setAttribute("m", month);
		req.setAttribute("d", date);
		
		String[] tel = view.getCellphone().split("-");
		String ct = tel[1];
		String et = tel[2];		
		
		req.setAttribute("ct", ct);
		req.setAttribute("et", et);
		
		String[] email = view.getEmail().split("@");
		
		String fm = email[0];
		String lm = email[1];
		
		req.setAttribute("fm", fm);
		req.setAttribute("lm", lm);
		
		// ȸ������ ����2(����������) ������ �̵�
		return "myPage/myEdit";

	}
	
	@RequestMapping(value = "/memberUpdate.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String memberUpdate() {
		
		
		return "myPage/myPage";
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
	public String myLeave() {

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
	public ModelAndView myBasket(HttpServletRequest req) {

		// ��ٱ���(����������) ������ �̵�

		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPage/myBasket");

		 HttpSession session = req.getSession();
		 String id = (String) session.getAttribute("id");	

		List<BasketDTO> lists = OtherService.getBasketData(id);
		
		Iterator<BasketDTO> it = lists.iterator();
		List<BasketDTO> bList = new ArrayList<BasketDTO>();
		
		while(it.hasNext()) {
			BasketDTO dto = it.next();			
			
			ProductView pView = productService.getOneProductData(dto.getCode());
			
			dto.setThumb_Img(pView.getThumb_Img());
			bList.add(dto);
		}	
		
		mav.addObject("bList", bList);

		return mav;
	}

}
