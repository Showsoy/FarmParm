package order.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.OrderService;
import vo.ActionForward;

public class MyOrderChangeAction implements Action {

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
			out.println("location.href='../member/memberLogin.us?turn=ok';");
			out.println("</script>");
		}else {
			OrderService orderService = new OrderService();
			int updateCount=0;
			int order_id = Integer.parseInt(request.getParameter("order_id"));
			String state = request.getParameter("od_state");
			updateCount = orderService.changeOrderState(order_id, state);
			if(updateCount==0) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('변경실패');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				String page = request.getParameter("page");
				forward= new ActionForward("./myodView.od?order_id="+order_id+"&page="+page,true);
			}
		}
		return forward;
	}

}
