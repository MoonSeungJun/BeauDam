package com.pay.iamport;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;

import javax.annotation.*;
import javax.servlet.http.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.memberDAO.*;
import com.dao.productDAO.*;
import com.view.view.*;

@Controller("IamPort")
public class IamportController {

	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	@Resource(name="productService")
	private ProductServiceImpl productService;
	
	@RequestMapping(value = "/iampay.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String iampay(HttpServletRequest req) {
		
		System.out.println(req.getParameter("payResult"));
		System.out.println(req.getParameter("id"));
		System.out.println(req.getParameter("payType"));
		System.out.println(req.getParameter("msg"));
		
		String id = req.getParameter("id");
		int payResult = Integer.parseInt(req.getParameter("payResult"));
		String payType = req.getParameter("payType");
		String msg = req.getParameter("msg");
		
		String lists = req.getParameter("lists");
		String[] list = lists.split(",");
		
		String codes = req.getParameter("code");
		String[] code = codes.split(",");
		
		MemberView member = memberService.getOneMemberData(id);
		
		List<ProductView> productList = new ArrayList<ProductView>();
		for(String str : code) {		
			
			ProductView pv = productService.getOneProductData(str);
			 
			productList.add(pv);			 
			 
		}
		String str = productList.get(0).getProduct_Name() + "¿Ü " + (productList.size()-1) + "°Ç";
		req.setAttribute("pName", str);
		req.setAttribute("productList", productList);
		req.setAttribute("member", member);
		req.setAttribute("payResult", payResult);
		req.setAttribute("payType", payType);
		
		
		return "iamport/iampay";
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
