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
		cartService.addCart(request, cartItem);
		ActionForward forward = new ActionForward("../item/cartList.im",true);
		return forward;
	}

}
