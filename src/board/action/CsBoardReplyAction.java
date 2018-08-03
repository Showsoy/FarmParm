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

public class CsBoardReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		BoardService boardService = new BoardService();
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		int rbnum = boardService.searchBNum("cs_board");
		BoardBean parent = boardService.selectCsBoard(bnum);
		
		Date date = new Date(0, 0, 0);
		
		BoardBean board = new BoardBean(
				rbnum,
				parent.getCode(),
				"admin",
				request.getParameter("content"),
				"답변",
				"",0,date,0,parent.getRgroup(),2);
		boolean isWriteSuccess = boardService.replyCsBoard(board);
		if(!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward= new ActionForward("./csView.bo?bnum="+bnum,true);//리스트로 들어감
		}
		return forward;
	}

}
