package board.action;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.BoardService;
import vo.ActionForward;
import vo.BoardBean;

public class QnAReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id==null) {
			request.setAttribute("act", "login");
			forward= new ActionForward("./qnareform.jsp",false);
		}else {
			BoardService boardService = new BoardService();
		
			Date date = new Date(0, 0, 0);	
			
			int bnum = boardService.searchBNum("qna_board", request.getParameter("item_code"));
			BoardBean board = new BoardBean(
					bnum,
					request.getParameter("item_code"),
					"admin",
					request.getParameter("content"),
					request.getParameter("subject"),
					"",0,date,0,Integer.parseInt(request.getParameter("rgroup")),2);
			boolean isWriteSuccess = boardService.replyQnA(board);
			if(!isWriteSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('등록실패');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				request.setAttribute("act", "ok");
				forward= new ActionForward("./qnareform.jsp",false);//리스트로 들어감
			}
		}
		return forward;
	}

}
