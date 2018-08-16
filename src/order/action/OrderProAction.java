package order.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.OrderService;
import vo.ActionForward;
import vo.OrderBean;
import vo.OrderViewBean;

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
			int plpoint = 0;
			int order_id = orderService.selectOrderId();
			Calendar cal = Calendar.getInstance();
			Timestamp date = new Timestamp(cal.getTime().getTime());
			for(int i=0;i<od_item_code.length;i++) {
				orderList.add(new OrderViewBean(order_id, od_item_code[i], od_item_name[i],
						Integer.parseInt(od_price[i]), Integer.parseInt(od_amount[i]), date));
				plpoint += (int)(Integer.parseInt(od_price[i])*Integer.parseInt(od_amount[i])*0.01);
			}
			int totalPayment = Integer.parseInt(request.getParameter("totalMoney"))-Integer.parseInt(request.getParameter("depoint"));
			int depoint = Integer.parseInt(request.getParameter("depoint"));
			
			OrderBean order = new OrderBean(order_id, id, date, request.getParameter("phone"), 
					request.getParameter("email"),
					request.getParameter("userAddr2")+request.getParameter("userAddr3"), 
					request.getParameter("userAddr1"), depoint, "주문완료", totalPayment, 
					request.getParameter("payment"), request.getParameter("receiver"),
					Integer.parseInt(request.getParameter("parcel")));
			boolean isRegistSuccess = orderService.takeOrder(order, orderList, id, depoint, plpoint);
			if(!isRegistSuccess) {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('주문실패');");
					out.println("history.back();");
					out.println("</script>");
			}else {
				session.removeAttribute("cartList");
				String email = request.getParameter("email");
				String mail_content = "주문하신 상품목록<br>";
				for(int i=0; i<orderList.size();i++) {
					mail_content += orderList.get(i).getItem_name()+" "+orderList.get(i).getPrice()+
							"원 X "+orderList.get(i).getAmount()+"개 <br>";
				}
				if(Integer.parseInt(request.getParameter("parcel"))>0) mail_content += "배송비 3000원 X 1개<br>";
				mail_content+="총 "+request.getParameter("totalMoney")+"원<br>";
				mail_content+="사용하신 포인트 "+request.getParameter("depoint")+"원<br>";
				mail_content+="총 결제금액 "+totalPayment+"원<br>";
				mail_content+="적립 포인트 "+plpoint+"점<br>";
				mail_content+="선택하신 결제방법 "+request.getParameter("payment")+"<br>";
				orderService.sendOrderMail(email, mail_content);
				forward= new ActionForward("./odComplete.jsp",false);//리스트로 들어감
			}
		}
		//장바구니 지우기
		return forward;
	}

}
