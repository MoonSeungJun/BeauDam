package com.exe.beaudam;

import java.io.*;

import javax.annotation.*;
import javax.servlet.http.*;

import org.json.simple.*;
import org.json.simple.parser.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.github.scribejava.core.model.*;
import com.naver.naverlogin.*;

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

@Controller
public class LoginController {

	
	/* NaverLoginBO */
	@Resource(name="naverLoginBO")
	private NaverLoginBO naverLoginBO;


	
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
		
		// 입력한 id 조회

		if(id.equals("beaudam") && pwd.equals("a123")) {
			
			session.setAttribute("id", id);

			return new ModelAndView("redirect:/main.action");
			
		}else {
		
			String errormessage = "아이디 또는 비밀번호가 잘못되었습니다.";

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

		/*return new ModelAndView("beaudam/callback","result",result);*/
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

	@RequestMapping(value = "/main.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		
		// 메인 페이지 이동
		return new ModelAndView("beaudam/main","id",id);
	}

}
