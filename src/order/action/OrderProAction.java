package order.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.OrderService;
import svc.UserService;
import vo.ActionForward;
import vo.OrderBean;
import vo.OrderItemBean;
import vo.OrderViewBean;
import vo.UserBean;

public class OrderProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		OrderService orderService = new OrderService();
		if(id==null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='../member/memberLogin.us?turn=ok';");
			out.println("</script>");
		}
		else {
			ArrayList<OrderViewBean> orderList = new ArrayList<OrderViewBean>();
			String od_item_code[] = request.getParameterValues("od_item_code");
			String od_item_name[] = request.getParameterValues("od_item_name");
			String od_price[] = request.getParameterValues("od_price");
			String od_amount[] = request.getParameterValues("od_amount");
			
			int order_id = orderService.selectOrderId();
			
			for(int i=0;i<od_item_code.length;i++) {
				orderList.add(new OrderViewBean(order_id, od_item_code[i], od_item_name[i],
						Integer.parseInt(od_price[i]), Integer.parseInt(od_amount[i])));
			}
			
			Date date = new Date(0, 0, 0);	
			int totalPayment = Integer.parseInt(request.getParameter("totalMoney"))-Integer.parseInt(request.getParameter("depoint"));
			OrderBean order = new OrderBean(order_id, id, date, 
					request.getParameter("userAddr2")+request.getParameter("userAddr3"), 
					request.getParameter("userAddr1"), Integer.parseInt(request.getParameter("depoint")),
					"주문완료", totalPayment, 
					request.getParameter("payment"), request.getParameter("receiver"));

			boolean isRegistSuccess = orderService.takeOrder(order, orderList);
			if(!isRegistSuccess) {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('주문실패');");
					out.println("history.back();");
					out.println("</script>");
			}else {
				UserService userService = new UserService();
				UserBean user = userService.selectUserInfo(id);
				String mail_content = "주문하신 상품목록<br>";
				for(int i=0; i<orderList.size();i++) {
					mail_content += orderList.get(i).getItem_name()+" "+orderList.get(i).getPrice()+
							"원 X "+orderList.get(i).getAmount()+"개 <br>";
				}
				mail_content+="총 "+request.getParameter("totalMoney")+"원<br>";
				mail_content+="사용하신 포인트 "+request.getParameter("depoint")+"원<br>";
				mail_content+="총 결제금액 "+totalPayment+"원<br>";
				mail_content+="선택하신 결제방법 "+request.getParameter("payment")+"<br>";
				orderService.sendOrderMail(user.getEmail(), mail_content);
				forward= new ActionForward("./odComplete.jsp",false);//리스트로 들어감
			}
		}
		return forward;
	}

}
