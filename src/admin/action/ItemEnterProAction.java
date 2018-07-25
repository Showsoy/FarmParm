package admin.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.ItemService;
import vo.ActionForward;
import vo.ItemBean;
import vo.ItemStockBean;

public class ItemEnterProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		Date date = (Date) sdf.parse(request.getParameter("idate"));

		ItemStockBean itemStock = new ItemStockBean(
				request.getParameter("item_code"),
				"입고",
				date,
				Integer.parseInt(request.getParameter("amount")),
				0,
				0);
		
		
		ItemService itemService = new ItemService();
		
		int insertCount = itemService.itemEnter(itemStock);
		
		if(insertCount<1) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward= new ActionForward("./itemSearch.jsp",false);//리스트로 들어감
		}
		return forward;
	}

}
