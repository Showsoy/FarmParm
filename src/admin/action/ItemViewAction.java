package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ItemService;
import vo.ActionForward;
import vo.ItemBean;

public class ItemViewAction implements action.Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");
		ActionForward forward = null;
		
//		if(id==null) {
//			forward = new ActionForward();
//			forward.setRedirect(true);
//			forward.setPath("./memberLogin.me");
//		}else if(!id.equals("admin")) {
//			response.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('관리자가 아닙니다.');");
//			out.println("location.href='../dog/dogList.dog';");
//			out.println("</script>");
//		}
		forward = new ActionForward();
		String item_code = request.getParameter("item_code");
		ItemService itemService = new ItemService();
		ItemBean item = itemService.getItem(item_code);
		request.setAttribute("item",item);
		String page = request.getParameter("page");
		request.setAttribute("page", page);
		forward= new ActionForward("/itemView.jsp",false);
		
		return forward;
	}

}
