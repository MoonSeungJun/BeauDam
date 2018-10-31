package com.exe.beaudam;


import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ser.CustomSerializerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.dao.otherDAO.OtherServiceImpl;
import com.exe.util.MyUtil;
import com.table.otherDTO.NotificationDTO;

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
@Controller("CustomCenterController")
public class CustomCenterController {

	@Resource(name="otherService")
	private OtherServiceImpl otherService;
	
	@Autowired
	MyUtil myUtil;
	
	// ********************** Customer Center Page **********************

	
	@RequestMapping(value = "/faq.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String faq(HttpServletRequest request) {

		HttpSession session= request.getSession();
		
<<<<<<< HEAD
		
=======
>>>>>>> 김해나브랜치
		request.setAttribute("id",session.getAttribute("id"));
		
		
		// FAQ ������ �̵�
		return "customerCenter/faq";
	}

	@RequestMapping(value = "/inquire.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String inquire() {

		// 1:1���� ������ �̵�
		return "customerCenter/mailForm";
	}
	
	// ������ default ������
	@RequestMapping(value = "/notification.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String notification(HttpServletRequest request) throws Exception {
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		HttpSession session = request.getSession();
		
		
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(searchKey==null) {
			searchKey = "subject";
			searchValue = "";
		}else {
			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue= URLDecoder.decode(searchValue, "UTF-8");	
		}
		
		
		int dataCount = otherService.getNotificationCount(searchKey, searchValue);
		
		int numPerPage = 6;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<NotificationDTO> lists = otherService.getNotificationAllData(start, end, searchKey, searchValue);
		
		String param = "";
		if(!searchValue.equals("")){
			param = "searchKey=" + searchKey;
			param+= "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
		
		String listUrl = cp + "/notification.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;				
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		String articleUrl = 
				cp + "/notification_article.action?pageNum=" + currentPage;
				
			if(!param.equals(""))
				articleUrl = articleUrl + "&" + param;
			
			request.setAttribute("lists", lists);
			request.setAttribute("pageIndexList",pageIndexList);
			request.setAttribute("dataCount",dataCount);
			request.setAttribute("articleUrl",articleUrl);
			request.setAttribute("id", session.getAttribute("id"));
		
		
		// �������� ������ �̵�
		return "customerCenter/notification_list";
	}
	
	@RequestMapping(value = "/notification_article.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String notification_article(HttpServletRequest request) throws Exception {

		String cp = request.getContextPath();
		HttpSession session = request.getSession();
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
				
		
		if(searchKey != null)
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		
		otherService.updateHitCount(num);
		
		NotificationDTO dto = otherService.getOneNotification(num);
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));
		
		String detail = "pageNum="+pageNum;
		if(searchKey!=null) {
			detail += "&searchKey=" + searchKey;
			detail += "&searchValue=" 
					+ URLEncoder.encode(searchValue, "UTF-8");
			
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("detail", detail);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("id",session.getAttribute("id"));
				
		// �������� ����  �̵�
		return "customerCenter/notification_article";
	}
	
	
	
	@RequestMapping(value = "/notification_create.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String notification_create() {

		// �������� �ۼ�������  �̵�
		return "customerCenter/notification_create";
	}
	
	@RequestMapping(value = "/notification_create_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String notification_create_ok(NotificationDTO dto,HttpServletRequest request) {

		int maxNum = otherService.getNotificationMaxNum();
		
		dto.setNum(maxNum+1);
		
		otherService.insertNotification(dto);
				
		// �������� �ۼ��Ϸ�  �̵�
		return "redirect:/notification.action";
	}
	
	
	@RequestMapping(value = "/notification_update.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String notification_update(HttpServletRequest request) {

		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		NotificationDTO dto = otherService.getOneNotification(num);
		
		if(dto==null||dto.equals("")) {
			return "redirect:/notification.action";
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
			
		// �������� ���������� �̵�
		return "customerCenter/notification_update";
	}
	
	@RequestMapping(value = "/notification_update_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String notification_update_ok(NotificationDTO dto, HttpServletRequest request) {

		String pageNum = request.getParameter("pageNum");
		
		otherService.updateNotification(dto);
		
		
		// �������� �����Ϸ� �̵�
		return "redirect:/notification.action?pageNum="+pageNum;
	}

	@RequestMapping(value = "/notification_delete.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String notification_delete(HttpServletRequest request) {

		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		
		otherService.deleteNotification(num);
		
		// �������� ���� �̵�
		return "redirect:/notification.action?pageNum="+pageNum;
		}
	
	
}
