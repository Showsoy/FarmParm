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
		String id = (String)session.getAttribute("id");
		if(id==null) {
			request.setAttribute("act", "login");
			forward= new ActionForward("./qnareform.jsp",false);
		}else {
			BoardService boardService = new BoardService();
			boolean has_re = boardService.hasReply("qna_board", request.getParameter("item_code"), Integer.parseInt(request.getParameter("rgroup")));
			if(has_re) {
				request.setAttribute("act", "dupl");
				forward= new ActionForward("./rereform.jsp",false);
				return forward;
			}
			
			int bnum = boardService.searchBNum("qna_board", request.getParameter("item_code"));
			BoardBean board = new BoardBean(
					bnum,
					request.getParameter("item_code"),
					"admin",
					request.getParameter("content"),
					"답변",
					"",0,null,0,Integer.parseInt(request.getParameter("rgroup")),2);
			boolean isWriteSuccess = boardService.replyQnA(board);
			if(!isWriteSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('등록실패');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				if(request.getParameter("page")!=null) {
					String page = request.getParameter("page");
					String item_code = request.getParameter("item_code");
					String rgroup = request.getParameter("rgroup");
					String path = "./qnaView.bo?bnum="+rgroup+"&item_code="+item_code+"&page="+page;
					if(request.getParameter("keyword")!=null) {
						path += "&std="+request.getParameter("std")+"&keyword="+request.getParameter("keyword");
						response.setContentType("text/html;charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>");
						out.println("location.href=encodeURI('"+path+"');");
						out.println("</script>");
					}else forward= new ActionForward(path,true);
				}else {
					request.setAttribute("act", "ok");
					forward= new ActionForward("./qnareform.jsp",false);//리스트로 들어감
				}
			}
		}
		return forward;
	}

}
