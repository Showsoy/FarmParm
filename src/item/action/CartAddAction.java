package item.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.CartService;
import vo.ActionForward;
import vo.ItemBean;

public class CartAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		CartService cartService = new CartService();
		String item_code = request.getParameter("item_code");
		ItemBean cartItem = cartService.getCartItem(item_code);
		int qty=1;
		if(request.getParameter("qty")!=null) {
			qty = Integer.parseInt(request.getParameter("qty"));
		}
		cartService.addCart(request, cartItem, qty);
		ActionForward forward = new ActionForward("../item/cartList.ct",true);
		return forward;
	}

}
