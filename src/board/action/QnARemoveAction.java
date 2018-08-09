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
		
		//페이지랑 아이템코드 값 가져와서 보내줘야 됨 *********************
		
		if(id==null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("history.back();");
			out.println("</script>");
		}else if(!id.equals("admin")) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			
			String bnum = request.getParameter("bnum");
			String item_code = request.getParameter("item_code");
			String page = request.getParameter("page");
			
			BoardService boardService = new BoardService();
			boolean deleteResult = boardService.deleteQnaArticle(bnum);

			if (deleteResult) {
				forward = new ActionForward();
				forward.setPath("uitemView.im");
				// 여기서 같이 넘겨야 됨 ************
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제실패');");
				out.println("history.back();");
				out.println("</script>");
			}
		}
		return forward;
	}

}
