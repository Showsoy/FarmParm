package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.BoardService;
import vo.ActionForward;
import vo.BoardBean;

public class MyQnAViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		String user_id = null;
		String myQna = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		user_id = request.getParameter("user_id");
		myQna = request.getParameter("myQna");
		
		if(id==null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='../member/memberLogin.us?turn=ok';");
			out.println("</script>");
		}else {
			int board_num = Integer.parseInt(request.getParameter("bnum"));
			String item_code = request.getParameter("item_code");
			BoardService boardService = new BoardService();
			BoardBean board = boardService.selectArticle("qna_board", item_code, board_num);
			BoardBean rboard = boardService.selectReply("qna_board", board.getRgroup(), item_code);
			String item_name = boardService.findItemName(item_code);
			
			if(user_id!=null) request.setAttribute("user_id", user_id);
			if(myQna != null) request.setAttribute("myQna", myQna);
			request.setAttribute("board", board);
			request.setAttribute("rboard", rboard);
			String page = request.getParameter("page");
			request.setAttribute("page", page);
			request.setAttribute("item_name", item_name);
			forward = new ActionForward("./member/myQna_view.jsp", false);
		}
		
		return forward;
	}

}