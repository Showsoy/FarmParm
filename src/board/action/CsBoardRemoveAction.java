package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.BoardService;
import svc.ItemService;
import vo.ActionForward;

public class CsBoardRemoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		BoardService boardService = new BoardService();
		String nums[];
		int board_num;
		int deleteCount=0;
		
		if(request.getParameter("board_num")==null) {
			nums = request.getParameterValues("icheck");
			for(int i=0;i<nums.length;i++) {
				System.out.println(nums[i]);
				deleteCount = boardService.removeArticle("cs_board", Integer.parseInt(nums[i]));
			}
		}else {
			board_num = Integer.parseInt(request.getParameter("board_num"));
			deleteCount = boardService.removeArticle("cs_board", board_num);
		}
		
		if(deleteCount==0) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제실패');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward= new ActionForward("./itemList.im",false);
		}
		return forward;
	}

}
