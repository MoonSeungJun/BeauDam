package com.exe.email;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class EmailController {
	
	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping(value="send", method=RequestMethod.GET)
	private String formback() {
		return "customerCenter/mailForm";
	}
	
	@RequestMapping(value="send", method=RequestMethod.POST)
	private String submit(EmailForm form, HttpServletRequest req) throws Exception {
		
		emailSender.sendEmail(form);
				
		return "redirect:/inquire.action";
	}
	
}
