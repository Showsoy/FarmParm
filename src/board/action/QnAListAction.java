package board.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.BoardService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;

public class QnAListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id==null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='../member/memberLogin.us?turn=ok';");
			out.println("</script>");
		}else if(!id.equals("admin")) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}else {
		
			ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
			String keyword = null;
			String std = null;
			int page = 1;
			int limit = 10;
			int limitPage = 10;
			int listCount = 10;
			
			if(request.getParameter("page")!=null&&!request.getParameter("page").equals("")) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			BoardService boardService = new BoardService();
			if(request.getParameter("std")!=null) {
				std = request.getParameter("std");
				request.setAttribute("std", std);
				if(request.getParameter("keyword")!=null) {
					keyword = request.getParameter("keyword");
					listCount = boardService.searchQnACount(keyword, std);
					boardList = boardService.searchQnAList(keyword, page, std);
					request.setAttribute("keyword", keyword);
				}else if(std.equals("reply")){
					listCount = boardService.replyListCount("qna_board");
					boardList = boardService.selectQnAList(true, page);
				}
			}else {
				listCount = boardService.selectListCount("qna_board");
				boardList = boardService.selectQnAList(false, page);
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
			forward= new ActionForward("./qnaList.jsp",false);
		}
		return forward;
	}

}
