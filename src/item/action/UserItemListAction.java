package item.action;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.ItemService;
import vo.ActionForward;
import vo.ItemViewBean;
import vo.PageInfo;

public class UserItemListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		ArrayList<ItemViewBean> itemList = new ArrayList<ItemViewBean>();
		int page = 1;
		int limit = 9;
		int limitPage = 10;
		int listCount = 10;
		
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		String category = request.getParameter("category");
		String standard = request.getParameter("std");
		
		if(standard.equals("new"))	standard = "vdate";
		else if(standard.equals("high"))  standard = "price";
		else if(standard.equals("pc"))  standard = "purchase";
		else if(standard.equals("rc"))  standard = "readcount";
		
		ItemService itemService = new ItemService();
		listCount = itemService.itemListCountIn(category);
		itemList = itemService.userItemList(page, category, standard);
		//총 리스트 수
		
		//리스트를 받아옴
		//총 페이지 수
		int maxPage = (int)((double)listCount/limit+0.95); 
		//올림 처리
		//현재 페이지를 보여줄 시작 페이지 수
		int startPage = (((int)((double)page/limitPage+0.9))-1) *limitPage +1;
		//현재 페이지에 보여줄 마지막 페이지 수
		int endPage = startPage+limitPage-1;
		
		if(endPage>maxPage) endPage = maxPage;
		System.out.print(maxPage+" ");System.out.print(startPage+" ");System.out.print(endPage+" ");
		//System.out.println(itemList);
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		
		//Cookie load
		ArrayList<String> todayImageList = new ArrayList<String>();
		Cookie[] cookieArray = request.getCookies();
		int count = 0;
		if (cookieArray != null) {
			for (int i = cookieArray.length-1; i >= 0; i--) {
				if(count==5) break;
				if (cookieArray[i].getName().startsWith("today")) {
					todayImageList.add(cookieArray[i].getValue());
					count++;
				}
			}
		}
		request.setAttribute("todayImageList", todayImageList);
		
		request.setAttribute("category", category);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("itemList", itemList);
		forward= new ActionForward("../item/uitemList.jsp",false);
		return forward;
	}

}
