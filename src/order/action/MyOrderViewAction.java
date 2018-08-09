package order.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.OrderService;
import vo.ActionForward;
import vo.OrderBean;
import vo.OrderViewBean;

public class MyOrderViewAction implements Action {

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
		}else {
			int order_id = Integer.parseInt(request.getParameter("order_id"));
			OrderService orderService = new OrderService();
			OrderBean order = orderService.selectOrder(order_id);
			
			ArrayList<OrderViewBean> odtemList = orderService.orderItemList(order_id);
			String page = request.getParameter("page");
			request.setAttribute("page", page);
			request.setAttribute("order", order);
			request.setAttribute("odtemList", odtemList);
			forward= new ActionForward("./myOrderView.jsp",false);
		}
		return forward;
	}

}
