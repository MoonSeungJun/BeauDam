package com.exe.beaudam;



import java.net.URLEncoder;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.*;

import org.apache.commons.logging.impl.SLF4JLocationAwareLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.dao.memberDAO.MemberServiceImpl;
import com.dao.otherDAO.OtherServiceImpl;
import com.dao.productDAO.*;
import com.dao.saleDAO.SaleServiceImpl;
import com.dao.viewDAO.ViewService;
import com.exe.util.*;
import com.table.otherDTO.BasketDTO;
import com.table.otherDTO.CouponDTO;
import com.table.otherDTO.ReviewDTO;
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
 	
   
	@RequestMapping(value = "/searchProductList.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String searchProductList(HttpServletRequest request) throws Exception {
				
		
		String[] brands = request.getParameterValues("brand");
		String value = request.getParameter("searchValue");
		String type = request.getParameter("searchType");
		String pageNum = request.getParameter("pageNum");
		String sort = request.getParameter("sort");
		String cp = request.getContextPath();
		MyUtil2 util = new MyUtil2();
		List<String> list = new ArrayList<String>();		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(value == null || value.equals("")) {
			value = " ";
		}else if(type == null || type.equals("")) {
			type = " ";
		}		
		
		for(String str : brands) {			
			list.add(str);			
			System.out.println();
			System.out.println(str);
			System.out.println();
		}		
		
		map.put("list", list);
		map.put("searchValue", value);
		map.put("searchType", type);		
		
		int dataCount = viewService.getSearchDataCount(map);
		
		int numPerPage = 12;
		int totalPage = util.getPageCount(numPerPage, dataCount);
		int currentPage = 1;

		if(pageNum != null && !pageNum.equals(""))
			currentPage = Integer.parseInt(pageNum);	
		
		if(currentPage > totalPage) {
			currentPage = totalPage;
		}

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;				
		
		if(sort==null||sort.equals("")) {
			sort = "desc";
		}
		
		map.put("start", start);
		map.put("end", end);	
		map.put("sort", sort);
		
		List<ProductView> sortList = viewService.getSearchProductDataList(map);	
		
		String param = "?";		
		
		String listUrl = cp+"/searchProductList.action";

		if (!value.equals(" ")) {			
			param += "value=" + value;		
			listUrl = listUrl + param;				
			
		}
		
		if (!type.equals(" ")) {			
			param += "type=" + type;
			listUrl = listUrl + param;		

		}		
		
		String pageIndexList = util.pageIndexList(currentPage, totalPage, listUrl);

		String detailUrl = cp + "/productDetail.action?pageNum="+pageNum;

		if (!param.equals("")) {
			detailUrl = detailUrl + "&" + param;
		}		
		
		request.setAttribute("searchProductList", sortList);
		request.setAttribute("count", dataCount);
		request.setAttribute("detailUrl", detailUrl);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("searchValue", value);
		request.setAttribute("searchType", type);
		request.setAttribute("brand", list);
		request.setAttribute("pageNum", pageNum);
		
		return "beaudam/productList";
		
		
		
	}


	@RequestMapping(value = "/productList.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productList(HttpSession session,HttpServletRequest request)throws Exception {
				
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");				
		String sort = request.getParameter("sort");
		HashMap<String, Object> DataCountMap = new HashMap<String, Object>();
		HashMap<String, Object> ProductDataMap = new HashMap<String, Object>();
		
		if(searchValue==null||searchValue.equals("")) {
			searchValue="";
		}
		if(searchValue!=null&&!searchValue.equals("")) {
			searchType="";
			//�˻��� ���� �յ� ��������
			searchValue = searchValue.replaceAll(" ", "");
		}
		
		if(searchType==null||searchType.equals("")) {
			searchType="";
		}
		if(searchType!=null&&!searchType.equals("")) {
			searchValue="";
		}	
		
		DataCountMap.put("searchType", searchType);
		DataCountMap.put("searchValue", searchValue);					

		int count = viewService.getSearchDataCount(DataCountMap);	
		
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
		
		if(sort==null||sort.equals("")) {
			sort = "desc";
		}
		
		ProductDataMap.put("searchType", searchType);
		ProductDataMap.put("searchValue", searchValue);	
		ProductDataMap.put("start", start);
		ProductDataMap.put("end", end);	
		ProductDataMap.put("sort", sort);
		
		List<ProductView> sortList = viewService.getSearchProductDataList(ProductDataMap);	

		
		String param = "?";
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
		
		request.setAttribute("searchProductList", sortList);
		request.setAttribute("count", count);
		request.setAttribute("detailUrl", detailUrl);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("searchType", searchType);
		request.setAttribute("searchValue", searchValue);		

		return new ModelAndView("beaudam/productList", "id", (String) session.getAttribute("id"));		
		
	}
	
	@RequestMapping(value = "/bestItem.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView brandBestItem(HttpSession session,HttpServletRequest request)throws Exception {
		
		String ap = "Ap";
		String etude = "Etu";
		String innis= "Innis";
		String nature = "Nature";
		String face = "Face";
		String cp = request.getContextPath();
		
		List<SaleView> apList = viewService.getBrandBestItems(ap); //�ڵ�
		Iterator<SaleView> itApList = apList.iterator();
		List<ProductView> apProductList = new ArrayList<ProductView>();
		
		while(itApList.hasNext()) {
			SaleView saleVO = itApList.next();
			ProductView productVO = productService.getOneProductData(saleVO.getCode());	
			productVO.setThumb_Img("thumbImg\\"+productVO.getThumb_Img());
			apProductList.add(productVO);		
			
		}		
		
		List<SaleView> etuList = viewService.getBrandBestItems(etude);
		Iterator<SaleView> itEtuList = etuList.iterator();
		List<ProductView> etuProductList = new ArrayList<ProductView>();
		
		while(itEtuList.hasNext()) {
			SaleView saleVO = itEtuList.next();			
			ProductView productVO = productService.getOneProductData(saleVO.getCode());						
			productVO.setThumb_Img("thumbImg\\"+productVO.getThumb_Img());
			etuProductList.add(productVO);
		}	
		
		List<SaleView> innisList = viewService.getBrandBestItems(innis);
		Iterator<SaleView> itInnisList = innisList.iterator();
		List<ProductView> innisProductList = new ArrayList<ProductView>();
		
		while(itInnisList.hasNext()) {
			SaleView saleVO = itInnisList.next();
			ProductView productVO = productService.getOneProductData(saleVO.getCode());
			productVO.setThumb_Img("thumbImg\\"+productVO.getThumb_Img());
			innisProductList.add(productVO);		
			
		}	
		
		List<SaleView> natuList = viewService.getBrandBestItems(nature);
		Iterator<SaleView> itNatureList = natuList.iterator();
		List<ProductView> natureProductList = new ArrayList<ProductView>();
		
		while(itNatureList.hasNext()) {
			SaleView saleVO = itNatureList.next();
			ProductView productVO = productService.getOneProductData(saleVO.getCode());
			productVO.setThumb_Img("thumbImg\\"+productVO.getThumb_Img());
			natureProductList.add(productVO);		
			
		}	
		
		List<SaleView> faceList = viewService.getBrandBestItems(face);
		Iterator<SaleView> itFaceList = faceList.iterator();
		List<ProductView> faceProductList = new ArrayList<ProductView>();
	
		while(itFaceList.hasNext()) {
			SaleView saleVO = itFaceList.next();
			ProductView productVO = productService.getOneProductData(saleVO.getCode());	
			productVO.setThumb_Img("thumbImg\\"+productVO.getThumb_Img());
			faceProductList.add(productVO);	
		}	
		
		String detailUrl = cp+"/productDetail.action";
		
		request.setAttribute("apList", apProductList);
		request.setAttribute("etuList", etuProductList);
		request.setAttribute("innisList", innisProductList);
		request.setAttribute("natuList", natureProductList);
		request.setAttribute("faceList", faceProductList);
		request.setAttribute("detailUrl", detailUrl);
		
		
		return new ModelAndView("beaudam/bestItem","id",(String) session.getAttribute("id"));
		
	}
	
	

	@RequestMapping(value = "/productDetail.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productDetail(HttpSession session, HttpServletRequest req) {
		
		String id = (String)session.getAttribute("id");
		String saleCode = "";
		
		ProductView detailData = productService.getOneProductData(req.getParameter("code"));
		
		int point = (int) ((int) detailData.getProduct_Price()*0.1);	
		
		req.setAttribute("dto", detailData);
		req.setAttribute("saleCode", saleCode);
		req.setAttribute("point", point);

		if(id!=null&&id.equals("")) {
			
			List<SaleView> saleData = saleService.getPersonalSaleData(id);
			
			
			Iterator<SaleView> it = saleData.iterator();
			
			while(it.hasNext()) {
				
				SaleView sale = it.next();
				
				if(sale.getCode().equals(detailData.getCode())) {
					
					saleCode = sale.getSale_Code();
					
				}
				
			}

		}
		
		return new ModelAndView("beaudam/productDetail", "id", id);
		
	}
	
	@RequestMapping(value = "/review.action", method = RequestMethod.POST)
	public ModelAndView review(HttpServletRequest request,
			ReviewDTO dto) {

		dto.setSaleCode(request.getParameter("sale_Code"));
		
		otherService.insertReview(dto);		
		
		return new ModelAndView("beaudam/main");
		
	}
	
	/*@RequestMapping(value = "/bestItem.action", method = RequestMethod.GET)
	public String bestItem(HttpSession session) {

		// ���� ������ �̵�
		return "beaudam/bestItem";
	}*/

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
	
	@RequestMapping(value = "/look.action", method = RequestMethod.GET)
	public String look(HttpSession session) {

		// ���� ������ �̵�
		return "beaudam/look";
	}
	
	@RequestMapping(value = "/pick.action", method = RequestMethod.GET)
	public String pick(HttpSession session) {

		// ���� ������ �̵�
		return "beaudam/pick";
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
