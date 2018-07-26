package member.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;
import vo.UserBean;

public class memberLoginAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		
		HttpSession session=request.getSession();
		UserBean users = new UserBean();
		
		users.setUser_id(request.getParameter("userID"));
		users.setPasswd(request.getParameter("userPass"));
		
		UserService userService = new UserService();
   		boolean loginResult = userService.login(users);
   		ActionForward forward = null;
   		if(loginResult){
   	    forward = new ActionForward();
   		session.setAttribute("id", users.getUser_id());
   		forward.setRedirect(true);
   		forward.setPath("../common/main.jsp");
   		}
   		else{
   			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('로그인 실패');");
	   		out.println("location.href='../member/login.jsp';");
	   		out.println("</script>");
   		}
   		return forward;
	}
		
}
	
