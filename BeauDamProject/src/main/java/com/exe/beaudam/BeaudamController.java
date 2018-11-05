package com.exe.beaudam;



import java.net.URLEncoder;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.dao.memberDAO.MemberServiceImpl;
import com.dao.otherDAO.OtherServiceImpl;
import com.dao.productDAO.*;
import com.dao.saleDAO.SaleServiceImpl;
import com.dao.viewDAO.ViewService;
import com.exe.util.MyUtil;

import com.table.otherDTO.BasketDTO;
import com.table.otherDTO.CouponDTO;
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

@Controller("BeaudamController")
public class BeaudamController {

	@Resource(name = "viewService")
	private ViewService viewService;

	@Resource(name = "otherService")
	private OtherServiceImpl otherService;
	
	@Resource(name="productService")
	private ProductServiceImpl productService;


	@Autowired
	MyUtil myUtil;
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	@Resource(name="saleService")
	private SaleServiceImpl saleService;

	
	// ********************** Beaudam Page **********************

	@RequestMapping(value = "/main.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(HttpSession session, HttpServletRequest req) {

		String id = (String) session.getAttribute("id");
		
		List<SaleView> bestItems = otherService.getBestItem();	
		
		Iterator<SaleView> it = bestItems.iterator();
		
		List<ProductView> productList = new ArrayList<ProductView>();
		
		
		while(it.hasNext()) {
			SaleView saleVO = it.next();
			
			ProductView productVO = productService.getOneProductData(saleVO.getCode());		
			
			
			productVO.setThumb_Img("thumbImg\\"+productVO.getThumb_Img());
			productList.add(productVO);		
			
		}
		//�����Լ��� �������� 
		
		HashMap<String, Object> searchPack = new HashMap<String, Object>();
		
		String searchValue = "";
		String searchType = "";
		
		searchPack.put("searchValue", searchValue);
		searchPack.put("searchType", searchType);
		
		
		int count = viewService.getSearchDataCount(searchPack);	
		int selectRowNum = 0;
		
		 	/*System.out.println("++++++++++++++++++++++++");
	        System.out.println(count);
	        System.out.println("++++++++++++++++++++++++");*/
				
		List<ProductView> newItemList = new ArrayList<ProductView>();
		
		   
		HashSet<Integer> randomList = new HashSet<Integer>();		// ������ ������ HashSet
		Random rand = new Random();
		List<Integer> numberList = new ArrayList<Integer>();	// ����� ������ ArrayList
		
		while(randomList.size()<12){						// HashSet�� ũ�Ⱑ 10���� ���� ���� 
			int oldSize = randomList.size();				// ������ HashSet ũ��
			int temp = rand.nextInt(count)+1;					// 1 ~ 10 ���� ���� ����
			randomList.add(temp);							// HashSet�� �߰� => �ߺ� �Ǹ� ���� �߰� ���� ����
			if(randomList.size() > oldSize)					// ũ�Ⱑ ���ϸ� �ߺ����� �ʾҴٴ� ��
				numberList.add(temp);	
		
		}
	        
	         Iterator<Integer> numIt = numberList.iterator();
	            
	            
	        for(int i=0; i<numberList.size();i++) {
	        	
	        	selectRowNum = numIt.next();
	        	
	        	ProductView newitemVO = viewService.getProductDataRowNum(selectRowNum);
	        	newItemList.add(newitemVO);
	        }
	        String cp = req.getContextPath();
	        String detailUrl = cp+"/productDetail.action";
	 	
		
		req.setAttribute("bestItem", bestItems);
		req.setAttribute("productList", productList);
		req.setAttribute("newItemList", newItemList);
		req.setAttribute("detailUrl", detailUrl);
		
		// ���� ������ �̵�
		return new ModelAndView("beaudam/main", "id", id);
	}
 	
   


	@RequestMapping(value = "/productList.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productList(HttpSession session,HttpServletRequest request)throws Exception {
		
		String searchValue = request.getParameter("searchValue");
		/*String id  = (String)session.getAttribute("id");*/
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");
		String searchType = request.getParameter("searchType");
		String sBrand = Arrays.toString(request.getParameterValues("arrayBrand"));
		
		
		String searchBrand = sBrand.substring(1, sBrand.length() - 1);
		
				
		/*String searchBradnArray[] = searchBrand.split(",");
		
		
		if(searchBradnArray==null||searchBradnArray.equals("")) {
			String searchBrand1 = "nodata";
			String searchBrand2 = "nodata";
			String searchBrand3 = "nodata";
			String searchBrand4 = "nodata";
			String searchBrand5 = "nodata";
		}
		
		
		if(searchBradnArray.length==1) {
			String searchBrand1 = searchBradnArray[0];
			String searchBrand2 = "nodata";
			String searchBrand3 = "nodata";
			String searchBrand4 = "nodata";
			String searchBrand5 = "nodata";
			
		}	
		
		if(searchBradnArray.length==2) {
			String searchBrand1 = searchBradnArray[0];
			String searchBrand2 = searchBradnArray[1];
			String searchBrand3 = "nodata";
			String searchBrand4 = "nodata";
			String searchBrand5 = "nodata";
			
			
		}
		
		if(searchBradnArray.length==3) {
			String searchBrand1 = searchBradnArray[0];
			String searchBrand2 = searchBradnArray[1];
			String searchBrand3 = searchBradnArray[2];
			String searchBrand4 = "nodata";
			String searchBrand5 = "nodata";
			
		}
		
		if(searchBradnArray.length==4) {
			String searchBrand1 = searchBradnArray[0];
			String searchBrand2 = searchBradnArray[1];
			String searchBrand3 = searchBradnArray[2];
			String searchBrand4 = searchBradnArray[3];
			String searchBrand5 = "nodata";
			
		}
		
		if(searchBradnArray.length==5) {
			String searchBrand1 = searchBradnArray[0];
			String searchBrand2 = searchBradnArray[1];
			String searchBrand3 = searchBradnArray[2];
			String searchBrand4 = searchBradnArray[3];
			String searchBrand5 = searchBradnArray[4];
			
		}		*/
		
		if(searchValue==null||searchValue.equals("")) {
			searchValue="";
		}
		if(searchValue!=null&&!searchValue.equals("")) {
			searchType="";
		}
		
		if(searchType==null||searchType.equals("")) {
			searchType="";
		}
		if(searchType!=null&&!searchType.equals("")) {
			searchValue="";
		}				
				
		//�˻��� ���� �յ� ��������
		searchValue = searchValue.trim();
		searchValue= searchValue.replaceAll(" " , "");
		searchValue = searchValue.replaceAll("\\p{Z}", "");	
			
		
		HashMap<String, Object> searchPack = new HashMap<String, Object>();
		
		
		searchPack.put("searchType", searchType);
		searchPack.put("searchValue", searchValue);
				
		int count = viewService.getSearchDataCount(searchPack);			
			
		int numPerPage = 12;
		int totalPage = myUtil.getPageCount(numPerPage, count);
		int currentPage = 1;
	
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
	    if(currentPage > totalPage) {
	    	currentPage = totalPage;
	    }
		
	    int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
	    
	    HashMap<String, Object> searchValuePack = new HashMap<String, Object>();
	    
	    searchValuePack.put("searchValue", searchValue);
	    searchValuePack.put("searchType", searchType);
	    searchValuePack.put("start", start);
	    searchValuePack.put("end", end);
	    
		
	    List<ProductView> searchProductList = viewService.getSearchProductDataList(searchValuePack);
		    
	    System.out.println("^@%^@@#$@!$!@$@!@!$@$!@$!$@!@$!");
	    System.out.println(searchType+"searchType");
	    System.out.println(searchValue+"searchValue");	    
	    System.out.println("^@%^@@#$@!$!@$@!@!$@$!@$!$@!@$!");
	    
	    String param = "";
		String listUrl = cp+"/productList.action";
	    
		if (searchValue != null&&!searchValue.equals("")) {
			 param = "";
			 listUrl = cp+"/productList.action";
			if (!searchValue.equals("")) {

				param = "searchValue=" + URLEncoder.encode(searchValue, "utf-8");

			}

			if (!param.equals("")) {
				listUrl = listUrl + "?" + param;
			}
		}
		
		if (searchType != null&&!searchType.equals("")) {
			 param = "";
			 listUrl = cp+"/productList.action";
			param = "searchType=" + URLEncoder.encode(searchType, "utf-8");


			if (!param.equals("")) {
				listUrl = listUrl + "?" + param;
			}

		}
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

		String detailUrl = cp + "/productDetail.action?pageNum=" + currentPage;

		if (!param.equals("")) {
			detailUrl = detailUrl + "&" + param;
		}
		
		request.setAttribute("searchProductList", searchProductList);
		request.setAttribute("count", count);
		request.setAttribute("detailUrl", detailUrl);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("searchType", searchType);
		request.setAttribute("searchValue", searchValue);
		return new ModelAndView("beaudam/productList", "id", (String) session.getAttribute("id"));
		
		
	}

	@RequestMapping(value = "/productDetail.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productDetail(HttpSession session, HttpServletRequest req) {
		
		ProductView detailData = productService.getOneProductData(req.getParameter("code"));
		
		int point = (int) ((int) detailData.getProduct_Price()*0.1);	
		
		req.setAttribute("dto", detailData);
		req.setAttribute("point", point);

		// ��ǰ�� ������ �̵�
		return new ModelAndView("beaudam/productDetail", "id", (String) session.getAttribute("id"));

	}

	@RequestMapping(value = "/event.action", method = RequestMethod.GET)
	public ModelAndView event(HttpSession session) {

		// �̺�Ʈ ����Ʈ ������ �̵�
		return new ModelAndView("beaudam/event", "id", (String) session.getAttribute("id"));

	}

	@RequestMapping(value = "/event1.action", method = RequestMethod.GET)
	public ModelAndView event1(HttpSession session) {

		// �̺�Ʈ1 ������ �̵�
		return new ModelAndView("beaudam/event1", "id", (String) session.getAttribute("id"));

	}

	@RequestMapping(value = "/event2.action", method = RequestMethod.GET)
	public ModelAndView event2(HttpSession session) {

		// �̺�Ʈ2 ������ �̵�
		return new ModelAndView("beaudam/event2", "id", (String) session.getAttribute("id"));

	}

	@RequestMapping(value = "/event3.action", method = RequestMethod.GET)
	public ModelAndView event3(HttpSession session) {

		// �̺�Ʈ3 ������ �̵�
		return new ModelAndView("beaudam/event3", "id", (String) session.getAttribute("id"));
	}
	
	@RequestMapping(value = "/sale.action", method = RequestMethod.GET)
	public String sale(HttpSession session) {

		// ���� ������ �̵�
		return "beaudam/sale";
	}

	// msj
	@RequestMapping(value = "/pay.action", method = { RequestMethod.POST })
	public ModelAndView pay(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		String pay = request.getParameter("pay");
		if (pay == "pay_ok") {
			mav.setViewName("beaudam/payOk");

			// �����Ϸ� ������ �̵�
			return mav;
		}

		mav.setViewName("beaudam/pay");

		List<BasketDTO> buyLists = new ArrayList<BasketDTO>();
		Map<String, Object> hm = new HashMap<String, Object>();

		// HttpSession session = request.getSession();
		// String id = (String) session.getAttribute("id");

		String id = (String) request.getSession().getAttribute("id");
		hm.put("id", id);

		MemberView member = viewService.getOneMemberData(id);

		int amount = 0;
		String check[] = request.getParameterValues("check");
		for (String selectedProduct : check) {
			amount = Integer.parseInt(request.getParameter("amount" + selectedProduct));
			hm.put("basket_Num", selectedProduct);
			BasketDTO dto = otherService.getBasketOneData(hm);			
			dto.setQty(amount);
			buyLists.add(dto);
		}

		List<CouponDTO> couponLists = otherService.getCouponData(id);
		int couponCount = otherService.getCouponCount(id);

		mav.addObject("member", member);
		mav.addObject("buyLists", buyLists);
		mav.addObject("couponLists", couponLists);
		mav.addObject("couponCount", couponCount);

		// ���� ������ �̵�
		return mav;
	}


	@RequestMapping(value = "/insertBasket.action", method = { RequestMethod.GET, RequestMethod.POST })
	public void insertBasket(HttpServletRequest req, HttpSession session) {
		
		String code = req.getParameter("code");
		int amount = Integer.parseInt(req.getParameter("amount"));
		String id = (String) session.getAttribute("id");
		
		ProductView pView = productService.getOneProductData(code);
		MemberView mView = memberService.getOneMemberData(id);
		
		BasketDTO dto = new BasketDTO();
		dto.setId(mView.getId());
		dto.setCode(code);
		dto.setBrand(pView.getBrand());
		dto.setProduct_Name(pView.getProduct_Name());
		dto.setColor_Code(pView.getColor_Code());
		dto.setColor_Name(pView.getColor_Name());
		dto.setThumb_Img(pView.getThumb_Img());
		dto.setProduct_Price(pView.getProduct_Price());
		dto.setQty(amount);
		
		otherService.insertBasket(dto);	
		
	}

	@RequestMapping(value = "/deleteBasket.action", method = { RequestMethod.GET, RequestMethod.POST })
	public void deleteBasket(HttpServletRequest req, HttpSession session) {
	
		String basket_Num = req.getParameter("basket_Num");
		String id = req.getParameter("id");
		System.out.println(id);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("basket_Num", basket_Num);
		map.put("id", id);
		
		otherService.deleteBasket(map);
		
		
	}	
	@RequestMapping(value = "/deleteAllBasket.action", method = { RequestMethod.GET, RequestMethod.POST })
	public void deleteAllBasket(HttpServletRequest req, HttpSession session) {
	
		String id = (String) session.getAttribute("id");
		
		otherService.deleteAllBasket(id);	
		
	}
	
	@RequestMapping(value = "/iamLeave.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String iamLeave(HttpServletRequest req) {
		
		
		String id = (String) req.getSession().getAttribute("id");
		
		
		memberService.updateIsLeave(id);
		
		req.getSession().removeAttribute("id");		
		
		
		return "redirect:/main.action";
	}
}
