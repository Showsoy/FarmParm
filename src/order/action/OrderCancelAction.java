package order.action;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.OrderService;
import svc.UserService;
import vo.ActionForward;
import vo.PointBean;

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
			UserService userService = new UserService();
			String ids[];
			String order_id;
			int updateCount=0;
			order_id = request.getParameter("order_id");
			if(order_id==null) {
				ids = request.getParameterValues("icheck");
				for(int i=0;i<ids.length;i++) {
					int tmpid = Integer.parseInt(ids[i]);
					Map<String, Integer> pointMap = userService.orderPointMap(tmpid);
					PointBean point1 = new PointBean(id, tmpid, "결제취소반환", 1, pointMap.get("use"));
					PointBean point2 = new PointBean(id, tmpid, "결제취소회수", -1, pointMap.get("save"));
					updateCount = orderService.cancelOrder(tmpid, point1, point2);
				}
			}else {
				int tmpid = Integer.parseInt(order_id);
				Map<String, Integer> pointMap = userService.orderPointMap(tmpid);
				PointBean point1 = new PointBean(id, tmpid, "결제취소반환", 1, pointMap.get("use"));
				PointBean point2 = new PointBean(id, tmpid, "결제취소회수", -1, pointMap.get("save"));
				updateCount = orderService.cancelOrder(tmpid, point1, point2);
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
					String page = request.getParameter("page");
					forward= new ActionForward("./odView.od?order_id="+order_id+"&page="+page,true);
				}
			}
		}
		return forward;
	}

}
