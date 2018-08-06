package order.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.CartService;
import svc.ItemService;
import svc.UserService;
import vo.ActionForward;
import vo.Cart;
import vo.ItemBean;
import vo.OrderViewBean;
import vo.UserBean;

public class OrderFormAction implements Action {

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
		}
		else {
			CartService cartService = new CartService();
			UserService userService = new UserService();
			ItemService itemService = new ItemService();
			
			UserBean user = userService.selectUserInfo(id);
			ArrayList<OrderViewBean> orderList = new ArrayList<OrderViewBean>();
			ArrayList<Cart> cartList = cartService.getCartList(request);
			ItemBean item = null;
			String codes[] = null;
			
			if(request.getParameter("type").equals("all")) {
				for(int i=0;i<cartList.size();i++) {
					orderList.add(new OrderViewBean(0, cartList.get(i).getItem_code(),
							cartList.get(i).getItem_name(),
							cartList.get(i).getSprice(),cartList.get(i).getQty()));
				}
			}else if(request.getParameter("type").equals("sel")) {
				codes = request.getParameterValues("icheck");
				for(int i=0;i<codes.length;i++) {
					for(int j=0;j<cartList.size();j++) {
						if(cartList.get(j).getItem_code().equals(codes[i]))
							orderList.add(new OrderViewBean(0, cartList.get(i).getItem_code(),
									cartList.get(i).getItem_name(), 
									cartList.get(i).getSprice(),cartList.get(i).getQty()));
					}
				}
			}else if(request.getParameter("type").equals("one")) {
				String code = request.getParameter("item_code");
				int qty = Integer.parseInt(request.getParameter("qty"));
				item = itemService.getItem(code);
				orderList.add(new OrderViewBean(0, item.getItem_name(), item.getItem_code(),
						(int)(item.getPrice()*(1.0-item.getSale()/100.0)),qty));
				
			}
			int totalMoney = 0;
			for(int i=0;i<orderList.size();i++) {
				totalMoney += orderList.get(i).getPrice()*orderList.get(i).getAmount();
			}
			if(totalMoney<30000) {
				request.setAttribute("parcel", "exist");
				totalMoney+=3000;
			}
			request.setAttribute("user", user);
			request.setAttribute("orderList", orderList);
			request.setAttribute("totalMoney", totalMoney);
			forward= new ActionForward("../order/order.jsp",false);
		}
		return forward;
	}

}
