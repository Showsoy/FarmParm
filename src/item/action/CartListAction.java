
package item.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.CartService;
import vo.ActionForward;
import vo.Cart;

public class CartListAction implements action.Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		CartService cartService = new CartService();
		ArrayList<Cart> cartList = cartService.getCartList(request);
		//System.out.println(cartList.get(0).getItem_code());
		int totalMoney = 0;
		int money = 0;
		
		for(int i=0;i<cartList.size();i++) {
			money = cartList.get(i).getSprice()*cartList.get(i).getQty();
			totalMoney += money;
		}
		request.setAttribute("totalMoney", totalMoney);
		request.setAttribute("money", money);
		ActionForward forward = new ActionForward("../item/cart.jsp",false);
		return forward;
	}

}
