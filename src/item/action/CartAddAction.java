package item.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.CartService;
import svc.ItemService;
import vo.ActionForward;
import vo.ItemBean;

public class CartAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		CartService cartService = new CartService();
		String item_code = request.getParameter("item_code");
		ItemBean cartItem = cartService.getCartItem(item_code);
		int qty=1;
		if(request.getParameter("qty")!=null) {
			qty = Integer.parseInt(request.getParameter("qty"));
		}
		ItemService itemService = new ItemService();
		int stock = itemService.findItemStock(item_code);
		if(stock<qty) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('주문 가능 개수 초과');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			cartService.addCart(request, cartItem, qty);
			forward = new ActionForward("../item/cartList.ct",true);
		}
			return forward;
	}

}
