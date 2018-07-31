package item.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.CartService;
import vo.ActionForward;

public class CartRemoveAction implements action.Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		CartService cartService = new CartService();
		if(request.getParameter("item_code")==null) {
			String[] kindArray = request.getParameterValues("icheck");
			cartService.cartRemove(request, kindArray);
		}else {
			String item_code = request.getParameter("item_code");
			cartService.cartRemove(request, item_code);
		}
		
		
		
		ActionForward forward = new ActionForward("./cartList.ct",true);
		return forward;

	}

}
