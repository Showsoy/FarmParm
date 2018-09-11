package item.action;

import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.ItemService;
import vo.ActionForward;
import vo.ItemStockBean;

public class ItemEnterProAction implements Action {

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
		}else if(!id.equals("admin")) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다.');");
			out.println("location.href='../main.im';");
			out.println("</script>");
		}else {
			String item_code = request.getParameter("item_code");
	
			ItemStockBean itemStock = new ItemStockBean(
					item_code,
					request.getParameter("inandout").equals("item_in") ? "입고" : "출고",
					null,
					request.getParameter("inandout").equals("item_in") ? 
							Integer.parseInt(request.getParameter("amount")):-Integer.parseInt(request.getParameter("amount")),
					0, 0);
			
			ItemService itemService = new ItemService();
			
			HashMap<String, Integer> imap = itemService.findRecentStock(item_code);
			int insertCount = itemService.itemStockInOut(itemStock, imap);
			
			if(insertCount<1) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('등록실패');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				String path = request.getParameter("turn").equals("item") ? "./itemList.im" : "./itemSearch.im";
				forward= new ActionForward(path, true);//리스트로 들어감
			}
		}
		return forward;
	}

}
