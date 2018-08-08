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
import vo.Util;

public class QnAWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		Util util = new Util();
		
		ActionForward forward=null;
		BoardBean boardBean = null;
		String realFolder="";
		String saveFolder="/images";
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		String indate = request.getParameter("qdate");
		Date date = util.transformDate(indate);
		String item_code = request.getParameter("item_code");
		
		boardBean = new BoardBean();
		boardBean.setCode(multi.getParameter("item_code"));
		boardBean.setContent(multi.getParameter("qna_content"));
		boardBean.setSubject(multi.getParameter("qna_subject"));
		boardBean.setImg_path(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		boardBean.setDate(date);
		
		
		BoardService boardService = new BoardService();
		boolean isWriteSuccess = boardService.writeArticle1(id, boardBean);
		


		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("location.href='itemView.im';");
			out.println("</script>");
		}

		return forward;
	}

}
