package member.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;
import vo.UserBean;

public class MemberMyPageAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		 	throws Exception{
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		if(user_id==null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='./member/memberLogin.us?turn=ok';");
			out.println("</script>");
		}
		else {
			UserService userService = new UserService();
			UserBean user = userService.selectUserInfo(user_id);
			user.setPoint(userService.findRecentPoint(user_id));
			String email = user.getEmail();
			String emails[] = new String[2];
			emails = email.split("@");
			
			forward = new ActionForward();
		
			request.setAttribute("user", user);
			request.setAttribute("email1", emails[0]);
			request.setAttribute("email2", emails[1]);
			// forward.setRedirect(false);
			forward.setPath("/member/myPage.jsp");
		}
		 
		return forward;
	}
	
}
