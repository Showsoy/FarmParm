package item.action;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ItemService;
import vo.ActionForward;
import vo.ItemBean;
import vo.ItemStockBean;
import vo.PageInfo;

public class UserItemViewAction implements action.Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");

		String item_code = request.getParameter("item_code");
		ItemService itemService = new ItemService();
		
		//재고 페이지
//		int i_page = 1;
//		int i_limit = 10;
//		int i_limitPage = 10;
//		
//		if(request.getParameter("i_page")!=null) {
//			i_page = Integer.parseInt(request.getParameter("i_page"));
//		}
//		
//		int listCount = itemService.itemStockCount(item_code);
//		int i_maxPage = (int)((double)listCount/i_limit+0.95); 
//		int i_startPage = (((int)((double)i_page/i_limitPage+0.9))-1) *i_limitPage +1;
//		int i_endPage = i_startPage+i_limitPage-1;
//		
//		if(i_endPage>i_maxPage) i_endPage = i_maxPage;
//		System.out.print(i_maxPage+" ");System.out.print(i_startPage+" ");System.out.print(i_endPage+" ");
//		PageInfo i_pageInfo = new PageInfo();
//		i_pageInfo.setEndPage(i_endPage);
//		i_pageInfo.setListCount(listCount);
//		i_pageInfo.setMaxPage(i_maxPage);
//		i_pageInfo.setPage(i_page);
//		i_pageInfo.setStartPage(i_startPage);
//		request.setAttribute("i_pageInfo", i_pageInfo);
		
		forward = new ActionForward();
		ItemBean item = itemService.getItem(item_code);
		if(id!=null&&!id.equals("admin")) {
			int updateCount = itemService.updateReadCount(item_code);
		}
		//Cookie add
		Cookie todayImageCookie = new Cookie("today"+item_code, item.getImg_path());
		todayImageCookie.setMaxAge(60*60*24);
		Cookie[] cookieArray = request.getCookies();
		
		//이전 쿠키값 삭제
		if(cookieArray!=null) {
			for(int i=0;i<cookieArray.length;i++) {
				if(cookieArray[i].getName().equals("today"+item_code)) {
					Cookie temp = new Cookie("today"+item_code,"");
					temp.setMaxAge(0);
					response.addCookie(temp);
				}
			}
		}
		response.addCookie(todayImageCookie);
		
		//Cookie load
		ArrayList<String> todayImageList = new ArrayList<String>();
		//길이가 8이면 7부터 -> 7 6 5 4 3, 2전까지 2는 길이 - 6
		int count = 0;
		if (cookieArray != null) {
			for (int i = cookieArray.length - 1; i >= 0; i--) {
				if (count == 5)
					break;
				if (cookieArray[i].getName().startsWith("today")) {
					todayImageList.add(cookieArray[i].getValue());
					count++;
				}
			}
		}
		
		request.setAttribute("todayImageList", todayImageList);
		
		request.setAttribute("item",item);
		String page = request.getParameter("page");
		request.setAttribute("page", page);
		forward= new ActionForward("../item/detail.jsp",false);
		
		return forward;
	}

}
