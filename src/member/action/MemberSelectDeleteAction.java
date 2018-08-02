package member.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;

public class MemberSelectDeleteAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		ActionForward forward = null;
		
		if(id==null){
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("memberLogin.me");
		}else if(!id.equals("admin")){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('관리자가 아닙니다.');");
			out.println("location.href='memberLogin.me';");
			out.println("</script>");
		}
		else{
			String uid[] = request.getParameterValues("ckb");
					
			for(int i=0;i<uid.length;i++) {
				
				UserService userService = new UserService();
				boolean deleteResult = userService.deleteMember(uid[i]);

				if(deleteResult){
					forward = new ActionForward();
					forward.setRedirect(true);
					forward.setPath("./memberList.us");
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out=response.getWriter();
					out.println("<script>");
					out.println("alert('삭제되었습니다.');");
					out.println("location.href='./memberList.us';");
					out.println("</script>");
				}
				else{
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out=response.getWriter();
					out.println("<script>");
					out.println("alert('회원정보삭제 실패.');");
					out.println("location.href='./memberList.us';");
					out.println("</script>");
				}
			}

		}
		return forward;
	}

}