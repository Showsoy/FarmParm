package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.BoardService;
import vo.ActionForward;
import vo.Util;

public class QnARemoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		request.setCharacterEncoding("UTF-8");
		
		if(id==null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			
			String bnum = request.getParameter("bnum");
			String item_code = request.getParameter("item_code");
			String page = request.getParameter("page");
			String rgroup = request.getParameter("rgroup");
			String rstep = request.getParameter("rstep");
			
			BoardService boardService = new BoardService();
			
			if(rstep.equals("2")){
				//qna 답변삭제
				boolean deleteResult = boardService.deleteQnaReplyArticle(bnum);
				int resetHas_re = boardService.resetQnaReplyArticle(rgroup);
				
				if (deleteResult==true&&resetHas_re>0) {
					forward = new ActionForward();
					//forward.setRedirect(true);
					forward.setPath("uitemView.im");
					//response.sendRedirect("uitemView.im");
				}else{
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('삭제실패');");
					out.println("history.back();");
					out.println("</script>");
				}
			
			}else {
				//qna 원글삭제
				boolean deleteResult = boardService.deleteQnaArticle(rgroup);
				if(deleteResult) {
					forward = new ActionForward();
					//forward.setRedirect(true);
					forward.setPath("uitemView.im");
					//response.sendRedirect("uitemView.im");
				}else {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('삭제실패');");
					out.println("history.back();");
					out.println("</script>");
				}
			
			}
			

		}
		return forward;
	}

}
