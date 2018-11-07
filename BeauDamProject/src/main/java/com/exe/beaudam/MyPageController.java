package com.exe.beaudam;

import java.io.PrintWriter;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.dao.memberDAO.*;
import com.dao.otherDAO.OtherServiceImpl;
import com.dao.productDAO.*;
import com.dao.saleDAO.*;
import com.view.view.*;

import com.dao.viewDAO.ViewServiceImpl;
import com.exe.util.MyUtil;
import com.table.memberDTO.MemberDTO;
import com.table.memberDTO.Member_InfoDTO;
import com.table.otherDTO.*;




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
	
	@Autowired
	MyUtil myUtil;
	
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
			
			if(vo.getPay_Status().equals("입금대기")) {
				payready++;
			}else {
				payCompl++;
			}
			
			if(vo.getDelivery_Status().equals("상품 준비중") || vo.getDelivery_Status().equals("ready")) {
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
		
		
		// 마이페이지 이동
		return "myPage/myPage";

	}

	@RequestMapping(value = "/myInfo.action", method = RequestMethod.GET)
	public String myInfo() {

		// 마이페이지 비밀번호확인 페이지 이동
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
			out.println("alert('잘못된 비밀번호입니다!');");
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
		
		// 회원정보 수정2(마이페이지) 페이지 이동
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
		
		
		MemberView dto = memberService.getOneMemberData(id);		
		request.setAttribute("dto", dto);
				
		List<CouponDTO> cLists = otherService.getCouponData(id);
		
		// 보유쿠폰(마이페이지) 페이지 이동
		int couponCount = otherService.getCouponCount(id);
		int couponWeekCount = otherService.getWeekCouponCount(id);
		
		request.setAttribute("couponCount", couponCount);
		request.setAttribute("couponWeekCount", couponWeekCount);
		request.setAttribute("cLists", cLists);
		
		return "myPage/myCoupon";
	}

	// msj
	
	@RequestMapping(value = "/myOrder.action", method = { RequestMethod.GET, RequestMethod.POST })

	public ModelAndView myOrder(HttpSession session,HttpServletRequest req) {
		
		String id = (String)session.getAttribute("id");
		if(id==null||id.equals("")) {
			return new ModelAndView("redirect:/main.action");
		}
		String wterm = req.getParameter("weekTerm");
		String mterm = req.getParameter("monthTerm");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		List<SaleView> sLists = new ArrayList<SaleView>();
		String pageNum = req.getParameter("pageNum");		
		String cp = req.getContextPath();
		int numPerPage = 5;
		
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
			
			if(vo.getPay_Status().equals("입금대기")) {
				payready++;
			}else {
				payCompl++;
			}
			if(vo.getDelivery_Status().equals("상품 준비중") || vo.getDelivery_Status().equals("ready")) {
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
					
		
		
		
		String listUrl = cp+"/myOrder.action";
		String pageIndexList ="";
		if(wterm==null&&mterm==null&&startDate==null) {
			System.out.println("!@$@!$@!@!$@!@!널값일때$@!$!@$!@$@!@!@!$@!$@!$");
			
			req.setAttribute("alldate", "all");
					
			int dataCount = viewService.getPersonalSaleDataCount(id);
			
			System.out.println("★");
			System.out.println("count"+dataCount);
			System.out.println("★");
			
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			
			int currentPage = 1;
			
			if(pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			}
			/*if(pageNum == null) {
				pageNum="1";
			}*/
			
			if(currentPage>totalPage) {
				currentPage=totalPage;
			}
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;	
			
			HashMap<String, Object> searchSalePack = new HashMap<String, Object>();
			
			searchSalePack.put("id", id);
			searchSalePack.put("start", start);
			searchSalePack.put("end", end);
			
						
			sLists=saleService.getPersonalAllSaleData(searchSalePack);
						
			pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
		}
		
		//1주일 단위가 검색값일때
		if(wterm!=null&&!wterm.equals("")) {

		
			System.out.println("!@$@!$@!@!$@!@!일주일$@!$!@$!@$@!@!@!$@!$@!$");

			req.setAttribute("weekSearch", wterm);
						
			int dataCount = viewService.getWeeklyPersonalSaleDataCount(id);
			
			System.out.println("★");
			System.out.println("count"+dataCount);
			System.out.println("★");
			
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			int currentPage=1;
			
			if(pageNum != null)
				currentPage = Integer.parseInt(pageNum);

			if(currentPage > totalPage) {
				currentPage = totalPage;
			}

			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;	
			
			HashMap<String, Object>weekRange = new HashMap<String, Object>();
			
			weekRange.put("id", id);
			weekRange.put("start", start);
			weekRange.put("end", end);			
			
			String params = "?weekTerm="+wterm;
			if(params!=null) {
				listUrl = listUrl+params;
				}
			
			sLists = saleService.getWeekPersonalSaleData(weekRange);
			pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		}
		
		//1,3,6개월 단위가 검색 값일때
		String monthValue = "";	
		
		if(mterm!=null&&!mterm.equals("")) {
			System.out.println("!@$@!$@!@!$@!@!개월데이터$@!$!@$!@$@!@!@!$@!$@!$");
			if(mterm.equals("1")) {
			
				monthValue ="-1";
			}
		
			if(mterm.equals("3")) {
			
				monthValue ="-3";
			}
		
			if(mterm.equals("6")) {
			
				monthValue ="-6";
			}
		
		HashMap<String, Object> monthlySalePack = new HashMap<String, Object>();
			monthlySalePack.put("id", id);
			monthlySalePack.put("monthValue", monthValue);
			
		
		req.setAttribute("monthSearch", mterm);
		
		int dataCount = viewService.getMonthlyPersonalSaleDataCount(monthlySalePack);
		
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		int currentPage=1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);

		if(currentPage > totalPage) {
			currentPage = totalPage;
		}

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		HashMap<String, Object> monthRange = new HashMap<String, Object>();
		
		monthRange.put("id", id);
		monthRange.put("monthValue", monthValue);
		monthRange.put("start",start);
		monthRange.put("end", end);		
		
		String params = "?monthTerm="+mterm;
		listUrl=listUrl+params;		
		
		sLists = saleService.getMonthPersonalSaleData(monthRange);
		pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);	
		
		
		}
		
		//인풋데이트
		
		if(startDate!=null&&!startDate.equals("")) {
			
			System.out.println("!@$@!$@!@!$@!@!인풋데이터$@!$!@$!@$@!@!@!$@!$@!$");
			
			HashMap<String, Object> inputSalePack = new HashMap<String, Object>();
			
			inputSalePack.put("id", id);
			inputSalePack.put("startDate", startDate);
			inputSalePack.put("endDate",endDate);
			
			
			int dataCount = viewService.getInputDatePersonalSaleDataCount(inputSalePack);
			
			
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			int currentPage=1;
			
			if(pageNum != null)
				currentPage = Integer.parseInt(pageNum);

			if(currentPage > totalPage) {
				currentPage = totalPage;
			}

			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			HashMap<String, Object>	 inputDateRange = new HashMap<String, Object>();
			
			
			inputDateRange.put("id", id);
			inputDateRange.put("startDate", startDate);
			inputDateRange.put("endDate", endDate);
			inputDateRange.put("start", start);
			inputDateRange.put("end", end);
						
			String params = "?startDate="+startDate+"&endDate="+endDate;
			listUrl=listUrl+params;
			
			sLists = saleService.getInputDatePersonalSaleData(inputDateRange);
			
			pageIndexList= myUtil.pageIndexList(currentPage, totalPage, listUrl);	
			
			
			
			req.setAttribute("startd", startDate);
			req.setAttribute("endd", endDate);
			
		}
		
		
		req.setAttribute("pageIndexList", pageIndexList);
				
		
				
		// 주문정보 (마이페이지) 페이지 이동
		return new ModelAndView("myPage/myOrder","sLists",sLists) ;
	}
	
	@RequestMapping(value = "/myLeave.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myLeave() {

		// 주문정보 (마이페이지) 페이지 이동

		return "myPage/myLeave";
	}

	/* khn 수정 중
	@RequestMapping(value = "/myLeave_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myLeave_ok(HttpServletRequest request, HttpSession session) {
		
		// 비밀번호 정보 받아오기
		String pwd = request.getParameter("password");

		// 입력한 비밀번호 조회
		MemberView dto = viewService.getOneMemberData(pwd);
		String ck_pwd = dto.getPwd();
		
		if(!pwd.equals(ck_pwd)) {
			String errormessage = "잘못된 비밀번호입니다";	
			
			return new ModelAndView("myPage/leave", "message", errormessage);
		}
		
		return new ModelAndView("redirect:/main.action");
	}*/

	// msj
	@RequestMapping(value = "/myBasket.action", method = { RequestMethod.GET })
	public ModelAndView myBasket(HttpServletRequest req) {

		// 장바구니(마이페이지) 페이지 이동
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
