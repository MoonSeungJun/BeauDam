package com.exe.beaudam;

import java.io.PrintWriter;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.table.memberDTO.MemberDTO;
import com.table.memberDTO.Member_InfoDTO;
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
	
	@Resource(name="otherService")
	private OtherServiceImpl otherService;
	
	
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
	
	@RequestMapping(value="/myInfo.action", method=RequestMethod.POST)
	public void myInfo_ok(HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String id = (String)session.getAttribute("id");
		String chkPwd = request.getParameter("chkPwd");
		
		MemberView dto = viewService.getOneMemberData(id);
		
		String pwd = dto.getPwd();
		
		if(pwd.equals(chkPwd)) {

			out.println("<script type='text/javascript'>");
			out.println("location.href='/beaudam/myEdit.action';");
			out.println("</script>");
			out.flush();
			
		}else {
		
			out.println("<script type='text/javascript'>");
			out.println("alert('�߸��� ��й�ȣ�Դϴ�!');");
			out.println("location.href='/beaudam/myInfo.action';");
			out.println("</script>");
			out.flush();
			
		}		
		
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
	
	@RequestMapping(value="/changePwd.action", method = RequestMethod.GET)
	public ModelAndView changePwd() {
		
		return new ModelAndView("myPage/changePwd");
		
	}
	
	
	@RequestMapping(value = "/memberUpdate.action", method = RequestMethod.POST)
	public ModelAndView memberUpdate(HttpServletRequest request,
			MemberDTO mDto, 
			Member_InfoDTO mIdto) {
		
		mDto.setNickname(request.getParameter("nickName"));
		
		memberService.updateMember(mDto);
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		
		String birth = year + "-" + month + "-" + day;
		
		mIdto.setBirth(birth);
		
		String hp1 = request.getParameter("hp1");
		String hp2 = request.getParameter("hp2");
		String hp3 = request.getParameter("hp3");
		
		String cellphone = hp1 + "-" + hp2 + "-" + hp3;
		
		mIdto.setCellphone(cellphone);
		
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		
		String email = email1 + "@" + email2;
		
		mIdto.setEmail(email);
		
		
		String phone1 = request.getParameter("phone1");
		
		if(!phone1.equals("0")) {

			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			
			String tel = phone1 + "-" + phone2 + "-" + phone3;
		
			mIdto.setTel(tel);
			
			memberService.updateMemberInfo(mIdto);
			
		}else {

			memberService.updateMemberInfoEX(mIdto);
			
		}
		
		return new ModelAndView("redirect:/myPage.action");
		
	}

	// msj
	@RequestMapping(value = "/myCoupon.action", method = RequestMethod.GET)
	public String myCoupon(HttpSession session,
			HttpServletRequest request) {

		String id = (String)session.getAttribute("id");
		List<CouponDTO> cLists = otherService.getCouponData(id);
		
		// ��������(����������) ������ �̵�
		int couponCount = otherService.getCouponCount(id);
		int couponWeekCount = otherService.getWeekCouponCount(id);
		
		request.setAttribute("couponCount", couponCount);
		request.setAttribute("couponWeekCount", couponWeekCount);
		request.setAttribute("cLists", cLists);
		
		return "myPage/myCoupon";
	}

	// msj
	@RequestMapping(value = "/myOrder.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myOrder(HttpSession session) {
		String id = (String)session.getAttribute("id");
		if(id==null||id.equals("")) {
			return new ModelAndView("redirect:/main.action");
		}
		
		
		
		List<SaleView> sLists = saleService.getPersonalSaleData(id);

		// �ֹ����� (����������) ������ �̵�

		return new ModelAndView("myPage/myOrder","sLists",sLists) ;
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
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		ModelAndView mav = new ModelAndView(); 
		if(id == null || id.equals("")) {
			mav.setViewName("beaudam/main");
			return mav;
		}	

		mav.setViewName("myPage/myBasket");

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
