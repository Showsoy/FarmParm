package admin.action;

import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.ItemService;
import vo.ActionForward;
import vo.ItemBean;

public class ItemEnterFormAction implements Action {

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
			forward = new ActionForward();
			String item_code = request.getParameter("item_code");
			ItemService itemService = new ItemService();
			ItemBean item = itemService.getItem(item_code);
			request.setAttribute("item",item);
			forward= new ActionForward("./itemEnter.jsp",false);
		}
		return forward;
	}

}
