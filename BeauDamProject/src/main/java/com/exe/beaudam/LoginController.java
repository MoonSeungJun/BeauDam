package com.exe.beaudam;

import java.io.*;
import java.sql.Date;
import java.text.DateFormat;

import javax.annotation.*;
import javax.servlet.http.*;

import org.json.simple.*;
import org.json.simple.parser.*;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.dao.memberDAO.MemberServiceImpl;
import com.dao.otherDAO.OtherServiceImpl;
import com.dao.viewDAO.ViewServiceImpl;
import com.github.scribejava.core.model.*;
import com.naver.naverlogin.*;
import com.table.memberDTO.MemberDTO;
import com.table.memberDTO.Member_GradeDTO;
import com.table.memberDTO.Member_InfoDTO;
import com.table.otherDTO.CouponDTO;
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

@Controller("LoginController")
public class LoginController {

	
	/* NaverLoginBO */
	@Resource(name="naverLoginBO")
	private NaverLoginBO naverLoginBO;
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	@Resource(name="otherService")
	private OtherServiceImpl otherService;
	
	@Resource(name="viewService")
	private ViewServiceImpl viewService;
	
	
	// ********************** Beaudam Page **********************
	
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpSession session) {
		
		/* �׾Ʒ� ���� URL�� �����ϱ� ���Ͽ� getAuthorizationUrl�� ȣ�� */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        /* ������ ���� URL�� View�� ���� */
        return new ModelAndView("beaudam/login", "url", naverAuthUrl);
	}
	
	@RequestMapping(value="/login_ok.action", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView doLogin(HttpServletRequest request, HttpSession session) {
		
		// �α��� ���� �޾ƿ���
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");
		
/*		// �Է��� id ��ȸ
		
		MemberView mv = viewService.getOneMemberData(id);*/
		
//		if(mv == null) {
//			
//			String errormessage = "�������� �ʴ� ���̵��Դϴ�";
//
//			return new ModelAndView("beaudam/login", "message", errormessage);
//			
//		}

//		String ck_pwd = mv.getPwd();
		if(id.equals("beaudam") && pwd.equals("a123")) {
			
			session.setAttribute("id", id);

			return new ModelAndView("redirect:/main.action");
			
		}else {
		
			String errormessage = "�߸��� ��й�ȣ�Դϴ�";

			return new ModelAndView("beaudam/login", "message", errormessage);
		
		}
	}
	
	@RequestMapping(value = "/logout.action", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpSession session) {
		
		session.removeAttribute("id");
        
        /* ������ ���� URL�� View�� ���� */
        return new ModelAndView("redirect:/main.action");

	}
	
	@RequestMapping(value = "/callback.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		/* �׾Ʒ� ������ ���������� �Ϸ�Ǹ� code �Ķ���Ͱ� ���޵Ǹ� �̸� ���� access token�� �߱� */
		
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		
		JSONParser parser = new JSONParser();
		
		JSONObject obj1 = (JSONObject) parser.parse(apiResult);
			
		JSONObject obj2 =  (JSONObject) obj1.get("response");
		
		String id = (String) obj2.get("id");
		String nickname = (String) obj2.get("nickname");
		String gender = (String) obj2.get("gender");
		String email = (String) obj2.get("email");
		String name = (String) obj2.get("name");
		String birth = (String) obj2.get("birthday");

		session.setAttribute("id", id);
		session.setAttribute("nickname", nickname);
		
		return new ModelAndView("redirect:/main.action");
	}
	
	@RequestMapping(value = "/newTerm.action", method = RequestMethod.GET)
	public String newTerm() {

		// ��� ������ �̵�
		return "beaudam/newTerm";
	}

	@RequestMapping(value = "/newUser.action", method = RequestMethod.GET)
	public String newUser() {

		// ȸ������ ������ �̵�
		return "beaudam/newUser";
	}

	@RequestMapping(value="/checkId.action", method = RequestMethod.GET)
	public String checkId() {
		
		return "beaudam/checkId";
		
	}
	
	@RequestMapping(value = "/newUser_ok.action", method = RequestMethod.POST)
	public ModelAndView newUser_ok(HttpServletRequest request,
			MemberDTO mDto, 
			Member_InfoDTO mIdto, 
			Member_GradeDTO mGdto, 
			CouponDTO cDto) throws Exception {
		
		//member - member_Info - member_grade - coupon
		
		mDto.setNickname(request.getParameter("nickName"));
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		
		String birth = year + "-" + month + "-" + day;
		
		mIdto.setBirth(birth);
		
		String hp1 = request.getParameter("hp1");
		String hp2 = request.getParameter("hp2");
		String hp3 = request.getParameter("hp3");
		
		String cellphone = hp1 + hp2 + hp3;
		
		mIdto.setCellphone(cellphone);
		
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		
		String tel = phone1 + phone2 + phone3;
		
		mIdto.setTel(tel);
		
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		
		String email = email1 + "@" + email2;
		
		mIdto.setEmail(email);
		
		cDto.setCoupon("10%");
		
/*		System.out.println("MEMBER: " + mDto.getId() + mDto.getNickname() + mDto.getPwd());
		System.out.println("INFO1: " + mIdto.getId() + mIdto.getName() + mIdto.getBirth() + mIdto.getCellphone() + mIdto.getCity());
		System.out.println("INFO2: " + mIdto.getCreated() + mIdto.getEmail() + mIdto.getGender() + mIdto.getStreet() + mIdto.getTel());
		System.out.println(mIdto.getZip());
		System.out.println("GRADE: " + mGdto.getId());
		System.out.println("COUPON: " +cDto.getId() + cDto.getCoupon());*/
		
		memberService.insertMember(mDto);
		memberService.insertMemberInfo(mIdto);
		memberService.insertMemberGrade(mGdto);
		otherService.insertCoupon(cDto);
		
		return new ModelAndView("redirect:/login.action");
		
	}

}
