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

public class NoticeModProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
// 			if(!id.equals("admin")) {
//			response.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('관리자가 아닙니다.');");
//			out.println("location.href='../dog/dogList.dog';");
//			out.println("</script>");
//		}
		
		BoardService boardService = new BoardService();
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		Date date = new Date(0, 0, 0);
		
		String realFolder = "";
		String saveFolder = "/images";
		String encType = "UTF-8";
		int fileSize = 5*1024*1024;
		
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, encType, new DefaultFileRenamePolicy());
		String image = multi.getFilesystemName("img_path");
		
		if(image==null) {
			image = multi.getParameter("oldImage");
			//<input type="hidden" id="oldImage" name="oldImage" value="${item.img_path}"/>
		}
		
		BoardBean board = new BoardBean(
				bnum,
				"",
				"",
				multi.getParameter("content"),
				multi.getParameter("subject"),
				image,0,date,0,0,0);
		boolean isWriteSuccess = boardService.writeNotice(board);
		if(!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward= new ActionForward("./noView.bo?bnum="+bnum,true);
		}
		return forward;
	}

}
