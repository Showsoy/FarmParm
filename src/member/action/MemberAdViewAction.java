package member.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.BoardService;
import svc.OrderService;
import svc.UserService;
import vo.ActionForward;
import vo.BoardBean;
import vo.OrderBean;
import vo.PageInfo;
import vo.UserBean;

public class MemberAdViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String user_id = request.getParameter("user_id");
		
			if(id==null) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인이 필요합니다.');");
				out.println("location.href='./member/memberLogin.us?turn=ok';");
				out.println("</script>");
			}else if(!id.equals("admin")) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('권한이 없습니다.');");
				out.println("location.href='../main.im';");
				out.println("</script>");
			}else {
				UserService userService = new UserService();
				BoardService boardService = new BoardService();
				OrderService orderService = new OrderService();
				ArrayList<OrderBean> orderList = new ArrayList<OrderBean>();
				ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
				
				int page = request.getParameter("page")!=null ? Integer.parseInt(request.getParameter("page")) : 1;
				
				/*주문내역페이지*/
				int o_page = request.getParameter("o_page")!=null ? Integer.parseInt(request.getParameter("o_page")) : 1;
				int o_limit = 5;
				int o_limitPage = 10;
				int o_listCount = 0;
				
				o_listCount = orderService.listCountUserOrder(user_id);
				int o_maxPage = (int)((double)o_listCount/o_limit+0.95); 
				int o_startPage = (((int)((double)o_page/o_limitPage+0.9))-1) *o_limitPage +1;
				int o_endPage = o_startPage+o_limitPage-1;
				
				if(o_endPage>o_maxPage) o_endPage = o_maxPage;
				PageInfo o_pageInfo = new PageInfo();
				o_pageInfo.setEndPage(o_endPage);
				o_pageInfo.setListCount(o_listCount);
				o_pageInfo.setMaxPage(o_maxPage);
				o_pageInfo.setPage(o_page);
				o_pageInfo.setStartPage(o_startPage);
				
				
				/*문의페이지*/
				int q_page = request.getParameter("q_page")!=null ? Integer.parseInt(request.getParameter("q_page")) : 1;
				int q_limit = 10;
				int q_limitPage = 10;
				int q_listCount = 0;
				
				q_listCount = boardService.myArticelListCount("qna_board", user_id);

				int q_maxPage = (int)((double)q_listCount/q_limit+0.95); 
				int q_startPage = (((int)((double)q_page/q_limitPage+0.9))-1) *q_limitPage +1;
				int q_endPage = q_startPage+q_limitPage-1;
				
				if(q_endPage>q_maxPage) q_endPage = q_maxPage;
				PageInfo q_pageInfo = new PageInfo();
				q_pageInfo.setEndPage(q_endPage);
				q_pageInfo.setListCount(q_listCount);
				q_pageInfo.setMaxPage(q_maxPage);
				q_pageInfo.setPage(q_page);
				q_pageInfo.setStartPage(q_startPage);
				
				
				UserBean user = userService.selectUserInfo(user_id);
				user.setPoint(userService.findRecentPoint(user_id));
				orderList = orderService.userOrderList(user_id, o_page, o_limit);
				boardList = boardService.myQnAList(q_page, user_id);
				
				
				
				String email = user.getEmail();
				String emails[] = new String[2];
				emails = email.split("@");
				
				if(request.getParameter("std")!=null) request.setAttribute("std", request.getParameter("std"));
				if(request.getParameter("keyword")!=null) request.setAttribute("keyword", request.getParameter("keyword"));
				request.setAttribute("email1", emails[0]);
				request.setAttribute("email2", emails[1]);
				request.setAttribute("page", page);
				request.setAttribute("o_page", o_page);
				request.setAttribute("q_page", q_page);
				request.setAttribute("pageInfo", o_pageInfo);
				request.setAttribute("q_pageInfo", q_pageInfo);
				request.setAttribute("boardList", boardList);
				request.setAttribute("user_id", user_id);
				request.setAttribute("user", user);
				request.setAttribute("orderList", orderList);
				forward= new ActionForward("/admin/userView.jsp",false);
			}
			return forward;
	}

}
