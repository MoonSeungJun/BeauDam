package com.pay.iamport;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("IamPort")
public class IamportController {

	@RequestMapping(value = "/iampay", method = { RequestMethod.POST })
	public ModelAndView iampay() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("iamport/iampay");
		
		return mav;
	}

}
