package board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.BoardService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;

public class ReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		int page = 1;
		int limit = 10;
		int limitPage = 10;
		int listCount = 10;
		
		if(request.getParameter("page")!=null&&!request.getParameter("page").equals("")) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		BoardService boardService = new BoardService();
		
		if(request.getParameter("std")!=null) {
			String std = request.getParameter("std");
			request.setAttribute("std", std);
			if(request.getParameter("keyword")!=null) {
				String keyword = request.getParameter("keyword");
				listCount = boardService.searchReviewCount(keyword, std);
				boardList = boardService.searchReviewList(keyword, page, std);
				request.setAttribute("keyword", keyword);
			}else if(std.equals("reply")) {
				listCount = boardService.replyListCount("review_board");
				boardList = boardService.selectReviewList("reply", page);
			}else if(std.equals("myre")) {
				listCount = boardService.myArticelListCount("review_board", id);
				boardList = boardService.selectReviewList(id, page);
			}
		}else {
			listCount = boardService.selectListCount("review_board");
			boardList = boardService.selectReviewList("not", page);
		}
		
		int maxPage = (int)((double)listCount/limit+0.95);
		int startPage = (((int)((double)page/limitPage+0.9))-1) *limitPage +1;
		int endPage = startPage+limitPage-1;
		if(endPage>maxPage) endPage = maxPage;
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("boardList", boardList);
		forward= new ActionForward("../item/reviewList.jsp",false);
		return forward;
	}

}
