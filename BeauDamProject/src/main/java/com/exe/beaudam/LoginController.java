package com.exe.beaudam;

import java.io.*;

import java.util.HashMap;

import javax.annotation.*;
import javax.servlet.http.*;

import org.json.simple.*;
import org.json.simple.parser.*;

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
	
	HashMap<String, Object> info = new HashMap<String, Object>();

	/* NaverLoginBO */
	@Resource(name = "naverLoginBO")
	private NaverLoginBO naverLoginBO;

	@Resource(name = "memberService")
	private MemberServiceImpl memberService;

	@Resource(name = "otherService")
	private OtherServiceImpl otherService;

	@Resource(name = "viewService")
	private ViewServiceImpl viewService;

	// ********************** Beaudam Page **********************

	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpSession session) {

		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		request.setAttribute("popup", request.getParameter("popup"));
		/* 생성한 인증 URL을 View로 전달 */
		return new ModelAndView("beaudam/login", "url", naverAuthUrl);
	}

	@RequestMapping(value = "/login_ok.action", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView login_ok(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		// 로그인 정보 받아오기
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");
		String popup = request.getParameter("popup");

		// 입력한 id 조회

		MemberView dto = viewService.getOneMemberData(id);

		if (dto == null) {

			String errormessage = "존재하지 않는 아이디입니다";

			return new ModelAndView("beaudam/login", "message", errormessage);

		}

		int leave_ck = dto.getIsLeave();

		if (leave_ck == 1) {
			String errormessage2 = "탈퇴한 회원입니다.";

			return new ModelAndView("beaudam/login", "message", errormessage2);
		}

		String ck_pwd = dto.getPwd();

		if (pwd.equals(ck_pwd)) {

			session.setAttribute("id", id);

			if (popup == "1" || popup.equals("1")) {

				response.setContentType("text/html; charset=UTF-8");

				PrintWriter out = response.getWriter();

				out.println("<script type='text/javascript'>");
				out.println("opener.parent.location.reload();");
				out.println("window.close();");
				out.println("</script>");
				out.flush();

			} else {

				return new ModelAndView("redirect:/main.action");

			}
		}

		String errormessage = "잘못된 비밀번호입니다";

		return new ModelAndView("beaudam/login", "message", errormessage);

	}

	@RequestMapping(value = "/callback.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callback(@RequestParam String code,
			@RequestParam String state,
			HttpSession session,
			HttpServletRequest request)
			throws IOException, ParseException {
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */

		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String apiResult = naverLoginBO.getUserProfile(oauthToken);

		JSONParser parser = new JSONParser();

		JSONObject obj1 = (JSONObject) parser.parse(apiResult);

		JSONObject obj2 = (JSONObject) obj1.get("response");

		String id = (String) obj2.get("id");
		String nickname = (String) obj2.get("nickname");
		String gender = (String) obj2.get("gender");
		String email = (String) obj2.get("email");
		String name = (String) obj2.get("name");
		String birth = (String) obj2.get("birthday");
			
		info.put("id", id);
		info.put("nickname", nickname);
		info.put("gender", gender);
		info.put("email", email);
		info.put("name", name);
		info.put("birth", birth);
		
		MemberView dto = viewService.getOneMemberData(id);
		
		if (dto == null) {
			
			return new ModelAndView("redirect:/newUserNaver.action");
			
		}

		session.setAttribute("id", id);

		return new ModelAndView("redirect:/main.action");
		
	}

	@RequestMapping(value = "/searchIdPwd.action", method = RequestMethod.GET)
	public ModelAndView searchIdPwd() {

		return new ModelAndView("beaudam/searchIdPwd");

	}

	@RequestMapping(value = "/searchId.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchId(HttpServletRequest request) {

		HashMap<String, Object> nameBirth = new HashMap<String, Object>();

		nameBirth.put("name", request.getParameter("name"));
		nameBirth.put("birth", request.getParameter("birth"));

		String resultId = viewService.getSearchId(nameBirth);

		return new ModelAndView("beaudam/searchId", "resultId", resultId);

	}

	@RequestMapping(value = "/searchPwd.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchPwd(HttpServletRequest request) {

		HashMap<String, Object> nameEmail = new HashMap<String, Object>();

		nameEmail.put("id", request.getParameter("searchId"));
		nameEmail.put("name", request.getParameter("name"));
		nameEmail.put("email", request.getParameter("email"));

		String resultPwd = viewService.getSearchPwd(nameEmail);

		return new ModelAndView("beaudam/searchPwd", "resultPwd", resultPwd);

	}

	@RequestMapping(value = "/logout.action", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		out.println("<script type='text/javascript'>");
		out.println("var result=confirm('로그아웃하시겠습니까?');");
		out.println("if(result==true){");
		out.println("location.href='/beaudam/logout_ok.action';");
		out.println("}else{");
		out.println("location.href='/beaudam/main.action';");
		out.println("}");
		out.println("</script>");
		out.flush();

	}

	@RequestMapping(value = "/logout_ok.action", method = RequestMethod.GET)
	public ModelAndView logout_ok(HttpServletRequest request, HttpSession session) {

		session.removeAttribute("id");
		return new ModelAndView("redirect:/main.action");

	}

	@RequestMapping(value = "/newTerm.action", method = RequestMethod.GET)
	public ModelAndView newTerm() {

		// 약관 페이지 이동
		return new ModelAndView("beaudam/newTerm");

	}

	@RequestMapping(value = "/newUser.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView newUser(HttpServletRequest request) {

		String newId = request.getParameter("newId");

		// 회원가입 페이지 이동
		return new ModelAndView("beaudam/newUser", "newId", newId);

	}
	
	@RequestMapping(value = "/newUserNaver.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView newUserNaver(HttpServletRequest request) {
		
		System.out.println("info.get" + info.get("id"));
		
		request.setAttribute("id", info.get("id"));
		request.setAttribute("nickName", info.get("nickname"));
		request.setAttribute("gender", info.get("gender"));
		request.setAttribute("email", info.get("email"));
		request.setAttribute("name", info.get("name"));
		request.setAttribute("birth", info.get("birth"));
		
		return new ModelAndView("beaudam/newUserNaver");
		
	}

	@RequestMapping(value = "/checkId.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView checkId(HttpServletRequest request) {

		String flag = "false";

		String ck_id = request.getParameter("ck_id");

		MemberView dto = viewService.getOneMemberData(ck_id);

		if (dto != null)
			flag = "true";

		request.setAttribute("ck_id", ck_id);
		request.setAttribute("flag", flag);

		return new ModelAndView("beaudam/checkId");

	}

	@RequestMapping(value = "/newUser_ok.action", method = RequestMethod.POST)
	public ModelAndView newUser_ok(HttpServletRequest request, MemberDTO mDto, Member_InfoDTO mIdto,
			Member_GradeDTO mGdto, CouponDTO cDto) throws Exception {

		// member - member_Info - member_grade - coupon

		String birth;
		
		mDto.setNickname(request.getParameter("nickName"));

		memberService.insertMember(mDto);

		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");

		if(year!=null) {
			birth = year + "-" + month + "-" + day;
		} else {
			birth = request.getParameter("birth");
		}
		
		mIdto.setBirth(birth);

		String hp1 = request.getParameter("hp1");
		String hp2 = request.getParameter("hp2");
		String hp3 = request.getParameter("hp3");

		String cellphone = hp1 + "-" + hp2 + "-" + hp3;

		mIdto.setCellphone(cellphone);

		String email;
		String email1 = request.getParameter("email1");
		if(email1!=null) {
			String email2 = request.getParameter("email2");
			email = email1 + "@" + email2;
		} else {
			email = request.getParameter("email");
		}
		mIdto.setEmail(email);

		cDto.setCoupon("20%");

		String phone1 = request.getParameter("phone1");

		if (!phone1.equals("0")) {

			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");

			String tel = phone1 + "-" + phone2 + "-" + phone3;

			mIdto.setTel(tel);

			memberService.insertMemberInfo(mIdto);

		} else {

			memberService.insertMemberInfoEX(mIdto);

		}

		memberService.insertMemberGrade(mGdto);
		otherService.insertCoupon(cDto);

		return new ModelAndView("redirect:/login.action");

	}

}
