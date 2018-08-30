package item.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.ItemService;
import vo.ActionForward;
import vo.ItemBean;

public class ItemModFormAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
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
			forward = new ActionForward();
			String item_code = request.getParameter("item_code");
			ItemService itemService = new ItemService();
			ItemBean item = itemService.getItem(item_code);
			String content = item.getContent();
			item.setContent(content.replace("<br>", "\r\n"));
			request.setAttribute("page", request.getParameter("page"));
			request.setAttribute("item",item);
			request.setAttribute("old_code", item_code);
			forward= new ActionForward("./itemMod.jsp",false);
		}
		return forward;
	}

}
