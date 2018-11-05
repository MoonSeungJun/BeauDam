package com.exe.util;

import org.springframework.stereotype.*;

@Service
public class MyUtil2 {
	
	//�쟾泥� �럹�씠吏��닔 援ы븯湲�
	//numPerPage : �븳�솕硫댁뿉 �몴�떆�븷 �뜲�씠�꽣�쓽 媛��닔
	//dataCount : �쟾泥� �뜲�씠�꽣�쓽 媛��닔
	public int getPageCount(int numPerPage, int dataCount){
		
		int pageCount = 0;
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0)
			pageCount++;
		
		return pageCount;	
		
	}
	
	//�럹�씠吏� 泥섎━ 硫붿냼�뱶
	//currentPage :�쁽�옱 �몴�떆�븷 �럹�씠吏�
	//totalPage : �쟾泥� �럹�씠吏��닔
	//listUrl : 留곹겕瑜� �꽕�젙�븷 url
	public String pageIndexList(int currentPage, int totalPage, String listUrl){
		
		int numPerBlock = 5; //1���씠�쟾 6 7 8 9 10 �떎�쓬�뼳11(6-10源뚯� �몴�떆�릺�뒗 �럹�씠吏� 媛��닔)
		int currentPageSetup; //�몴�떆�븷 泥� �럹�씠吏�(6)�쓽 �� 1 �빐以� 媛�(5,10,15,20...)
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0)	//�뜲�씠�꽣媛� �뾾�쓣 寃쎌슦
			return "";
		
		//abc.jsp?a=1
		if(listUrl.indexOf("?") != -1)  //二쇱냼以꾩뿉 ?�몴媛� �엳�떎硫�
			listUrl = listUrl + "&";
		else
			listUrl = listUrl + "?";
		
		//�몴�떆�븷 泥� �럹�씠吏��쓽 �� 1 �빐以� 媛�
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		
		if(currentPage % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;
		
		//���씠�쟾
		if(totalPage > numPerBlock && currentPageSetup > 0){
						
			sb.append("<a href=\"" + listUrl + "pageNum=" 
					+ currentPageSetup + "\">���씠�쟾</a>&nbsp;");
			
		}
		
		//諛붾줈媛�湲� �럹�씠吏�
		page = currentPageSetup + 1;
		
		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)){
			
			if(page == currentPage){				
				
				sb.append("<font color=\"Fuchsia\">" + page + "</font>&nbsp;");				
			
			}else{
				
				sb.append("<a onclick=\"submit('"+listUrl+"','"+page+"');\" href=\"javascript:void(0);\">"
						+ page + "</a>&nbsp;");
				
			}
			
			page++;
			
		}		
		
		//�떎�쓬�뼳
		if(totalPage - currentPageSetup > numPerBlock){
						
			sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">�떎�쓬�뼳</a>&nbsp;");
			
		}
		
		
		return sb.toString();
		
	}
}
