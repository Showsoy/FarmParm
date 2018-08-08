package board.action;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.BoardService;
import vo.ActionForward;
import vo.BoardBean;

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
			boolean result = boardService.testReviewBoard(item_code, id);
			if(!result) {
				request.setAttribute("act", "dupl");
				forward= new ActionForward("./reviewform.jsp",false);
			}else {
				request.setAttribute("item_code", item_code);
				forward= new ActionForward("./reviewform.jsp",false);
			}
		}
		return forward;
	}

}
