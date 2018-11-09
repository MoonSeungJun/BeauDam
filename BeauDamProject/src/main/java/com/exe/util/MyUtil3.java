package com.exe.util;

import org.springframework.stereotype.*;

@Service
public class MyUtil3 {
	
	public int getPageCount(int numPerPage, int reviewCount){
		
		int pageCount = 0;
		pageCount = reviewCount / numPerPage;
		
		if(reviewCount % numPerPage != 0)
			pageCount++;
		
		return pageCount;	
		
	}
	
	public String pageIndexList(int currentReviewPage, int totalReviewPage, String reviewUrl){
		
		int numPerBlock = 5;
		int currentPageSetup;
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentReviewPage==0 || totalReviewPage==0)
			return "";
		

		currentPageSetup = (currentReviewPage/numPerBlock)*numPerBlock;
		
		if(currentReviewPage % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;
		

		if(totalReviewPage > numPerBlock && currentPageSetup > 0){
						
			sb.append("<a style=\"color: black; font-family: 'YiSunShinDotumM'; padding: 3px;\"  href=\"" + reviewUrl + "&reviewPage=" 
					+ currentPageSetup + "&flag=1\">◀이전</a>&nbsp;");
			
		}
		

		page = currentPageSetup + 1;
		
		while(page <= totalReviewPage && page <= (currentPageSetup + numPerBlock)){
			
			if(page == currentReviewPage){				
				
				sb.append("	<font style=\"color: #ee782f; font-family: 'YiSunShinDotumM'; padding: 3px;\">" + page + "</font>&nbsp;");				
			
			}else{
				
				sb.append("<a style=\"color: black; font-family: 'YiSunShinDotumM'; padding: 3px;\" href=\"" + reviewUrl + "&reviewPage=" + page + "&flag=1\">"
		                  + page + "</a>&nbsp;");
				
			}
			
			page++;
			
		}		
		

		if(totalReviewPage - currentPageSetup > numPerBlock){
						
			sb.append("<a style=\"color: black; font-family: 'YiSunShinDotumM'; padding: 3px;\" href=\"" + reviewUrl + "&reviewPage=" + page + "&flag=1\">다음▶</a>&nbsp;");
			
		}
		
		
		return sb.toString();
		
	}
}
