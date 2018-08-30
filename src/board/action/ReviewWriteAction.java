package board.action;

import java.io.PrintWriter;

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
import vo.PointBean;

public class ReviewWriteAction implements Action {

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
			BoardService boardService = new BoardService();
			
			String realFolder = "";
			String saveFolder = "/images";
			String encType = "UTF-8";
			int fileSize = 5*1024*1024;
			
			ServletContext context = request.getServletContext();
			realFolder = context.getRealPath(saveFolder);
			MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, encType, new DefaultFileRenamePolicy());
			int bnum = boardService.searchBNum("review_board", multi.getParameter("item_code"));
			String image = multi.getFilesystemName("image");
			BoardBean board = new BoardBean(
					bnum,
					multi.getParameter("item_code"),
					id,
					multi.getParameter("content"),
					multi.getParameter("subject"),
					image,0,null,Integer.parseInt(multi.getParameter("order_id")),bnum,1);
			PointBean point = new PointBean(id, 0, "리뷰작성", 1, 500);
			boolean isWriteSuccess = boardService.writeReview(board, point);
			if(!isWriteSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('등록실패');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				request.setAttribute("act", "ok");
				forward= new ActionForward("./reviewform.jsp",false);//리스트로 들어감
			}
		}
		return forward;
	}

}
