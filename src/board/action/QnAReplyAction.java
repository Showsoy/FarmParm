package board.action;

import java.io.PrintWriter;

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
		String id = (String) session.getAttribute("id");
		BoardService boardService = new BoardService();
		boolean has_re = boardService.hasReply("qna_board", request.getParameter("item_code"),
				Integer.parseInt(request.getParameter("rgroup")));
		if (id == null) {
			if (request.getParameter("page") == null) {
				request.setAttribute("act", "login");
				forward = new ActionForward("./rereform.jsp", false);
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인이 필요합니다.');");
				out.println("location.href='../member/memberLogin.us?turn=ok';");
				out.println("</script>");
			}
		}else if(has_re) {
			if (request.getParameter("page") == null) {
				request.setAttribute("act", "dupl");
				forward = new ActionForward("./rereform.jsp", false);
				return forward;
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('이미 작성한 답글이 있습니다.');");
				out.println("history.back();");
				out.println("</script>");
			}
		}else {
			int bnum = boardService.searchBNum("qna_board", request.getParameter("item_code"));
			BoardBean board = new BoardBean(bnum, request.getParameter("item_code"), "admin",
					request.getParameter("content"), "답변", "", 0, null, 0, Integer.parseInt(request.getParameter("rgroup")),
					2);
	
			boolean isWriteSuccess = boardService.replyQnA(board);
	
			if (!isWriteSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('등록실패');");
				out.println("history.back();");
				out.println("</script>");
			} else {
				if (request.getParameter("page") != null) {
					String page = request.getParameter("page");
					String item_code = request.getParameter("item_code");
					String rgroup = request.getParameter("rgroup");
					String path = "./qnaView.bo?bnum=" + rgroup + "&item_code=" + item_code + "&page=" + page;
	
					path = (request.getParameter("std") == null) ? path : path + "&std=" + request.getParameter("std");
					path = (request.getParameter("keyword") == null) ? path
							: path + "&keyword=" + request.getParameter("keyword");
	
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("location.href=encodeURI('" + path + "');");
					out.println("</script>");
				} else {
					request.setAttribute("act", "ok");
					forward = new ActionForward("./qnareform.jsp", false);
				}
			}
		}
		return forward;
	}

}
