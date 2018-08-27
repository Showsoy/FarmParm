package member.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;

public class MemberMyIdDeleteAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		ActionForward forward = null;
		
		if(id==null){
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("memberLogin.me");
		}
		else{
			UserService userService = new UserService();
			boolean deleteResult = userService.deleteMember(id);

			if(deleteResult){
				forward = new ActionForward();
				session.removeAttribute("id");
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('탈퇴 완료 \n 이용해 주셔서 감사합니다.');");
				out.println("location.href='./main.im';");
				out.println("</script>");
			}
			else{
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('탈퇴 실패.');");
				out.println("history.back();");
				out.println("</script>");
			}
		}
		return forward;
	}

}
