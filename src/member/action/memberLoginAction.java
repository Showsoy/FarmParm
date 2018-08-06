package member.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;
import vo.UserBean;
import vo.Util;

public class MemberLoginAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		
		HttpSession session=request.getSession();
		UserBean users = new UserBean();
		String id = request.getParameter("userID");
		String turn = request.getParameter("turn");

		UserService userService = new UserService();

		String salt = userService.salt(id);
		String passwd = Util.getPassword(request.getParameter("userPass"),salt);
		
		users.setUser_id(request.getParameter("userID"));
		users.setPasswd(passwd);
		
		boolean loginResult = userService.login(users);
   		ActionForward forward = null;
   		if(loginResult){
   			session.setAttribute("id", users.getUser_id());
   			if(turn!=null&&turn.equals("ok")) {
   				response.setContentType("text/html;charset=utf-8");
   		   		PrintWriter out=response.getWriter();
   		   		out.println("<script>");
   		   		out.println("history.go(-2);");
   		   		out.println("</script>");
   			}
   			else {
		   	    forward = new ActionForward();
		   		forward.setRedirect(true);
		   		forward.setPath("../common/main.im");
   			}
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
	
