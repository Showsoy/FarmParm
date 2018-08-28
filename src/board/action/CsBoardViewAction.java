package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.BoardService;
import vo.ActionForward;
import vo.BoardBean;

public class CsBoardViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		int board_num = Integer.parseInt(request.getParameter("bnum"));
		BoardService boardService = new BoardService();
		BoardBean board = boardService.selectCsBoard(board_num);
		BoardBean rboard = boardService.selectReply(board.getRgroup());
		
		if (board.getCode().equals("HIDE")) {
			if (id!=null&&(board.getUser_id().equals(id)||id.equals("admin"))) {
				request.setAttribute("board", board);
				request.setAttribute("rboard", rboard);
				String page = request.getParameter("page");
				request.setAttribute("page", page);
				forward = new ActionForward("./csView.jsp", false);
			}else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('숨김글입니다.');");
				out.println("history.back();");
				out.println("</script>");
			}
		} else {
			request.setAttribute("board", board);
			request.setAttribute("rboard", rboard);
			String page = request.getParameter("page");
			if(request.getParameter("std")!=null) request.setAttribute("std", request.getParameter("std"));
			if(request.getParameter("keyword")!=null) request.setAttribute("keyword", request.getParameter("keyword"));
			request.setAttribute("page", page);
			forward = new ActionForward("./csView.jsp", false);
		}
		
		return forward;
	}

}
