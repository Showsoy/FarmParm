package member.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.OrderService;
import svc.UserService;
import vo.ActionForward;
import vo.OrderBean;
import vo.OrderViewBean;
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
				OrderService orderService = new OrderService();
				String user_id = request.getParameter("user_id");
				ArrayList<OrderBean> orderList = new ArrayList<OrderBean>();
				int page = 1;
				int limit = 5;
				int limitPage = 10;
				int listCount = 0;
				
				listCount = orderService.listCountUserOrder(user_id);
				if(request.getParameter("page")!=null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
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
				
				UserBean user = userService.selectUserInfo(user_id);
				orderList = orderService.userOrderList(user_id, page, limit);
				
				String email = user.getEmail();
				String emails[] = new String[2];
				emails = email.split("@");
				
				request.setAttribute("email1", emails[0]);
				request.setAttribute("email2", emails[1]);
				request.setAttribute("page", page);
				request.setAttribute("pageInfo", pageInfo);
				request.setAttribute("user", user);
				request.setAttribute("orderList", orderList);
				forward= new ActionForward("/admin/userView.jsp",false);
			}
			return forward;
	}

}
