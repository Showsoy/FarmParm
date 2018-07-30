package admin.action;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.ItemService;
import vo.ActionForward;
import vo.ItemStockBean;
import vo.Util;

public class ItemEnterProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		String item_code = request.getParameter("item_code");
		Util util = new Util();
		Date date = util.transformDate(request.getParameter("idate"));

		ItemStockBean itemStock = new ItemStockBean(
				item_code,
				"입고",
				date,
				Integer.parseInt(request.getParameter("amount")),
				0,
				0);
		
		
		ItemService itemService = new ItemService();
		
		int insertCount = itemService.itemEnter(itemStock, item_code);
		
		if(insertCount<1) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward= new ActionForward("./itemList.im",true);//리스트로 들어감
		}
		return forward;
	}

}
