package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.UserService;
import vo.ActionForward;

public class MemberPwCheckAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		 	throws Exception{
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		
		UserService userService = new UserService();
		
   		boolean pwflag = userService.isPasswdValid(user_id, request.getParameter("userPass"));
   		
		ActionForward forward = null;
		
		if(pwflag){
			forward = new ActionForward();
	   		forward.setPath("mymod.us");
   		}else{
   			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 맞지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
	   		forward = new ActionForward();
	   		}
		 
		return forward;
	}

}
