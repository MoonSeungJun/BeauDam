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
		
		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        /* 생성한 인증 URL을 View로 전달 */
        return new ModelAndView("beaudam/login", "url", naverAuthUrl);
	}
	
	@RequestMapping(value="/login_ok.action", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView doLogin(HttpServletRequest request, HttpSession session) {
		
		// 로그인 정보 받아오기
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");
		
/*		// 입력한 id 조회
		
		MemberView mv = viewService.getOneMemberData(id);*/
		
//		if(mv == null) {
//			
//			String errormessage = "존재하지 않는 아이디입니다";
//
//			return new ModelAndView("beaudam/login", "message", errormessage);
//			
//		}

//		String ck_pwd = mv.getPwd();
		if(id.equals("beaudam") && pwd.equals("a123")) {
			
			session.setAttribute("id", id);

			return new ModelAndView("redirect:/main.action");
			
		}else {
		
			String errormessage = "잘못된 비밀번호입니다";

			return new ModelAndView("beaudam/login", "message", errormessage);
		
		}
	}
	
	@RequestMapping(value = "/logout.action", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpSession session) {
		
		session.removeAttribute("id");
        
        /* 생성한 인증 URL을 View로 전달 */
        return new ModelAndView("redirect:/main.action");

	}
	
	@RequestMapping(value = "/callback.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
		
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

		// 약관 페이지 이동
		return "beaudam/newTerm";
	}

	@RequestMapping(value = "/newUser.action", method = RequestMethod.GET)
	public String newUser() {

		// 회원가입 페이지 이동
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
