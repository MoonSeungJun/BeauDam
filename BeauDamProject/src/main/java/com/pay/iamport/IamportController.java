package com.pay.iamport;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("IamPort")
public class IamportController {

	@RequestMapping(value = "/iampay.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView iampay() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("iamport/iampay");

		auth();

		return mav;
	}

	public void auth() {
		String data = "{\"imp_key\" : \"8304328758939014\",\"imp_secret\" : \"bEzquPEmbFRvWHduwaOse0R5XMUSYDgaiQBMFf9QU1mRIzleKaGYay38kY1jBhtU84HNjQEeS05AArPk\"}";
		
		try {
	        URL url = new URL("https://api.iamport.kr/users/getToken");
	        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

	        connection.setDoInput(true);
	        connection.setDoOutput(true);
	        connection.setRequestMethod("POST");
	        connection.setRequestProperty("Accept", "application/json");
	        connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
	        OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream(), "UTF-8");
	        writer.write(data);
	        writer.close();
	        BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	        StringBuffer jsonString = new StringBuffer();
	        String line;
	        while ((line = br.readLine()) != null) {
	                jsonString.append(line);
	        }
	        System.out.println(jsonString);
	        br.close();
	        connection.disconnect();
	    } catch (Exception e) {
	            throw new RuntimeException(e.getMessage());
	    }
	}

}
