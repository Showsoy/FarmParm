package item.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.CartService;
import svc.ItemService;
import vo.ActionForward;

public class CartChangeQtyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		String item_code = request.getParameter("item_code");
		int qty = Integer.parseInt(request.getParameter(item_code+"_qty"));
		ItemService itemService = new ItemService();
		int stock = itemService.findItemStock(item_code);
		if(stock<qty) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("var stock = "+stock);
			out.println("alert(\"재고부족으로 \"+stock+\"개 이하만 가능합니다.\");");
			out.println("history.back();");
			out.println("</script>");
		}else {
			CartService cartService = new CartService();
			cartService.changeCartQty(request, item_code, qty);
			forward = new ActionForward("./cartList.ct",true);
		}
		return forward;
	}

}
