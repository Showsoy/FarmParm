package item.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BoardService;
import svc.ItemService;
import vo.ActionForward;
import vo.BoardBean;
import vo.ItemBean;
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
		BoardService boardService = new BoardService();	
		
		ArrayList<BoardBean> q_articleList = new ArrayList<BoardBean>();
	  	int q_page=1;
		int limit=5;

		if(request.getParameter("q_page")!=null){
			q_page=Integer.parseInt(request.getParameter("q_page"));
		}

		int listCount = boardService.qnaListCount();
		q_articleList = boardService.qna_list(q_page,limit);
		
		int maxPage=(int)((double)listCount/limit+0.95); //0.95를 더해서 올림 처리.
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startPage = (((int) ((double)q_page / 10 + 0.9)) - 1) * 10 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
   	    int endPage = startPage+10-1;
   	    
		forward = new ActionForward();
	

		ItemBean item = itemService.getItem(item_code);
		if(id!=null&&!id.equals("admin")) {
			itemService.updateReadCount(item_code);
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
		Map<String,String> todayImageMap = new HashMap<String,String>();
		//길이가 8이면 7부터 -> 7 6 5 4 3, 2전까지 2는 길이 - 6
		int count = 0;
		if (cookieArray != null) {
			for (int i = cookieArray.length - 1; i >= 0; i--) {
				if (count == 5)
					break;
				if (cookieArray[i].getName().startsWith("today")) {
					todayImageMap.put(cookieArray[i].getName().replaceAll("today", ""), cookieArray[i].getValue());
					count++;
				}
			}
		}
		
		// ****상품문의 리스트****** 
		
		if (endPage> maxPage) endPage= maxPage;
		PageInfo q_pageInfo = new PageInfo();
		q_pageInfo.setEndPage(endPage);
		q_pageInfo.setListCount(listCount);
		q_pageInfo.setMaxPage(maxPage);
		q_pageInfo.setPage(q_page);
		q_pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", q_pageInfo);
		request.setAttribute("articleList", q_articleList);
		
		// ****상품문의 리스트****** 
		
		request.setAttribute("todayImageMap", todayImageMap);
		request.setAttribute("item",item);
		request.setAttribute("q_page", q_page);
		//String page_2 = request.getParameter("page");
		forward = new ActionForward();
		forward.setPath("item/detail.jsp");
		
		return forward;
		
		
	}

}
