package member.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;

public class MemberDeleteAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		if(id==null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='./member/memberLogin.us?turn=ok';");
			out.println("</script>");
		}else if(!id.equals("admin")) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다.');");
			out.println("location.href='../main.im';");
			out.println("</script>");
		}else {
			String uid = request.getParameter("uid");
			UserService userService = new UserService();
			boolean deleteResult = userService.deleteMember(uid);

			if (deleteResult) {
				/*
				 * forward = new ActionForward(); forward.setRedirect(true);
				 * forward.setPath("./memberList.us");
				 */
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제되었습니다.');");
				out.println("location.href='./memberList.us';");
				out.println("</script>");
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원정보삭제 실패.');");
				out.println("location.href='./memberList.us';");
				out.println("</script>");
			}
		}
		return forward;
	}

}
