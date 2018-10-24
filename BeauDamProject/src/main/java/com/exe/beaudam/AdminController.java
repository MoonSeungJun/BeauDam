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
import com.dao.productDAO.*;
import com.dao.saleDAO.*;
import com.dao.viewDAO.*;
import com.file.upload.*;
import com.table.adminDTO.*;
import com.table.memberDTO.*;
import com.table.productDTO.*;
import com.table.saleDTO.*;
import com.view.view.*;
/*
 * 	���� insert, delete ���̺� ����
 * 	
 * 	insert �� ��
 * 	member - member_Info - member_grade - coupon
 * 	product - brand - img - color - basket  
 * 	admin���̺� - brand
 * 	delete �� �� insert ����
 * 	
 * 
 * 	���� delete �� �� sale_code�� id ���� �� ���� ��ų ��
 * 	
 * 	notification delete�� num�� ������ ���� �ǹǷ� ������ ������ ����
 * 	������ư Ȱ��ȭ	
 * 
 * 	DB insert �ʵ�
 * 	����Ʈ ���� �־� �߰����� �ʾƵ� �Ǵ� ������
 * 	
 * 	Member ���� �÷�
 * 	- isLeave, created, pay, grade, point, num, period, use_date
 * 
 * 	Sale ���� �÷�
 * 	- saleDate, pay_status, delivery_status
 * 
 * 	Notificaiton ���� �÷�
 * 	- num, id, hitCount, created
 * 
 * 	Review ���� �÷�
 *  - created  
 *
 *	DB update �ʵ�
 *	�Ķ���� Ÿ���� �ٵ� �ٸ��� ��� �� ����� Mapper�� Ȯ���� ��
 *
 */

@Controller
public class AdminController {
	
	
	@Resource(name="adminService")
	private AdminServiceImpl adminService;

	@Resource(name="viewService")
	private ViewServiceImpl viewService1;


	@Resource(name="productService")
	private ProductServiceImpl productService;
	
	@Resource(name="saleService")
	private SaleServiceImpl saleService;
	// ********************** Admin Page **********************

	//ȸ������
	@RequestMapping(value = "/adminUser.action", method = { RequestMethod.GET, RequestMethod.POST})	
	public String admin_user(HttpServletRequest req) {
		// ȸ������ ������ �̵�			

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
	
	//��ǰ ����
	@RequestMapping(value = "/adminProductDelete.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProductdelete(HttpServletRequest request) {
		
		String pageNum = request.getParameter("pageNum");
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
		
		return "redirect:/adminProduct.action?pageNum="+pageNum;
		
	}	
	
	//����Ʈ�ڽ� ���۽�
	@RequestMapping(value="/adminProductAjax.action", method=RequestMethod.POST)
	public void productAjax(HttpServletRequest req, HttpServletResponse resp, String params, String brand) {
		
		try {
			
			String category = params;
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			if(brand.equals("����")) {
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
	//type �߰� ���۽�
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
	//��ǰ ���
	@RequestMapping(value="/adminProduct_new.action",method=RequestMethod.POST)
	public ModelAndView admin_add_product( @RequestParam("thumbImg")MultipartFile f1, @RequestParam("detailImg")MultipartFile f2, ProductUpload command, HttpServletRequest req) throws Exception {
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/adminProduct_new.action");
		
		
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

		try {

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
            
            productService.insertProduct(product);
            productService.insertBrand(brand);
            productService.insertColor(color);
            productService.insertImg(img);          
			
		} catch (FileNotFoundException e) {			
			e.printStackTrace();
		}

		return mav;
					
	}

	//�귣�� �߰�����
	@RequestMapping(value = "/adminBrand.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminBrand(HttpServletRequest req) {
		// �귣�� ���� ������ �̵�		

		//�귣�� �߰�
		String addBrand = req.getParameter("addbrand");
		
		if(addBrand != null && !addBrand.equals("")) {				
			Admin_BrandDTO dto = new Admin_BrandDTO();			
			dto.setBrand(addBrand);	
			req.removeAttribute("addbrand");				
			adminService.insertBrand(dto);			
			return "redirect:/adminBrand.action";
		}
		
		//�귣�� ����
		String delBrand = req.getParameter("delbrand");				
		if(delBrand != null && !delBrand.equals("")) {				
			req.removeAttribute("delBrand");			
			adminService.deleteBrand(delBrand);			
			return "redirect:/adminBrand.action";
		}
		
		//ī�װ� �߰�
		String addCate = req.getParameter("addCate");
		if(addCate != null && !addCate.equals("")) {				
			Admin_CategoryDTO dto = new Admin_CategoryDTO();			
			dto.setCategory(addCate);
			req.removeAttribute("addCate");		
			adminService.insertCategory(dto);			
			return "redirect:/adminBrand.action";
		}
		//ī�װ� ����
		String delCate = req.getParameter("delCate");						
		if(delCate != null && !delCate.equals("")) {				
			req.removeAttribute("delCate");			
			adminService.deleteCategory(delCate);			
			return "redirect:/adminBrand.action";
		}
		
		//Ÿ�� �߰�
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
		//Ÿ�� ����
		String delType = req.getParameter("delType");
		if(delType != null && !delType.equals("")) {				
			req.removeAttribute("delType");			
			adminService.deleteType(delType);			
			return "redirect:/adminBrand.action";
		}
		
		//���� ������ �̵�


		List<Admin_CategoryDTO> category = adminService.getAdminCategory();
		List<Admin_BrandDTO> brand = adminService.getAdminBrand();
		List<Admin_TypeDTO> type = adminService.getAdminType();

		req.setAttribute("brand", brand);
		req.setAttribute("category", category);
		req.setAttribute("type", type);

		return "admin/adminBrand";
	}

	//�ֹ���ȸ
	@RequestMapping(value = "/adminOrder.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminOrder(HttpServletRequest request) {

		HashMap<String, Object> saleSearchPack = new HashMap<String, Object>();

		String searchValue1 = request.getParameter("searchValue1");
		String searchValue2 = request.getParameter("searchValue2");
		String searchValue3 = request.getParameter("searchValue3");


		if(searchValue1==null||searchValue1.equals("")) {
			searchValue1 = "";
		}
		if(searchValue2==null||searchValue2.equals("")) {
			searchValue2 = "";
		}
		if(searchValue3==null||searchValue3.equals("")) {
			searchValue3 = "";
		}

		saleSearchPack.put("searchValue1", searchValue1);
		saleSearchPack.put("searchValue2", searchValue2);
		saleSearchPack.put("searchValue3", searchValue3);


		List<SaleView> saleView = viewService1.getAllSaleView(saleSearchPack);

		//����¡ ó�� �߰�	
		
		//����Ʈ�� ����
		request.setAttribute("lists", saleView);	

		// �ֹ����� ���� ������ �̵�
		return "admin/adminOrder";
	}
	
	@RequestMapping(value = "/adminProduct.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProduct(HttpServletRequest req) {
		
		List<Admin_BrandDTO> brandLists = adminService.getAdminBrand();
		List<Admin_CategoryDTO> categoryLists = adminService.getAdminCategory();
		
		req.setAttribute("brandLists", brandLists);
		req.setAttribute("categoryLists", categoryLists);
		
		// ��ǰ��ȸ ������ �̵�
		return "admin/adminProduct";
		
	}
	
	
	//��ǰ��ȸ���۽�
	@RequestMapping(value = "/adminProductViewAjax.action", method = { RequestMethod.GET, RequestMethod.POST })
	public void adminProductAjax(HttpServletResponse resp, HttpServletRequest req, String code,String brand,String category,String type,String productName) {		

		Map<String, Object> map = new HashMap<String, Object>();
		if(code==null||code.equals("")) {
			code = "";
			map.put("code", code);
		}else {
			map.put("code", code);
		}
		if(brand==null||brand.equals("")) {
			brand = "";
			map.put("brand", brand);
		}else {
			map.put("brand", brand);
		}
		if(category==null||category.equals("")||category.equals("����")) {
			category = "";
			map.put("category", category);
		}else {
			map.put("category", category);
		}
		if(type==null||type.equals("")||type.equals("����")) {
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
			JSONObject jCode = new JSONObject();
			
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
			
			//����¡ ó�� �߰�		

			//���� ������
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		


	}

	//��ǰ ����
	@RequestMapping(value = "/adminProduct_update.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProduct_update(
			BrandDTO bdto,ColorDTO cdto,ProductDTO pdto,HttpServletRequest request) {

		String pageNum = request.getParameter("pageNum");
		
		productService.updateBrand(bdto);
		productService.updateColor(cdto);
		productService.updateProduct(pdto);						
			
		// ��ǰ�����Ϸ� ������ �̵�
		return "admin/adminProduct";
		
	}
	
	

	//��ǰ ���
	@RequestMapping(value = "/adminProduct_new.action", method = { RequestMethod.GET})
	public String admin_new_product(HttpServletRequest req) {
		
		// ��ǰ��� ������ �̵� �� ����Ʈ�ڽ� ���				
		List<Admin_BrandDTO> brand = adminService.getAdminBrand();
		List<Admin_CategoryDTO> cate = adminService.getAdminCategory();
//		List<Admin_TypeDTO> type = adminService.getAdminType();
		
		//��ǰ ��� ������ �̵� �� ��ǰ ����Ʈ ���
		List<ProductView> lists = productService.getProductList();

		req.setAttribute("productList", lists);					
		req.setAttribute("brand", brand);
		req.setAttribute("cate", cate);
//		req.setAttribute("type", type);
		
		return "admin/adminProduct_new";	
		
	}
	
	


	@RequestMapping(value = "/adminOrderUpdate", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminOrderUpdate(Sale_DateDTO dto, HttpServletRequest request) {

		saleService.updateSaleDate(dto);


		return "admin/adminOrder";
	}

	//esteban
	@RequestMapping(value = "/adminSales.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminSales() {

		// ���� ������ �̵�
		return "admin/adminSales";
	}


	
}
