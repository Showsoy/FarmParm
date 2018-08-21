package board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		String keyword = "";
		String review_search = "";
		int page = 1;
		int limit = 10;
		int limitPage = 10;
		int listCount = 10;
		
		if(request.getParameter("page")!=null&&!request.getParameter("page").equals("")) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		BoardService boardService = new BoardService();
		
		if(request.getParameter("keyword")!=null) {
			keyword = request.getParameter("keyword");
			review_search = request.getParameter("review_search");
			listCount = boardService.searchReviewCount(keyword,review_search);
			boardList = boardService.searchReviewList(keyword, page, review_search);
			request.setAttribute("keyword", keyword);
		}else {
			listCount = boardService.selectListCount("review_board");
			boardList = boardService.selectReviewList(page);
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
		forward= new ActionForward("../item/reviewboard.jsp",false);
		return forward;
	}

}
