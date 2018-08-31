package item.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.ItemService;
import vo.ActionForward;

public class ItemHideAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		ItemService itemService = new ItemService();
		String codes[];
		String item_code;
		int updateCount=0;
		item_code = request.getParameter("item_code");
		
		if(item_code==null&&request.getParameterValues("icheck")==null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('선택된 상품이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		else if(item_code==null) {
			codes = request.getParameterValues("icheck");
			for(int i=0;i<codes.length;i++) {
				updateCount = itemService.hideItem(codes[i]);
			}
		}else {
			updateCount = itemService.hideItem(item_code);
		}
		
		if(updateCount==0) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('숨김실패');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward= new ActionForward("./itemList.im",false);
		}
		return forward;
	}
}
