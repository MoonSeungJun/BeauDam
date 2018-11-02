package com.exe.email;



import javax.mail.*;
import javax.mail.internet.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.*;

@Component
public class EmailSender {

	@Autowired
	private JavaMailSender mailSender;

	public void sendEmail(EmailForm emailForm) throws Exception {

		//메일 발송기능 제공
		MimeMessage message = mailSender.createMimeMessage();

		// 받는사람
		message.setRecipient(Message.RecipientType.TO, new InternetAddress("esteban1009@naver.com"));

		message.setSubject(emailForm.getSubject());
		
		String str = String.format("%s\n %s\n %s\n", emailForm.getId(), emailForm.getEmail(), emailForm.getContent());
		
		message.setText(str);

		mailSender.send(message);


	}

}
