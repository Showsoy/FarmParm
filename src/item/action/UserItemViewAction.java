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
		String id = (String)session.getAttribute("id");

		String item_code = request.getParameter("item_code");
		ItemService itemService = new ItemService();
		BoardService boardService = new BoardService();

		ArrayList<BoardBean> qnaList = new ArrayList<BoardBean>();
		ArrayList<BoardBean> reviewList = new ArrayList<BoardBean>();
		int q_page=1;
	  	int r_page=1;
		int limit=5;
		
		if(request.getParameter("q_page")!=null){
			q_page=Integer.parseInt(request.getParameter("q_page"));
		}
		if(request.getParameter("r_page")!=null){
			r_page=Integer.parseInt(request.getParameter("r_page"));
		}
		
		int qlistCount = boardService.selectListCount("qna_board", item_code);
		int rlistCount = boardService.selectListCount("review_board", item_code);
		qnaList = boardService.selectQnAList(q_page, item_code, id);
		reviewList = boardService.selectReviewList(r_page, item_code);
		
		int q_maxPage=(int)((double)qlistCount/limit+0.95);
   		int q_startPage = (((int) ((double)q_page / 10 + 0.9)) - 1) * 10 + 1;
   	    int q_endPage = q_startPage+10-1;
		if (q_endPage> q_maxPage) q_endPage = q_maxPage;
		PageInfo q_pageInfo = new PageInfo();
		q_pageInfo.setEndPage(q_endPage);
		q_pageInfo.setListCount(qlistCount);
		q_pageInfo.setMaxPage(q_maxPage);
		q_pageInfo.setPage(q_page);
		q_pageInfo.setStartPage(q_startPage);
		
		int r_maxPage=(int)((double)rlistCount/limit+0.95);
   		int r_startPage = (((int) ((double)r_page / 10 + 0.9)) - 1) * 10 + 1;
   	    int r_endPage = r_startPage+10-1;
		if (r_endPage> r_maxPage) r_endPage = r_maxPage;
		PageInfo r_pageInfo = new PageInfo();
		r_pageInfo.setEndPage(r_endPage);
		r_pageInfo.setListCount(rlistCount);
		r_pageInfo.setMaxPage(r_maxPage);
		r_pageInfo.setPage(r_page);
		r_pageInfo.setStartPage(r_startPage);

		forward = new ActionForward();
		ItemBean item = itemService.getItem(item_code);
		int stock = itemService.findItemStock(item_code);
		if(id==null||!id.equals("admin")) {
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
		request.setAttribute("q_pageInfo", q_pageInfo);
		request.setAttribute("r_pageInfo", r_pageInfo);
		request.setAttribute("qnaList", qnaList);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("todayImageMap", todayImageMap);
		request.setAttribute("item",item);
		request.setAttribute("stock",stock);
		request.setAttribute("q_page", q_page);
		request.setAttribute("r_page", r_page);
		forward = new ActionForward();
		forward.setPath("./item/detail.jsp");
		
		return forward;
		
		
	}

}
