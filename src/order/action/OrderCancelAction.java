package order.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.OrderService;
import vo.ActionForward;
import vo.OrderViewBean;

public class OrderCancelAction implements Action {

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
		}else if(!id.equals("admin")) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다.');");
			out.println("location.href='../main.im';");
			out.println("</script>");
		}else {
			OrderService orderService = new OrderService();
			ArrayList<OrderViewBean> orderList = new ArrayList<OrderViewBean>();
			String ids[];
			String order_id;
			int updateCount=0;
			order_id = request.getParameter("order_id");
			if(request.getParameterValues("icheck")==null&&order_id==null) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('선택된 주문이 없습니다.');");
				out.println("history.back();");
				out.println("</script>");
			}
			else if(order_id==null) {
				ids = request.getParameterValues("icheck");
				for(int i=0;i<ids.length;i++) {
					int tmpid = Integer.parseInt(ids[i]);
					orderList = orderService.orderItemList(tmpid);
					updateCount = orderService.cancelOrder(tmpid, orderList);
				}
			}else {
				int tmpid = Integer.parseInt(order_id);
				orderList = orderService.orderItemList(tmpid);
				updateCount = orderService.cancelOrder(tmpid, orderList);
			}
			if(updateCount==0) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('변경실패');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				if(order_id==null) {
					forward= new ActionForward("./odList.od",true);
				}else {
					if(request.getParameter("returnURI")!=null) request.setAttribute("returnURI", request.getParameter("returnURI"));
					String path = "./odView.od?order_id="+order_id;
					path = request.getParameter("upage")!=null ? path+"&upage="+request.getParameter("upage")+"&std="+request.getParameter("std")+"&keyword="+request.getParameter("keyword") : path+"&state="+request.getParameter("state")+"&page="+request.getParameter("page");
					
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("location.href=encodeURI('"+path+"');");
					out.println("</script>");
				}
			}
		}
		return forward;
	}

}
