package com.exe.beaudam;

import java.net.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.exe.util.*;
import com.table.productDTO.*;

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
	
	// ********************** Beaudam Page **********************

	@RequestMapping(value = "/login.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(HttpServletRequest request) {

		// �α��� ���� �޾ƿ���
		String id = request.getParameter("id");

		// �α��� ���� üũ
		if (id != null) {
			return "beaudam/main";
		}

		// �α��� ������ �̵�
		return "beaudam/login";
	}

	@RequestMapping(value = "/newUser.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String newUser() {

		// ȸ������ ������ �̵�
		return "beaudam/newUser";
	}

	@RequestMapping(value = "/main.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String main() {

		// ���� ������ �̵�
		return "beaudam/main";
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
		if (pay != null) {

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

		// ��ٱ��� (����������) ������ �̵�
		return "myPage/myBasket";
	}

	@RequestMapping(value = "/myInfo.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myInfo() {

		// ȸ������ ���� (����������) ������ �̵�
		return "myPage/myInfo";
	}

	// msj
	@RequestMapping(value = "/myCoupon.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myCoupon() {

		// �������� (����������) ������ �̵�
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

	// syj
	@RequestMapping(value = "/adminUser.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String admin_user() {

		// ȸ������ ������ �̵�
		return "admin/adminUser";
	}

	// syj
	@RequestMapping(value = "/adminProduct.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminProduct(HttpServletRequest request, HttpServletResponse response) {

		String pageNum = request.getParameter("pageNum");
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		String searchDefaultKey = "PRODUCT_NAME";

		HashMap<String, Object> reqValue = new HashMap<String, Object>();

		reqValue.put("pageNum", pageNum);
		reqValue.put("searchKey", searchKey);
		reqValue.put("searchValue", searchValue);
		reqValue.put("searchDefaultKey", searchDefaultKey);

//		HashMap<String, Object> returnVal = pagingMethod(reqValue, request);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminProduct");

//		mav.addObject("returnVal", returnVal);

		// ��ǰ��ȸ ������ �̵�
		return mav;
	}

	// syj
	@RequestMapping(value = "/adminProduct_update.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProduct_update() {

		// ��ǰ���� ������ �̵�
		return "admin/adminProduct_update";
	}

	// syj
	@RequestMapping(value = "/adminProduct_new.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String admin_new_product() {

		// ��ǰ��� ������ �̵�
		return "admin/adminProduct_new";
	}

	// esteban
	@RequestMapping(value = "/adminBrand.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminBrand() {

		// �귣�� ���� ������ �̵�
		return "admin/adminBrand";
	}

	// esteban
	@RequestMapping(value = "/adminOrder.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminOrder() {

		// �ֹ����� ���� ������ �̵�
		return "admin/adminOrder";
	}

	// esteban
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

	/*
	//	����¡ �޼ҵ�
	public HashMap<String, Object> pagingMethod(HashMap<String, Object> reqValue, HttpServletRequest request) {

		String cp = request.getContentType();

		String pageNum = (String) reqValue.get("pageNum");
		int currentPage = 1;

		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);

		String searchKey = (String) reqValue.get("searchKey");
		String searchValue = (String) reqValue.get("searchValue");
		String searchDefault = (String) reqValue.get("searchDefaultKey");

		if (searchValue == null) {
			searchKey = searchDefault;
			searchValue = "";
		} else {

			if (request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");

		}

		// ��ü ������ ����

		int dataCount = dao.getDataCount(searchKey, searchValue);

		// ��ü ��������

		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<ProductDTO> lists = dao.getList(start, end, searchKey, searchValue);
	
		// ����¡ó��

		String param = "";
		if (!searchValue.equals("")) {
			param = "searchKey=" + searchKey;
			param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

		}

		String listUrl = cp + "/list.action";
		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}

		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

		HashMap<String, Object> returnValue = new HashMap<String, Object>();

		returnValue.put("lists", lists);
		returnValue.put("pageIndexList", pageIndexList);
		returnValue.put("dataCount", dataCount);

		return returnValue;

	}*/

}
