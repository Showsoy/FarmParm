package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.BoardService;
import vo.ActionForward;

public class NoticeRemoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		BoardService boardService = new BoardService();
		String nums[];
		int board_num;
		int deleteCount=0;
		
		if(request.getParameter("bnum")==null) {
			nums = request.getParameterValues("icheck");
			for(int i=0;i<nums.length;i++) {
				deleteCount = boardService.removeArticle("notice", Integer.parseInt(nums[i]));
			}
		}else {
			board_num = Integer.parseInt(request.getParameter("bnum"));
			deleteCount = boardService.removeNotice(board_num);
		}
		
		if(deleteCount==0) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제실패');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward= new ActionForward("./noList.bo",true);
		}
		return forward;
	}

}
