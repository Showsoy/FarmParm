package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.BoardService;
import vo.ActionForward;
import vo.BoardBean;

public class ReviewViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		int board_num = Integer.parseInt(request.getParameter("bnum"));
		String item_code = request.getParameter("item_code");
		BoardService boardService = new BoardService();
		BoardBean board = boardService.selectArticle("review_board", item_code, board_num);
		BoardBean rboard = boardService.selectReply("review_board", board.getRgroup(), item_code);
		String item_name = boardService.findItemName(item_code);
		
		
		request.setAttribute("board", board);
		request.setAttribute("rboard", rboard);
		String page = request.getParameter("page");
		if(request.getParameter("keyword")!=null) { 
			request.setAttribute("keyword", request.getParameter("keyword"));
			request.setAttribute("review_search", request.getParameter("review_search"));
		}
		request.setAttribute("page", page);
		request.setAttribute("item_name", item_name);
		forward = new ActionForward("./review_view.jsp", false);
		
		return forward;
	}

}