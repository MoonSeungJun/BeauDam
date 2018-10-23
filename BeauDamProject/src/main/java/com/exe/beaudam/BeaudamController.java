package com.exe.beaudam;

import java.io.*;
import java.util.*;

import javax.annotation.*;
import javax.servlet.http.*;

import org.json.simple.*;
import org.json.simple.parser.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import com.dao.adminDAO.*;
import com.dao.productDAO.*;
import com.dao.saleDAO.*;
import com.dao.viewDAO.*;
import com.file.upload.*;
import com.github.scribejava.core.model.*;
import com.naver.naverlogin.*;
import com.table.adminDTO.*;
import com.table.memberDTO.*;
import com.table.productDTO.*;
import com.table.saleDTO.*;
import com.view.view.*;


/*
 *  1. method mapping�� �� �⺻������ get, post ��� �����ص���
 *   -> �׳� ���������� �ʿ信 ���� get, post, get/post �� ����� ��� �����ؼ� ������ ��
 *   
 *  2. return ������ �� String�� �⺻���� ����
 *   -> ModelandView�� ��ȯ�Ͽ� ����ص� ����
 *  
 *  3. jsp������ ���� �ش��ϴ� ������ �����ϱ�
 *   -> �ش� ������ ��Ʈ�ѷ��� *ǥ�õ� �ּ� ����
 *   -> views/�ش�����/~.jsp
 *   -> jsp���ϸ��� return���� �����ִ� �̸��� �Ȱ��� �����
 *   
 *  4. ���� ���� �������� �ڽ��� �̸� �ּ� �޾Ƴ���
 *  
 *  5. image������ resources�� image�� �ش��ϴ� ������ ���� ������ ���� �����Ͽ� �� ������ ���� ��
 *   -> resources/image/�ش� ����(*ǥ��)/����(��������)/~.jpg
 *   -> �������� 3���� ���� �ڽ��� ��������� �Ȱ��� �� ��
 *   -> �̹������� � �뵵�� �̹������� �� �� �ֵ��� ���� ��
 *   
 *  6. css������ resources�� css�� �ش��ϴ� ������ ���� ������ ���� �����Ͽ� �� ������ ���� ��
 *   -> resources/css/�ش� ����(*ǥ��)/����(��������)/~.css
 *   -> �������� 3���� ���� �ڽ��� ��������� �Ȱ��� �� ��
 *   -> css���� � �뵵�� �̹������� �� �� �ֵ��� ���� ��
 */


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
public class BeaudamController {

	@Resource(name="adminService")
	private AdminServiceImpl adminService;

	@Resource(name="viewService")
	private ViewServiceImpl viewService1;


	@Resource(name="productService")
	private ProductServiceImpl productService;
	
	/* NaverLoginBO */
	@Resource(name="naverLoginBO")
	private NaverLoginBO naverLoginBO;

	@Resource(name="saleService")
	private SaleServiceImpl saleService;
	
	
	// ********************** Beaudam Page **********************
	
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpSession session) {
		
		/* �׾Ʒ� ���� URL�� �����ϱ� ���Ͽ� getAuthorizationUrl�� ȣ�� */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        /* ������ ���� URL�� View�� ���� */
        return new ModelAndView("beaudam/login", "url", naverAuthUrl);
	}
	
	@RequestMapping(value="/login_ok.action", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView doLogin(HttpServletRequest request, HttpSession session) {
		
		// �α��� ���� �޾ƿ���
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");
		
		// �Է��� id ��ȸ

		if(id.equals("beaudam") && pwd.equals("a123")) {
			
			session.setAttribute("id", id);

			return new ModelAndView("redirect:/main.action");
			
		}else {
		
			String errormessage = "���̵� �Ǵ� ��й�ȣ�� �߸��Ǿ����ϴ�.";

			return new ModelAndView("beaudam/login", "message", errormessage);
		
		}
	}
	
	@RequestMapping(value = "/logout.action", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpSession session) {
		
		session.removeAttribute("id");
        
        /* ������ ���� URL�� View�� ���� */
        return new ModelAndView("redirect:/main.action");

	}
	
	@RequestMapping(value = "/callback.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		/* �׾Ʒ� ������ ���������� �Ϸ�Ǹ� code �Ķ���Ͱ� ���޵Ǹ� �̸� ���� access token�� �߱� */
		
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

		// ��� ������ �̵�
		return "beaudam/newTerm";
	}

	@RequestMapping(value = "/newUser.action", method = RequestMethod.GET)
	public String newUser() {

		// ȸ������ ������ �̵�
		return "beaudam/newUser";
	}

	@RequestMapping(value = "/mainTop.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainTop() {

		// ���� ������ �̵�
		return "beaudam/mainTop";
	}

	@RequestMapping(value = "/main.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(HttpSession session) {
		
		String id = (String) session.getAttribute("id");


		// ���� ������ �̵�
		return new ModelAndView("beaudam/main","id",id);
	}

	@RequestMapping(value = "/productList.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String productList() {

		// ��ǰ����Ʈ ������ �̵�
		return "beaudam/productList";
	}

	@RequestMapping(value = "/productDetail.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String productDetail() {

		// ��ǰ�� ������ �̵�
		return "beaudam/productDetail";
	}

	// msj
	@RequestMapping(value = "/pay.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String pay(HttpServletRequest request) {

		String pay = request.getParameter("pay");
		if(pay != null) {

			// �����Ϸ� ������ �̵�
			return "beaudam/payOk";
		}

		// ���� ������ �̵�
		return "beaudam/pay";
	}




	// ********************** My Page **********************

	@RequestMapping(value = "/myPage.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPage() {

		// ���������� �̵�
		return "myPage/myPage";
	}	

	@RequestMapping(value = "/myBasket.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myBasket() {

		// ��ٱ���(����������) ������ �̵�

		return "myPage/myBasket";
	}

	@RequestMapping(value = "/myInfo.action", method = RequestMethod.GET)
	public String myInfo() {

		// ���������� ��й�ȣȮ�� ������ �̵�
		return "myPage/myInfo";
	}

	@RequestMapping(value = "/myEdit.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myEdit() {

		// ȸ������ ����2(����������) ������ �̵�
		return "myPage/myEdit";

	}

	// msj
	@RequestMapping(value = "/myCoupon.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myCoupon() {

		// ��������(����������) ������ �̵�

		return "myPage/myCoupon";
	}

	// msj
	@RequestMapping(value = "/myOrder.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myOrder() {

		// �ֹ����� (����������) ������ �̵�

		return "myPage/myOrder";
	}

	// msj
	@RequestMapping(value = "/myLeave.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myLeave() {

		// ȸ��Ż�� (����������) ������ �̵�

		return "myPage/myLeave";
	}


	// ********************** Admin Page **********************

	//syj
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
			
			System.out.println(id+name+tel+cellphone+birth);
			
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

	//syj
	@RequestMapping(value = "/adminProduct.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProduct(HttpServletRequest request) {


		HashMap<String, Object> searchPack = new HashMap<String, Object>();

		String searchValue1 = request.getParameter("searchValue1");
		String searchValue2 = request.getParameter("searchValue2");
		String searchValue3 = request.getParameter("searchValue3");
		String searchValue4 = request.getParameter("searchValue4");
		String searchValue5 = request.getParameter("searchValue5");


		if(searchValue1==null||searchValue1.equals("")) {
			searchValue1 = "";
		}
		if(searchValue2==null||searchValue2.equals("")) {
			searchValue2 = "";
		}
		if(searchValue3==null||searchValue3.equals("")) {
			searchValue3 = "";
		}
		if(searchValue4==null||searchValue4.equals("")) {
			searchValue4 = "";
		}
		if(searchValue5==null||searchValue5.equals("")) {
			searchValue5 = "";
		}	

		searchPack.put("searchValue1", searchValue1);
		searchPack.put("searchValue2", searchValue2);
		searchPack.put("searchValue3", searchValue3);
		searchPack.put("searchValue4", searchValue3);
		searchPack.put("searchValue5", searchValue3);


		List<ProductView> productView = viewService1.getAllProductData(searchPack);

		List<Admin_BrandDTO> brandLists = adminService.getAdminBrand();
		List<Admin_CategoryDTO> categoryLists = adminService.getAdminCategory();
		List<Admin_TypeDTO> typeLists = adminService.getAdminType();
			
		
		//����¡ ó�� �߰�		

		//���� ������
		request.setAttribute("lists", productView);
		request.setAttribute("brandLists", brandLists);
		request.setAttribute("categoryLists", categoryLists);
		request.setAttribute("typeLists", typeLists);
		
		

		// ��ǰ��ȸ ������ �̵�
		return "admin/adminProduct";
	}

	//syj
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

	//syj
	@RequestMapping(value = "/adminProduct_new.action", method = { RequestMethod.GET})
	public String admin_new_product(HttpServletRequest req) {
		
		// ��ǰ��� ������ �̵� �� ����Ʈ�ڽ� ���				
		List<Admin_BrandDTO> brand = adminService.getAdminBrand();
		List<Admin_CategoryDTO> cate = adminService.getAdminCategory();
		List<Admin_TypeDTO> type = adminService.getAdminType();
		
		//��ǰ ��� ������ �̵� �� ��ǰ ����Ʈ ���
		List<ProductView> lists = productService.getProductList();

		req.setAttribute("productList", lists);					
		req.setAttribute("brand", brand);
		req.setAttribute("cate", cate);
		req.setAttribute("type", type);
		
		return "admin/adminProduct_new";	
		
	}
	
	
	@RequestMapping(value="/adminProduct_newAjax.action", method=RequestMethod.POST)
	public void selectBoxAjax(HttpServletRequest req, HttpServletResponse resp, String params, String brand) {
		
		try {
			
			String category = params;
			
			Map<String, Object> map = new HashMap<String, Object>();
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
	@RequestMapping(value="/adminProductAjax.action", method=RequestMethod.POST)
	public void productAjax(HttpServletRequest req, HttpServletResponse resp, String params, String brand) {
		
		try {
			
			String category = params;
			
			Map<String, Object> map = new HashMap<String, Object>();
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
		System.out.println(thumbPath);
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


	//esteban
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
		if(addType != null && !addType.equals("")) {				
			Admin_TypeDTO dto = new Admin_TypeDTO();			
			dto.setType(addType);
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

	//esteban	
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

	// ********************** Customer Center Page **********************

	// ������ default ������
	@RequestMapping(value = "/faq.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String faq() {

		// FAQ ������ �̵�
		return "customerCenter/faq";
	}

	@RequestMapping(value = "/inquire.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String inquire() {

		// 1:1���� ������ �̵�
		return "customerCenter/inquire";
	}

	@RequestMapping(value = "/notification.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String notification() {

		// �������� ������ �̵�
		return "customerCenter/notification";
	}

}
