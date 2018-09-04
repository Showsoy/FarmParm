package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.BoardService;
import svc.OrderService;
import vo.ActionForward;

public class ReviewWriteFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id==null) {
			request.setAttribute("act", "login");
			forward= new ActionForward("./reviewform.jsp",false);
		}else {
			String item_code = request.getParameter("item_code");
			BoardService boardService = new BoardService();
			OrderService orderService = new OrderService();
			int result = 0;
			if(request.getParameter("order_id")!=null) {
				int order_id = Integer.parseInt(request.getParameter("order_id"));
				boolean test = orderService.isBoughtUser(item_code, id, order_id);
				if(test) {
					boolean flag = boardService.testReviewBoard(item_code, id, order_id);
					if(flag) result = order_id;
					else result = 0;
				}
				else {
					result=-1;
				}
				
			}
			else result = boardService.testReviewBoard(item_code, id);
			
			if(result==-1) {
				request.setAttribute("act", "no");
			}else if(result==0) {
				request.setAttribute("act", "dupl");
			}else {
				request.setAttribute("item_code", item_code);
				request.setAttribute("order_id", result);
			}
			forward= new ActionForward("./reviewform.jsp",false);
		}
		return forward;
	}

}
