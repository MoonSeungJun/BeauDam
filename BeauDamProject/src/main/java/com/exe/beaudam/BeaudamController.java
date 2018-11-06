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
import com.exe.util.*;
import com.table.otherDTO.BasketDTO;
import com.table.otherDTO.CouponDTO;
import com.view.view.*;

/*
 *  1. method mapping¿ª ¥Ÿ ±‚∫ª¿˚¿∏∑Œ get, post ∏µŒ º≥¡§«ÿµ◊¿Ω
 *   -> ±◊≥… ≥¿µŒ¡ˆ∏ª∞Ì « ø‰ø° µ˚∂Û get, post, get/post ¡ﬂ ªÁøÎ«“ πÊΩƒ º±≈√«ÿº≠ ºº∆√«“ ∞Õ
 *   
 *  2. return «¸Ωƒ¿ª ¥Ÿ String¿ª ±‚∫ª¿∏∑Œ ºº∆√
 *   -> ModelandView∑Œ ∫Ø»Ø«œø© ªÁøÎ«ÿµµ π´πÊ
 *  
 *  3. jsp∆ƒ¿œ¿∫ ∞¢∞¢ «ÿ¥Á«œ¥¬ ∆˙¥ıø° ª˝º∫«œ±‚
 *   -> «ÿ¥Á ∆˙¥ı¥¬ ƒ¡∆Æ∑—∑Øø° *«•Ω√µ» ¡÷ºÆ ¬¸¡∂
 *   -> views/«ÿ¥Á∆˙¥ı/~.jsp
 *   -> jsp∆ƒ¿œ∏Ì¿∫ return∞™ø° Ω·¡Æ¿÷¥¬ ¿Ã∏ß∞˙ ∂»∞∞¿Ã ∏∏µÈ±‚
 *   
 *  4. ∞¢¿⁄ ∏√¿∫ ∆‰¿Ã¡ˆø° ¿⁄Ω≈¿« ¿Ã∏ß ¡÷ºÆ ¥ﬁæ∆≥ı±‚
 *  
 *  5. image∆ƒ¿œ¿∫ resources¿« image¿« «ÿ¥Á«œ¥¬ ∆˙¥ıø° ∏√¿∫ ∆‰¿Ã¡ˆ ∆˙¥ı ª˝º∫«œø© ±◊ ∆˙¥ıø° ≥÷¿ª ∞Õ
 *   -> resources/image/«ÿ¥Á ∆˙¥ı(*«•Ω√)/∆˙¥ı(∆‰¿Ã¡ˆ∏Ì)/~.jpg
 *   -> ∆˙¥ı∏Ì¿∫ 3π¯∞˙ ∞∞¿Ã ¿⁄Ω≈¿« ∆‰¿Ã¡ˆ∏Ì∞˙ ∂»∞∞¿Ã «“ ∞Õ
 *   -> ¿ÃπÃ¡ˆ∏Ì¿∫ æÓ∂≤ øÎµµ¿« ¿ÃπÃ¡ˆ¿Œ¡ˆ æÀ ºˆ ¿÷µµ∑œ ¡ˆ¿ª ∞Õ
 *   
 *  6. css∆ƒ¿œ¿∫ resources¿« css¿« «ÿ¥Á«œ¥¬ ∆˙¥ıø° ∏√¿∫ ∆‰¿Ã¡ˆ ∆˙¥ı ª˝º∫«œø© ±◊ ∆˙¥ıø° ≥÷¿ª ∞Õ
 *   -> resources/css/«ÿ¥Á ∆˙¥ı(*«•Ω√)/∆˙¥ı(∆‰¿Ã¡ˆ∏Ì)/~.css
 *   -> ∆˙¥ı∏Ì¿∫ 3π¯∞˙ ∞∞¿Ã ¿⁄Ω≈¿« ∆‰¿Ã¡ˆ∏Ì∞˙ ∂»∞∞¿Ã «“ ∞Õ
 *   -> css∏Ì¿∫ æÓ∂≤ øÎµµ¿« ¿ÃπÃ¡ˆ¿Œ¡ˆ æÀ ºˆ ¿÷µµ∑œ ¡ˆ¿ª ∞Õ
 */

/*
 * 	ƒı∏Æ insert, delete ≈◊¿Ã∫Ì º¯º≠
 * 	
 * 	insert «“ ∂ß
 * 	member - member_Info - member_grade - coupon
 * 	product - brand - img - color - basket  
 * 	admin≈◊¿Ã∫Ì - brand
 * 	delete «“ ∂ß insert ø™º¯
 * 	
 * 
 * 	∏Æ∫‰ delete «“ ∂ß sale_code∑Œ id ∞À¡ı »ƒ ªË¡¶ Ω√≈≥ ∞Õ
 * 	
 * 	notification delete¥¬ num∏∏ ¿÷¿∏∏È ªË¡¶ µ«π«∑Œ ∞¸∏Æ¿⁄ ∞Ë¡§¿œ ∂ß∏∏
 * 	ªË¡¶πˆ∆∞ »∞º∫»≠	
 * 
 * 	DB insert « µ∂
 * 	µ∆˙∆Æ ∞™¿Ã ¿÷æÓ √ﬂ∞°«œ¡ˆ æ æ∆µµ µ«¥¬ µ•¿Ã≈Õ
 * 	
 * 	Member ∞¸∑√ ƒ√∑≥
 * 	- isLeave, created, pay, grade, point, num, period, use_date
 * 
 * 	Sale ∞¸∑√ ƒ√∑≥
 * 	- saleDate, pay_status, delivery_status
 * 
 * 	Notificaiton ∞¸∑√ ƒ√∑≥
 * 	- num, id, hitCount, created
 * 
 * 	Review ∞¸∑√ ƒ√∑≥
 *  - created  
 *
 *	DB update « µ∂
 *	∆ƒ∂ÛπÃ≈Õ ≈∏¿‘¿Ã ¥ŸµÈ ¥Ÿ∏£¥œ ªÁøÎ ¿¸ ªÁøÎ«“ Mapper∏¶ »Æ¿Œ«“ ∞Õ
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
		//∑£¥˝«‘ºˆ∑Œ ¥∫æ∆¿Ã≈€ 
		
		HashMap<String, Object> searchPack = new HashMap<String, Object>();
		
		String searchValue = "";
		String searchType = "";
			
		
		searchPack.put("searchValue", searchValue);
		searchPack.put("searchType", searchType);
		
		
		int count = viewService.getSearchDataCount(searchPack);	
		int selectRowNum = 0;
		
						
		List<ProductView> newItemList = new ArrayList<ProductView>();
		
		   
		HashSet<Integer> randomList = new HashSet<Integer>();		// ≥≠ºˆ∏¶ ¿˙¿Â«“ HashSet
		Random rand = new Random();
		List<Integer> numberList = new ArrayList<Integer>();	// ∞·∞˙∏¶ ¿˙¿Â«“ ArrayList
		
		while(randomList.size()<12){						// HashSet¿« ≈©±‚∞° 10∫∏¥Ÿ ¿€¿ª µøæ» 
			int oldSize = randomList.size();				// ±‚¡∏¿« HashSet ≈©±‚
			int temp = rand.nextInt(count)+1;					// 1 ~ 10 ±Ó¡ˆ ≥≠ºˆ ª˝º∫
			randomList.add(temp);							// HashSetø° √ﬂ∞° => ¡ﬂ∫π µ«∏È ∞™¿Ã √ﬂ∞° µ«¡ˆ æ ¿Ω
			if(randomList.size() > oldSize)					// ≈©±‚∞° ∫Ø«œ∏È ¡ﬂ∫πµ«¡ˆ æ æ“¥Ÿ¥¬ ∂Ê
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
		
		// ∏ﬁ¿Œ ∆‰¿Ã¡ˆ ¿Ãµø
		return new ModelAndView("beaudam/main", "id", id);
	}
 	
   
	@RequestMapping(value = "/searchProductList.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String searchProductList(HttpServletRequest request) throws Exception {
				
		
		String[] brands = request.getParameterValues("brand");
		String value = request.getParameter("value");
		String type = request.getParameter("type");
		String pageNum = request.getParameter("pageNum");
		String cp = request.getContextPath();
		MyUtil2 util = new MyUtil2();
		List<String> list = new ArrayList<String>();		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(value == null || value.equals("")) {
			value = " ";
		}else if(type == null || type.equals("")) {
			type = " ";
		}		
<<<<<<< HEAD
		
		for(String str : brands) {			
			list.add(str);			
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
		
		map.put("start", start);
		map.put("end", end);

		List<ProductView> view = viewService.getSearchProductList(map);		

		map.clear();
		map.put("searchValue", value);
		map.put("searchType", type);
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
		
=======
		
		for(String str : brands) {			
			list.add(str);			
			System.out.println(str);
			System.out.println(list);
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
		
		map.put("start", start);
		map.put("end", end);

		List<ProductView> view = viewService.getSearchProductList(map);		

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
		
>>>>>>> ÍπÄÌï¥ÎÇòÎ∏åÎûúÏπò
		String pageIndexList = util.pageIndexList(currentPage, totalPage, listUrl);

		String detailUrl = cp + "/productDetail.action?pageNum="+pageNum;

		if (!param.equals("")) {
			detailUrl = detailUrl + "&" + param;
		}			
		
<<<<<<< HEAD
		request.setAttribute("sortList", sortList);
=======
>>>>>>> ÍπÄÌï¥ÎÇòÎ∏åÎûúÏπò
		request.setAttribute("searchProductList", view);
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
			
		HashMap<String, Object> DataCountMap = new HashMap<String, Object>();
		HashMap<String, Object> ProductDataMap = new HashMap<String, Object>();
		
		if(searchValue==null||searchValue.equals("")) {
			searchValue="";
		}
		if(searchValue!=null&&!searchValue.equals("")) {
			searchType="";
			//∞Àªˆ∞™ ªÁ¿Ã æ’µ⁄ ∞¯πÈ¡¶∞≈
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


		ProductDataMap.put("searchValue", searchValue);
		ProductDataMap.put("searchType", searchType);		   
		ProductDataMap.put("start", start);
		ProductDataMap.put("end", end);


		List<ProductView> searchProductList = viewService.getSearchProductDataList(ProductDataMap);
		
		ProductDataMap.clear();
		ProductDataMap.put("searchValue", searchValue);
		ProductDataMap.put("searchType", searchType);
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
		
		
		request.setAttribute("searchProductList", searchProductList);
		request.setAttribute("count", count);
		request.setAttribute("detailUrl", detailUrl);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("searchType", searchType);
		request.setAttribute("searchValue", searchValue);
		request.setAttribute("sortList", sortList);

		return new ModelAndView("beaudam/productList", "id", (String) session.getAttribute("id"));
		
		
	}
	
	
	

	@RequestMapping(value = "/productDetail.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productDetail(HttpSession session, HttpServletRequest req) {
		
		ProductView detailData = productService.getOneProductData(req.getParameter("code"));
		
		int point = (int) ((int) detailData.getProduct_Price()*0.1);	
		
		req.setAttribute("dto", detailData);
		req.setAttribute("point", point);

		// ªÛ«∞ªÛºº ∆‰¿Ã¡ˆ ¿Ãµø
		return new ModelAndView("beaudam/productDetail", "id", (String) session.getAttribute("id"));

	}
	
	@RequestMapping(value = "/bestItem.action", method = RequestMethod.GET)
	public String bestItem(HttpSession session) {

		// ºº¿œ ∆‰¿Ã¡ˆ ¿Ãµø
		return "beaudam/bestItem";
	}

	@RequestMapping(value = "/event.action", method = RequestMethod.GET)
	public ModelAndView event(HttpSession session) {

		// ¿Ã∫•∆Æ ∏ÆΩ∫∆Æ ∆‰¿Ã¡ˆ ¿Ãµø
		return new ModelAndView("beaudam/event", "id", (String) session.getAttribute("id"));

	}

	@RequestMapping(value = "/event1.action", method = RequestMethod.GET)
	public ModelAndView event1(HttpSession session) {

		// ¿Ã∫•∆Æ1 ∆‰¿Ã¡ˆ ¿Ãµø
		return new ModelAndView("beaudam/event1", "id", (String) session.getAttribute("id"));

	}

	@RequestMapping(value = "/event2.action", method = RequestMethod.GET)
	public ModelAndView event2(HttpSession session) {

		// ¿Ã∫•∆Æ2 ∆‰¿Ã¡ˆ ¿Ãµø
		return new ModelAndView("beaudam/event2", "id", (String) session.getAttribute("id"));

	}

	@RequestMapping(value = "/event3.action", method = RequestMethod.GET)
	public ModelAndView event3(HttpSession session) {

		// ¿Ã∫•∆Æ3 ∆‰¿Ã¡ˆ ¿Ãµø
		return new ModelAndView("beaudam/event3", "id", (String) session.getAttribute("id"));
	}
	
	@RequestMapping(value = "/look.action", method = RequestMethod.GET)
	public String look(HttpSession session) {

		// ºº¿œ ∆‰¿Ã¡ˆ ¿Ãµø
		return "beaudam/look";
	}
	
	@RequestMapping(value = "/pick.action", method = RequestMethod.GET)
	public String pick(HttpSession session) {

		// ºº¿œ ∆‰¿Ã¡ˆ ¿Ãµø
		return "beaudam/pick";
	}
	
	@RequestMapping(value = "/sale.action", method = RequestMethod.GET)
	public String sale(HttpSession session) {

		// ºº¿œ ∆‰¿Ã¡ˆ ¿Ãµø
		return "beaudam/sale";
	}
	

	// msj
	@RequestMapping(value = "/pay.action", method = { RequestMethod.POST })
	public ModelAndView pay(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		String pay = request.getParameter("pay");
		if (pay == "pay_ok") {
			mav.setViewName("beaudam/payOk");

			// ∞·¡¶øœ∑· ∆‰¿Ã¡ˆ ¿Ãµø
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

		// ∞·¡¶ ∆‰¿Ã¡ˆ ¿Ãµø
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
