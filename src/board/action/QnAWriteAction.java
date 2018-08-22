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

public class QnAWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id==null) {
			request.setAttribute("act", "login");
			forward= new ActionForward("./qnaform.jsp",false);
		}else {
			BoardService boardService = new BoardService();
		
			Date date = new Date(0, 0, 0);	
			
			String realFolder = "";
			String saveFolder = "/images";
			String encType = "UTF-8";
			int fileSize = 5*1024*1024;
			int qhide = 0;
			
			ServletContext context = request.getServletContext();
			realFolder = context.getRealPath(saveFolder);
			MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, encType, new DefaultFileRenamePolicy());
			int bnum = boardService.searchBNum("qna_board", multi.getParameter("item_code"));
			String image = multi.getFilesystemName("image");
			if(multi.getParameter("hide")!=null) qhide = 1;
			BoardBean board = new BoardBean(
					bnum,
					multi.getParameter("item_code"),
					id,
					multi.getParameter("content"),
					multi.getParameter("subject"),
					image,0,date,qhide,bnum,1);
			boolean isWriteSuccess = boardService.writeQnA(board);
			if(!isWriteSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('등록실패');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				request.setAttribute("act", "ok");
				forward= new ActionForward("./qnaform.jsp",false);//리스트로 들어감
			}
		}
		return forward;
	}

}
