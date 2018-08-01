package admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemService;
import vo.ActionForward;

public class ItemDeleteAction implements action.Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		ItemService itemService = new ItemService();
		String codes[];
		String item_code;
		int deleteCount=0;
		item_code = request.getParameter("item_code");
		
		if(item_code==null) {
			codes = request.getParameterValues("icheck");
			for(int i=0;i<codes.length;i++) {
				deleteCount = itemService.deleteItem(codes[i]);
			}
		}else {
			deleteCount = itemService.deleteItem(item_code);
		}
		
		if(deleteCount==0) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제실패');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward= new ActionForward("./itemList.im",false);
		}
		return forward;
	}

}
