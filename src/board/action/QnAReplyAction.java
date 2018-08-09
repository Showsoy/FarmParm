package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.BoardService;
import vo.ActionForward;
import vo.BoardBean;

public class QnAReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	 	ActionForward forward = null;
	    String nowPage = request.getParameter("page");
	    String item_code = request.getParameter("item_code");
	    String bnum = request.getParameter("re_bnum");
    
	 	BoardBean article = new BoardBean();  		
	 	article.setBoard_num(Integer.parseInt(bnum));
	 	article.setSubject(request.getParameter("qna_subject"));
	 	article.setContent(request.getParameter("qna_content"));
	 	article.setCode(item_code);
	 	article.setRgroup(Integer.parseInt(bnum));
	 	article.setRstep(1);	   		
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
