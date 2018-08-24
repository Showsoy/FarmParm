package member.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.BoardService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;

public class MyQnaListAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		}else {
			ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
			int page = 1;
			int limit = 10;
			int limitPage = 10;
			int listCount = 10;
			
			if(request.getParameter("page")!=null&&!request.getParameter("page").equals("")) {
				page = Integer.parseInt(request.getParameter("page"));}
			
				BoardService boardService = new BoardService();
				listCount = boardService.myQnaListCount("qna_board", id);
				boardList = boardService.myQnAList(page, id);
				
				int maxPage = (int)((double)listCount/limit+0.95);
				int startPage = (((int)((double)page/limitPage+0.9))-1) *limitPage +1;
				int endPage = startPage+limitPage-1;
				if(endPage>maxPage) endPage = maxPage;
				PageInfo pageInfo = new PageInfo();
				pageInfo.setEndPage(endPage);
				pageInfo.setListCount(listCount);
				pageInfo.setMaxPage(maxPage);
				pageInfo.setPage(page);
				pageInfo.setStartPage(startPage);
				request.setAttribute("pageInfo", pageInfo);
				request.setAttribute("boardList", boardList);
				forward= new ActionForward();
				forward.setPath("/member/myQna.jsp");
			}
		return forward;
	}
}
