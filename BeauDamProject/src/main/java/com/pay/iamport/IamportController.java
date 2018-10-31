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
import com.dao.otherDAO.*;
import com.dao.productDAO.*;
import com.dao.saleDAO.*;
import com.table.memberDTO.*;
import com.table.saleDTO.*;
import com.view.view.*;

@Controller("IamPort")
public class IamportController {

	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	@Resource(name = "otherService")
	private OtherServiceImpl otherService;
	
	@Resource(name="productService")
	private ProductServiceImpl productService;
	
	@Resource(name="saleService")
	private SaleServiceImpl saleService;
	
	@RequestMapping(value = "/iampay.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String iampay(HttpServletRequest req) {
		
		int payResult = Integer.parseInt(req.getParameter("payResult"));
		String payType = req.getParameter("payType");
		String id = req.getParameter("id");
		String lists = req.getParameter("lists");//basket_Num 들어있다
		String msg = req.getParameter("msg");
		String codes = req.getParameter("code");
		int couponNum = Integer.parseInt(req.getParameter("coupon"));		
		int point = Integer.parseInt(req.getParameter("point"));
		String qtys = req.getParameter("qty");
		
		
		MemberView member = memberService.getOneMemberData(id);
		
		List<ProductView> productList = new ArrayList<ProductView>();
		String[] code = codes.split(",");
		for(String str : code) {		
			
			ProductView pv = productService.getOneProductData(str);
			 
			productList.add(pv);			 
			 
		}
		String str = productList.get(0).getProduct_Name() + "외 " + (productList.size()-1) + "건";
		req.setAttribute("pName", str);
		req.setAttribute("productList", productList);
		req.setAttribute("member", member);
		req.setAttribute("payResult", payResult); //결제금액
		req.setAttribute("payType", payType); //
		req.setAttribute("lists", lists);
		req.setAttribute("coupon", couponNum);
		req.setAttribute("msg", msg);
		req.setAttribute("point", point);
		req.setAttribute("qty", qtys);
		req.setAttribute("code", codes);
		
		
		return "iamport/iampay";
	}

	/*public void auth() {
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
//	        System.out.println(jsonString);
	        br.close();
	        connection.disconnect();
	    } catch (Exception e) {
	            throw new RuntimeException(e.getMessage());
	    }
	}*/
	
	
	@RequestMapping(value = "/payOK.action", method = {RequestMethod.GET,	 RequestMethod.POST })
	public String payOK(HttpServletRequest req) {

//		넘어온 값 받아서 정리		
		String payType = req.getParameter("payType");
		String id = req.getParameter("id");
		String msg = req.getParameter("msg");
		String codes = req.getParameter("code"); //배열
		String payResultstr = req.getParameter("payResult");
		String couponNumstr = req.getParameter("coupon");
		String pointstr = req.getParameter("point");
		String lists = req.getParameter("lists"); //배열
		String qtysstr = req.getParameter("qty"); //배열
		
		
		String[] code = codes.split(",");
		String[] basketNumstr = lists.split(",");
		String[] qtystr = qtysstr.split(",");
		
		int payResult = Integer.parseInt(payResultstr);
		int couponNum = Integer.parseInt(couponNumstr);
		int point = Integer.parseInt(pointstr);
		int[] basketNum = new int[basketNumstr.length];
		int[] qty = new int[qtystr.length];		
		
		if(couponNum == 1) {					
			point = 0;
		}
		
		for(int i=0;i<basketNumstr.length;i++) {			
			basketNum[i] = Integer.parseInt(basketNumstr[i]);
		}
		
		for(int i=0;i>qtystr.length;i++) {
			qty[i] = Integer.parseInt(qtystr[i]);
		}

		//sale insert
		Sale_DateDTO dateDTO = new Sale_DateDTO();
		Sale_ProductDTO productDTO = new Sale_ProductDTO();
		Sale_ClientDTO clientDTO = new Sale_ClientDTO();
		
		for(int i=0;i<code.length;i++) {
			String saleCode = saleService.getMaxSaleCode();
			if(saleCode == null || saleCode.equals("")) {				
				saleCode = "0";				
			}
			saleCode = Integer.toString((Integer.parseInt(saleCode)+1));	
			
			dateDTO.setSale_Code(saleCode);
			dateDTO.setPayment_Method(payType);
			
			if(couponNum != 1) {
				String couponName = otherService.selectCouponData(couponNum);
				dateDTO.setUse_Coupon(couponName);
			}else {
				dateDTO.setUse_Coupon("-");
			}		
			
			dateDTO.setUse_Point(point);
			dateDTO.setTotal_Price(payResult);
		
			saleService.insertSaleDate(dateDTO);
			
			productDTO.setSale_Code(saleCode);
			productDTO.setCode(code[i]);
			ProductView view = productService.getOneProductData(code[i]);
			productDTO.setBrand(view.getBrand());
			productDTO.setProduct_Name(view.getProduct_Name());
			productDTO.setProduct_Price(view.getProduct_Price());
			productDTO.setColor_Code(view.getColor_Code());
			productDTO.setQty(qty[i]);
			
			saleService.insertSaleProduct(productDTO);
			
			clientDTO.setSale_Code(saleCode);
			clientDTO.setId(id);
			MemberView memberView = memberService.getOneMemberData(id);
			clientDTO.setName(memberView.getName());
			clientDTO.setTel(memberView.getTel());
			clientDTO.setCellphone(memberView.getCellphone());
			clientDTO.setAddr(memberView.getZip()+memberView.getCity()+memberView.getStreet());
			clientDTO.setMessage(msg);
			
			saleService.insertSaleClient(clientDTO);
		}
		
		
		System.out.println("OK2");
		
		
		
		//product update
		//재고 업데이트
		for(int i=0;i<code.length;i++) {
			
			ProductView productView = productService.getOneProductData(code[i]);
			int quantity = productView.getQty()-qty[i];		
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("code", code[i]);
			map.put("qty", quantity);			
			productService.updateQty(map);		
			
		}		
		
		
		System.out.println("OK3");
		
		
		//basket delete		
		//장바구니 초기화
		otherService.deleteAllBasket(id);
		
		
		System.out.println("OK4");
		
		
		//member update
		MemberView view = memberService.getOneMemberData(id);
		Member_GradeDTO dto = new Member_GradeDTO();
		dto.setId(id);
		dto.setPay(view.getPay()+payResult);
		
		if(point == 0) {
			int getPoint = (int) (payResult*0.1);
			dto.setPoint(view.getPoint()+getPoint);
		}else {
			dto.setPoint(view.getPoint()-point);
		}
		
		
		
		if(dto.getPay() >= 10000) {
			dto.setGrade("Silver");
		}else if(dto.getPay() >= 50000) {
			dto.setGrade("Gold");
		}else if(dto.getPay() >= 0) {
			dto.setGrade(view.getGrade());
		}	
		
		
		System.out.println("OK5");
		
		
		//coupon update
		if(couponNum != 1) {	
			
			otherService.updateCoupon(couponNum);
			
			
		}
		return "redirect:/main.action";
	}

}
