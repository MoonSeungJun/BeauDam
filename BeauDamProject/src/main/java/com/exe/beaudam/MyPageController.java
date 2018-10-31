package com.exe.beaudam;

import java.util.*;

import javax.annotation.Resource;

import javax.servlet.http.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.dao.otherDAO.OtherServiceImpl;

import com.dao.productDAO.*;
import com.table.otherDTO.BasketDTO;
import com.view.view.*;

import com.dao.viewDAO.ViewService;
import com.dao.viewDAO.ViewServiceImpl;
import com.table.otherDTO.BasketDTO;
import com.view.view.MemberView;


/*
 * 	Äõ¸® insert, delete Å×ÀÌºí ¼ø¼­
 * 	
 * 	insert ÇÒ ¶§
 * 	member - member_Info - member_grade - coupon
 * 	product - brand - img - color - basket  
 * 	adminÅ×ÀÌºí - brand
 * 	delete ÇÒ ¶§ insert ¿ª¼ø
 * 	
 * 
 * 	¸®ºä delete ÇÒ ¶§ sale_code·Î id °ËÁõ ÈÄ »èÁ¦ ½ÃÅ³ °Í
 * 	
 * 	notification delete´Â num¸¸ ÀÖÀ¸¸é »èÁ¦ µÇ¹Ç·Î °ü¸®ÀÚ °èÁ¤ÀÏ ¶§¸¸
 * 	»èÁ¦¹öÆ° È°¼ºÈ­	
 * 
 * 	DB insert ÇÊµ¶
 * 	µğÆúÆ® °ªÀÌ ÀÖ¾î Ãß°¡ÇÏÁö ¾Ê¾Æµµ µÇ´Â µ¥ÀÌÅÍ
 * 	
 * 	Member °ü·Ã ÄÃ·³
 * 	- isLeave, created, pay, grade, point, num, period, use_date
 * 
 * 	Sale °ü·Ã ÄÃ·³
 * 	- saleDate, pay_status, delivery_status
 * 
 * 	Notificaiton °ü·Ã ÄÃ·³
 * 	- num, id, hitCount, created
 * 
 * 	Review °ü·Ã ÄÃ·³
 *  - created  
 *
 *	DB update ÇÊµ¶
 *	ÆÄ¶ó¹ÌÅÍ Å¸ÀÔÀÌ ´Ùµé ´Ù¸£´Ï »ç¿ë Àü »ç¿ëÇÒ Mapper¸¦ È®ÀÎÇÒ °Í
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
	
	// ********************** My Page **********************

	@RequestMapping(value = "/myPage.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPage() {
<<<<<<< HEAD
		
=======
	
>>>>>>> ê¹€í•´ë‚˜ë¸Œëœì¹˜
		// ¸¶ÀÌÆäÀÌÁö ÀÌµ¿
		return "myPage/myPage";
	}

	@RequestMapping(value = "/myInfo.action", method = RequestMethod.GET)
	public String myInfo() {

		// ¸¶ÀÌÆäÀÌÁö ºñ¹Ğ¹øÈ£È®ÀÎ ÆäÀÌÁö ÀÌµ¿
		return "myPage/myInfo";
	}

	@RequestMapping(value = "/myEdit.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myEdit() {

		// È¸¿øÁ¤º¸ ¼öÁ¤2(¸¶ÀÌÆäÀÌÁö) ÆäÀÌÁö ÀÌµ¿
		return "myPage/myEdit";

	}

	// msj
	@RequestMapping(value = "/myCoupon.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myCoupon() {

		// º¸À¯ÄíÆù(¸¶ÀÌÆäÀÌÁö) ÆäÀÌÁö ÀÌµ¿

		return "myPage/myCoupon";
	}

	// msj
	@RequestMapping(value = "/myOrder.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myOrder() {

		// ÁÖ¹®Á¤º¸ (¸¶ÀÌÆäÀÌÁö) ÆäÀÌÁö ÀÌµ¿

		return "myPage/myOrder";
	}
	
	@RequestMapping(value = "/myLeave.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myLeave() {

		// ÁÖ¹®Á¤º¸ (¸¶ÀÌÆäÀÌÁö) ÆäÀÌÁö ÀÌµ¿

		return "myPage/myLeave";
	}

	/* khn ¼öÁ¤ Áß
	@RequestMapping(value = "/myLeave_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myLeave_ok(HttpServletRequest request, HttpSession session) {
		
		// ºñ¹Ğ¹øÈ£ Á¤º¸ ¹Ş¾Æ¿À±â
		String pwd = request.getParameter("password");

		// ÀÔ·ÂÇÑ ºñ¹Ğ¹øÈ£ Á¶È¸
		MemberView dto = viewService.getOneMemberData(pwd);
		String ck_pwd = dto.getPwd();
		
		if(!pwd.equals(ck_pwd)) {
			String errormessage = "Àß¸øµÈ ºñ¹Ğ¹øÈ£ÀÔ´Ï´Ù";	
			
			return new ModelAndView("myPage/leave", "message", errormessage);
		}
		
		return new ModelAndView("redirect:/main.action");
	}*/

	// msj
	@RequestMapping(value = "/myBasket.action", method = { RequestMethod.GET })
	public ModelAndView myBasket(HttpServletRequest req) {

		// Àå¹Ù±¸´Ï(¸¶ÀÌÆäÀÌÁö) ÆäÀÌÁö ÀÌµ¿

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
