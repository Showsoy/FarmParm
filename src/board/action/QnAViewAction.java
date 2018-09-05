package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.BoardService;
import vo.ActionForward;
import vo.BoardBean;

public class QnAViewAction implements Action {

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
			int board_num = Integer.parseInt(request.getParameter("bnum"));
			String item_code = request.getParameter("item_code");
			BoardService boardService = new BoardService();
			BoardBean board = boardService.selectArticle("qna_board", item_code, board_num);
			BoardBean rboard = boardService.selectReply("qna_board", board.getRgroup(), item_code);
			String item_name = boardService.findItemName(item_code);
			
			
			request.setAttribute("board", board);
			request.setAttribute("rboard", rboard);
			String page = request.getParameter("page");
			if(request.getParameter("turn")!=null) request.setAttribute("turn", request.getParameter("turn"));
			if(request.getParameter("user_id")!=null) request.setAttribute("user_id", request.getParameter("user_id"));
			if(request.getParameter("std")!=null) request.setAttribute("std", request.getParameter("std"));
			if(request.getParameter("keyword")!=null) request.setAttribute("keyword", request.getParameter("keyword"));
			request.setAttribute("page", page);
			request.setAttribute("item_name", item_name);
			forward = new ActionForward("./qna_view.jsp", false);
		}
		
		return forward;
	}

}
