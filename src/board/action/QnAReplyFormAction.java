package board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import vo.ActionForward;
import vo.BoardBean;

public class QnAReplyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
   		String nowPage = request.getParameter("page");
   		String item_code = request.getParameter("item_code");
   		String re_bnum = request.getParameter("re_bnum");
   		
   		request.setAttribute("re_item_code", item_code);
   		request.setAttribute("re_page", nowPage);
   		request.setAttribute("re_bnum", re_bnum);
   		forward.setPath("item/reply.jsp");
   		return forward;
		
	}

}
