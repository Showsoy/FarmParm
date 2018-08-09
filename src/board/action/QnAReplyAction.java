package board.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.BoardService;
import vo.ActionForward;
import vo.BoardBean;

public class QnAReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	 	ActionForward forward = null;
	 	request.setCharacterEncoding("UTF-8");
	    String nowPage = request.getParameter("page");
	    String item_code = request.getParameter("item_code");
	    String bnum = request.getParameter("re_bnum");
	    
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
    
	 	BoardBean article = new BoardBean();  		
	 	article.setBoard_num(Integer.parseInt(bnum));
	 	article.setSubject(multi.getParameter("qna_subject"));
	 	article.setContent(multi.getParameter("qna_content"));
	 	article.setCode(item_code);
	 	article.setRgroup(Integer.parseInt(bnum));
	 	article.setRstep(1);	   		
	 	
	 	System.out.println(request.getParameter("qna_content")+"/내용  "+
	 		request.getParameter("qna_subject")+"/제목 "	);
	 	
	 	BoardService boardService = new BoardService();
	 	
	 	boolean isReplySuccess = boardService.replyArticle("qna_board", article);
	 	
	 	System.out.println(isReplySuccess + " :안되나요");
	 	
   		if(isReplySuccess){
   			forward = new ActionForward();
   			forward.setRedirect(true);
   			forward.setPath("uitemView.im?page="+nowPage);
   		}
   		else{
   			response.setContentType("text/html;charset=UTF-8");
   			PrintWriter out = response.getWriter();
   			out.println("<script>");
   			out.println("alert('실패했습니다')");
   			out.println("history.back()");
   			out.println("</script>");
   		}
   		
   		return forward;
	}

}
