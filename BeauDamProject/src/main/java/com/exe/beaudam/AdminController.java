package com.exe.beaudam;

import java.io.*;
import java.util.*;

import javax.annotation.*;
import javax.servlet.http.*;

import org.json.simple.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import com.dao.adminDAO.*;
import com.dao.memberDAO.*;
import com.dao.productDAO.*;
import com.dao.saleDAO.*;
import com.dao.viewDAO.*;
import com.file.upload.*;
import com.table.adminDTO.*;
import com.table.memberDTO.*;
import com.table.productDTO.*;
import com.table.saleDTO.*;
import com.view.view.*;

@Controller("AdminController")
public class AdminController {	
	
	@Resource(name="adminService")
	private AdminServiceImpl adminService;

	@Resource(name="viewService")
	private ViewServiceImpl viewService1;


	@Resource(name="productService")
	private ProductServiceImpl productService;
	
	@Resource(name="saleService")
	private SaleServiceImpl saleService;
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	// ********************** Admin Page **********************

	//주문조회
	@RequestMapping(value = "/adminOrder.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminOrder(HttpServletRequest req) {

		
		if(req.getMethod().equalsIgnoreCase("POST")) {
			
			String sale_Code = req.getParameter("sale_Code");
			String delivery_Status = req.getParameter("delState");
			String pay_Status = req.getParameter("payState");
			
			
			SaleView dto = saleService.getOneSaleData(sale_Code);
			
			
			
			dto.setPay_Status(pay_Status);
			dto.setDelivery_Status(delivery_Status);
			
			saleService.updateSaleDate(dto);
			
		}
		
		
		int pay_ready = 0;			
		int pay_compl = 0;
		
		int ready = 0;
		int ing = 0;
		int compl = 0;
		
		int refund = 0;
		int cancel = 0;
		int change = 0;
		List<SaleView> saleView = saleService.getAllSaleData();
		
		Iterator<SaleView> it = saleView.iterator();
		
		while(it.hasNext()) {
			
			SaleView vo = it.next();			
			
			if(vo.getPay_Status().equals("pay_ready")) {
				pay_ready++;
				System.out.println(pay_ready + "payR");
			}
			if (vo.getPay_Status().equals("pay_compl")) {
				pay_compl++;
				System.out.println(pay_compl + "payCom");
			}
			if (vo.getPay_Status().equals("refund")) {
				refund++;
				System.out.println(refund + "refun");
			}
			if (vo.getPay_Status().equals("cancel")) {
				cancel++;
				System.out.println(cancel + "canc");
			}
			if (vo.getDelivery_Status().equals("ready")) {
				ready++;
				System.out.println(ready + "rea");
			}
			if (vo.getDelivery_Status().equals("ing")) {
				ing++;
				System.out.println(ing + "ing");
			}
			if (vo.getDelivery_Status().equals("compl")) {
				compl++;
				System.out.println(compl + "compl");
			}
			if(vo.getPay_Status().equals("change")) {
				change++;
				System.out.println(change + "chan");
			}
			
		}
		
		req.setAttribute("payReady", pay_ready);
		req.setAttribute("payCompl", pay_compl);
		req.setAttribute("refund", refund);
		req.setAttribute("cancel", cancel);
		req.setAttribute("ready", ready);
		req.setAttribute("ing", ing);
		req.setAttribute("compl", compl);
		req.setAttribute("change", change);
		req.setAttribute("saleList", saleView);
			
	
		// 주문내역 관리 페이지 이동
		return "admin/adminOrder";
	}

	@RequestMapping(value = "/adminOrderUpdate", method = { RequestMethod.GET, RequestMethod.POST })

	public String adminOrderUpdate(SaleView dto, HttpServletRequest request) {

		saleService.updateSaleDate(dto);


		return "admin/adminOrder";
	}


	//esteban
	@RequestMapping(value = "/adminSales.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminSales(HttpServletRequest request) {

		String yearSearchValue = request.getParameter("yearSearchValue");
		
		if(yearSearchValue==null||yearSearchValue.equals("")) {
			yearSearchValue= "2018";			
		}	
		
		String yearSearchValue1 = yearSearchValue+"-01";
		String yearSearchValue2 = yearSearchValue+"-12";
	
		
		HashMap<String, Object> yearSearchPack = new HashMap<String, Object>();
		yearSearchPack.put("yearSearchValue1", yearSearchValue1);
		yearSearchPack.put("yearSearchValue2", yearSearchValue2);
		
		
		
		List<Sale_DateDTO> daySales = saleService.getAdminDaySales();
		List<Sale_DateDTO> monthSales = saleService.getAdminMonthSales(yearSearchPack);
		List<Sale_DateDTO> yearSales = saleService.getAdminYearSales();	
		List<Sale_DateDTO> yearsList = saleService.getSalesYears();
				
		request.setAttribute("daySales", daySales);
		request.setAttribute("monthSales", monthSales);
		request.setAttribute("yearSales", yearSales);
		request.setAttribute("yearsList", yearsList);
		request.setAttribute("yearSearchValue", yearSearchValue);
		
		// 매출 페이지 이동
		return "admin/adminSales";
	}

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//상품조회아작스 -- 수정해야함
	@RequestMapping(value = "/adminProductViewAjax.action", method = { RequestMethod.GET, RequestMethod.POST })
	public void adminProductAjax(HttpServletResponse resp, HttpServletRequest req, String code,String brand,String category,String type,String productName) {		

		Map<String, Object> map = new HashMap<String, Object>();		
		if(code==null||code.equals("")) {
			code = "";
			map.put("code", code);
		}else {
			map.put("code", code);
		}
		if(brand==null||brand.equals("") || brand.equals("선택")) {
			brand = "";
			map.put("brand", brand);
		}else {
			map.put("brand", brand);
		}
		if(category==null||category.equals("")||category.equals("선택")) {
			category = "";
			map.put("category", category);
		}else {
			map.put("category", category);
		}
		if(type==null||type.equals("")||type.equals("선택")) {
			type = "";
			map.put("type", type);
		}else {
			map.put("type", type);
		}
		if(productName==null||productName.equals("")) {
			productName = "";
			map.put("productName", productName);
		}else {
			map.put("productName", productName);
		}		

		try {

			List<ProductView> productList = productService.getAllProductData(map);
			JSONArray jarray = new JSONArray();			

			for(int i=0;i<productList.size();i++) {
				Object codeVO = productList.get(i).getCode();
				Object brandVO = productList.get(i).getBrand();
				Object categoryVO = productList.get(i).getCategory();
				Object typeVO = productList.get(i).getType();
				Object productNameVO = productList.get(i).getProduct_Name();
				Object colorCodeVO = productList.get(i).getColor_Code();
				Object colorNameVO = productList.get(i).getColor_Name();
				Object productPrice = productList.get(i).getProduct_Price();				
				Object qty = productList.get(i).getQty();				

				jarray.add(codeVO);
				jarray.add(brandVO);
				jarray.add(categoryVO);
				jarray.add(typeVO);
				jarray.add(productNameVO);
				jarray.add(colorCodeVO);
				jarray.add(colorNameVO);
				jarray.add(productPrice);				
				jarray.add(qty);						

			}			

			PrintWriter pw = resp.getWriter();
			pw.print(jarray.toString());
			pw.flush();
			pw.close();

			//페이징 처리 추가		

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	
	//상품 등록 접속
	@RequestMapping(value = "/adminProduct_new.action", method = { RequestMethod.GET})
	public String admin_new_product(HttpServletRequest req) {
		
		// 상품등록 페이지 이동 시 셀렉트박스 출력				
		List<Admin_BrandDTO> brand = adminService.getAdminBrand();
		List<Admin_CategoryDTO> cate = adminService.getAdminCategory();

		
		//상품 등록 페이지 이동 시 상품 리스트 출력
		List<ProductView> lists = productService.getProductList();

		req.setAttribute("productList", lists);					
		req.setAttribute("brand", brand);
		req.setAttribute("cate", cate);
		
		
		return "admin/adminProduct_new";	
		
	}
	
	
	
	
	//상품 등록 버튼 클릭
	@RequestMapping(value="/adminProduct_new.action",method=RequestMethod.POST)
	public ModelAndView admin_add_product( @RequestParam("thumbImg")MultipartFile f1, @RequestParam("detailImg")MultipartFile f2, ProductUpload command, HttpServletRequest req) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/adminProduct_new.action");

		//				if(f1 == null || f1.equals("") || f2 == null || f2.equals("")) {
		//					return mav;
		//				}

		try {

			String originalFN1 = new String(f1.getOriginalFilename().getBytes("8859_1"),"UTF-8");
			String originalFN2 = new String(f2.getOriginalFilename().getBytes("8859_1"),"UTF-8");

			String ext1 = originalFN1.substring(originalFN1.lastIndexOf('.'));
			String ext2 = originalFN2.substring(originalFN2.lastIndexOf('.'));	

			String saveFileName1 = UUID.randomUUID().toString().replaceAll("-", "") + ext1;
			String saveFileName2 = UUID.randomUUID().toString().replaceAll("-", "") + ext2;	

			String thumbPath = req.getSession().getServletContext().getRealPath("/thumbImg");
			String detailPath = req.getSession().getServletContext().getRealPath("/detailImg");

			File tp = new File(thumbPath);
			File dp = new File(detailPath);

			if(!tp.exists()) {
				tp.mkdirs();
			}
			if(!dp.exists()) {
				dp.mkdirs();
			}		

			File serverFile;

			serverFile = new File(thumbPath + File.separator + saveFileName1);		
			f1.transferTo(serverFile);



			serverFile = new File(detailPath + File.separator + saveFileName2);	
			f2.transferTo(serverFile);			

			ProductDTO product = new ProductDTO();
			BrandDTO brand = new BrandDTO();
			ColorDTO color = new ColorDTO();
			ImgDTO img = new ImgDTO();          

			product.setCode(command.getCode());
			product.setProductName(command.getProductName());
			product.setProductPrice(Integer.parseInt(command.getPrice()));

			brand.setBrand(command.getBrand());
			brand.setCategory(command.getCategory());
			brand.setCode(command.getCode());
			brand.setType(command.getType());

			color.setCode(command.getCode());
			color.setColorCode(command.getColorCode());
			color.setColorName(command.getColor());
			color.setQty(Integer.parseInt(command.getCount()));

			img.setCode(command.getCode());
			img.setDetail_Img(saveFileName2);
			img.setThumb_Img(saveFileName1);


			ProductView dto = productService.getOneProductData(command.getCode());

		
			if(dto != null) {				
				return mav;            	
			}

			productService.insertProduct(product);
			productService.insertBrand(brand);
			productService.insertColor(color);
			productService.insertImg(img);          

		} catch (FileNotFoundException e) {			

		}

		return mav;

	}


	//회원관리
	@RequestMapping(value = "/adminUser.action", method = { RequestMethod.GET, RequestMethod.POST})	
	public String admin_user(HttpServletRequest req) {
		// 회원관리 페이지 이동			

		if(req.getMethod().equalsIgnoreCase("POST")) {
			Member_InfoDTO mv = new Member_InfoDTO();		

			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String tel = req.getParameter("tel");
			String cellphone = req.getParameter("cellphone");
			String birth = req.getParameter("birth");			

			if(id != null && !id.equals("")) {
				mv.setId(id);
			}else {
				id = "";
				mv.setId(id);
			}
			if(name != null && !name.equals("")) {
				mv.setName(name);
			}else {
				name = "";
				mv.setName(name);
			}
			if(tel != null && !tel.equals("")) {
				mv.setTel(tel);
			}else {
				tel = "";
				mv.setTel(tel);
			}
			if(cellphone != null && !cellphone.equals("")) {
				mv.setCellphone(cellphone);
			}else {
				cellphone = "";
				mv.setCellphone(cellphone);
			}
			if(birth != null && !birth.equals("")) {
				mv.setBirth(birth);
			}else {
				birth = "";
				mv.setBirth(birth);
			}

			List<MemberView> lists = viewService1.getSearchMemberData(mv);

			req.setAttribute("searchList", lists);

			return "admin/adminUser"; 

		}

		List<MemberView> memberList = viewService1.getAllMemberData();		
		req.setAttribute("memberList", memberList);


		return "admin/adminUser";		

	}




	//셀렉트박스 아작스
	@RequestMapping(value="/adminProductAjax.action", method=RequestMethod.POST)
	public void productAjax(HttpServletRequest req, HttpServletResponse resp, String params, String brand) {

		try {

			String category = params;

			Map<String, Object> map = new HashMap<String, Object>();

			if(brand.equals("선택")) {
				brand = "";
				map.put("brand", brand);
			}

			map.put("brand", brand);
			map.put("category", category);

			List<AdminView> typeList = adminService.getAdminTypeData(map);			
			JSONArray jArray = new JSONArray();			

			for(int i=0;i<typeList.size();i++) {
				Object str = typeList.get(i).getType();				
				jArray.add(str);				
			}			

			PrintWriter pw = resp.getWriter();
			pw.print(jArray.toString());
			pw.flush();
			pw.close();		

		} catch (Exception e) {			
			e.printStackTrace();
		}

	}


	//type 추가 아작스
	@RequestMapping(value="/adminBrandAjax.action", method=RequestMethod.POST)
	public void brandAjax(HttpServletRequest req, HttpServletResponse resp, String cate) {

		try {

			String category = cate;

			Map<String, Object> map = new HashMap<String, Object>();			

			map.put("category", category);

			List<AdminView> typeList = adminService.getAdminTypeData(map);			
			JSONArray jArray = new JSONArray();			

			for(int i=0;i<typeList.size();i++) {
				Object str = typeList.get(i).getType();

				jArray.add(str);				
			}			

			PrintWriter pw = resp.getWriter();
			pw.print(jArray.toString());
			pw.flush();
			pw.close();		

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	//브랜드 추가삭제
	@RequestMapping(value = "/adminBrand.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminBrand(HttpServletRequest req) {
		// 브랜드 관리 페이지 이동		

		//브랜드 추가
		String addBrand = req.getParameter("addbrand");

		if(addBrand != null && !addBrand.equals("")) {				
			Admin_BrandDTO dto = new Admin_BrandDTO();			
			dto.setBrand(addBrand);	
			req.removeAttribute("addbrand");				
			adminService.insertBrand(dto);			
			return "redirect:/adminBrand.action";
		}

		//브랜드 삭제
		String delBrand = req.getParameter("delbrand");				
		if(delBrand != null && !delBrand.equals("")) {				
			req.removeAttribute("delBrand");			
			adminService.deleteBrand(delBrand);			
			return "redirect:/adminBrand.action";
		}

		//카테고리 추가
		String addCate = req.getParameter("addCate");
		if(addCate != null && !addCate.equals("")) {				
			Admin_CategoryDTO dto = new Admin_CategoryDTO();			
			dto.setCategory(addCate);
			req.removeAttribute("addCate");		
			adminService.insertCategory(dto);			
			return "redirect:/adminBrand.action";
		}
		//카테고리 삭제
		String delCate = req.getParameter("delCate");						
		if(delCate != null && !delCate.equals("")) {				
			req.removeAttribute("delCate");			
			adminService.deleteCategory(delCate);
			adminService.deleteCateType(delCate);
			return "redirect:/adminBrand.action";
		}

		//타입 추가
		String addType = req.getParameter("addType");
		String addCategory = req.getParameter("addCategory");


		if(addType != null && !addType.equals("")) {				
			Admin_TypeDTO dto = new Admin_TypeDTO();			
			dto.setType(addType);
			dto.setCategory(addCategory);
			req.removeAttribute("addType");			
			adminService.insertType(dto);			
			return "redirect:/adminBrand.action";
		}
		//타입 삭제
		String delType = req.getParameter("delType");
		if(delType != null && !delType.equals("")) {				
			req.removeAttribute("delType");			
			adminService.deleteType(delType);			
			return "redirect:/adminBrand.action";
		}

		//관리 페이지 이동


		List<Admin_CategoryDTO> category = adminService.getAdminCategory();
		List<Admin_BrandDTO> brand = adminService.getAdminBrand();
		List<Admin_TypeDTO> type = adminService.getAdminType();

		req.setAttribute("brand", brand);
		req.setAttribute("category", category);
		req.setAttribute("type", type);

		return "admin/adminBrand";
	}


	//상품조회
	@RequestMapping(value = "/adminProduct.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProduct(HttpServletRequest req) {

		List<Admin_BrandDTO> brandLists = adminService.getAdminBrand();
		List<Admin_CategoryDTO> categoryLists = adminService.getAdminCategory();

		req.setAttribute("brandLists", brandLists);
		req.setAttribute("categoryLists", categoryLists);

		// 상품조회 페이지 이동
		return "admin/adminProduct";

	}

	//상품 삭제
	@RequestMapping(value = "/adminProductDelete.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProductdelete(HttpServletRequest request) {


		String code = request.getParameter("code");	

		ProductView view = productService.getOneProductData(code);	

		productService.deleteBrand(code);
		productService.deleteColor(code);
		productService.deleteImg(code);
		productService.deleteProduct(code);

		String thumbPath = request.getSession().getServletContext().getRealPath("/thumbImg");
		String detailPath = request.getSession().getServletContext().getRealPath("/detailImg");


		File serverFile;

		serverFile = new File(thumbPath + File.separator + view.getThumb_Img());	

		serverFile.delete();
		serverFile = new File(detailPath + File.separator + view.getDetail_Img());
		serverFile.delete();

		return "redirect:/adminProduct.action";

	}	
		
		
	//팝업창에서 수정버튼
	@RequestMapping(value = "/adminProduct_update.action", method = { RequestMethod.POST})
	public ModelAndView adminProductUpdate( @RequestParam("thumbImg")MultipartFile f1, @RequestParam("detailImg")MultipartFile f2, ProductUpload command, HttpServletRequest req) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/updateCallBack");

		try {

			String originalFN1 = new String(f1.getOriginalFilename().getBytes("8859_1"),"UTF-8");
			String originalFN2 = new String(f2.getOriginalFilename().getBytes("8859_1"),"UTF-8");

			String ext1 = originalFN1.substring(originalFN1.lastIndexOf('.'));
			String ext2 = originalFN2.substring(originalFN2.lastIndexOf('.'));	

			String saveFileName1 = UUID.randomUUID().toString().replaceAll("-", "") + ext1;
			String saveFileName2 = UUID.randomUUID().toString().replaceAll("-", "") + ext2;	

			String thumbPath = req.getSession().getServletContext().getRealPath("/thumbImg");
			String detailPath = req.getSession().getServletContext().getRealPath("/detailImg");

			File tp = new File(thumbPath);
			File dp = new File(detailPath);

			if(!tp.exists()) {
				tp.mkdirs();
			}
			if(!dp.exists()) {
				dp.mkdirs();
			}		


			File serverFile;
			ProductView dto = productService.getOneProductData(command.getCode());

			serverFile = new File(thumbPath + File.separator + dto.getThumb_Img());
			serverFile.delete();
			serverFile = new File(detailPath + File.separator + dto.getDetail_Img());
			serverFile.delete();


			serverFile = new File(thumbPath + File.separator + saveFileName1);		
			f1.transferTo(serverFile);

			serverFile = new File(detailPath + File.separator + saveFileName2);	
			f2.transferTo(serverFile);			

			ProductDTO product = new ProductDTO();
			BrandDTO brand = new BrandDTO();
			ColorDTO color = new ColorDTO();
			ImgDTO img = new ImgDTO();          

			product.setCode(command.getCode());
			product.setProductName(command.getProductName());
			product.setProductPrice(Integer.parseInt(command.getPrice()));

			brand.setBrand(command.getBrand());
			brand.setCategory(command.getCategory());
			brand.setCode(command.getCode());
			brand.setType(command.getType());

			color.setCode(command.getCode());
			color.setColorCode(command.getColorCode());
			color.setColorName(command.getColor());
			color.setQty(Integer.parseInt(command.getCount()));

			img.setCode(command.getCode());
			img.setDetail_Img(saveFileName2);
			img.setThumb_Img(saveFileName1);		

			productService.updateProduct(product);
			productService.updateBrand(brand);			
			productService.updateColor(color);
			productService.updateImg(img);			

		}catch (Exception e) {			
			e.printStackTrace();
		}	

		return mav;

	}



	//상품 수정페이지 접속
	@RequestMapping(value = "/adminProduct_update.action", method = { RequestMethod.GET})
	public String adminProduct_update(HttpServletRequest req) {

		String code = req.getParameter("code");

		ProductView dto = productService.getOneProductData(code);

		req.setAttribute("dto", dto);
		List<Admin_BrandDTO> brand = adminService.getAdminBrand();
		List<Admin_CategoryDTO> cate = adminService.getAdminCategory();
		List<Admin_TypeDTO> type = adminService.getAdminType();
		req.setAttribute("brand", brand);
		req.setAttribute("cate", cate);
		req.setAttribute("type", type);


		// 상품수정완료 페이지 이동
		return "admin/adminProduct_update";

	}



	
	//회원정보삭제 - 탈퇴X
	@RequestMapping(value="/adminMemberDelete.action", method=RequestMethod.POST)
	public void memberDelete(HttpServletRequest req, HttpServletResponse resp) {
		
		String id = req.getParameter("id");
		
		System.out.println(id);
		
		
		memberService.deleteCoupon(id);
		memberService.deleteMemberGrade(id);
		memberService.deleteMemberInfo(id);
		memberService.deleteMember(id);		
		
	}
	


	














































	//-------------------------------------------------------------------------------------------------------------------------------------------------------------- end

		

	
}
