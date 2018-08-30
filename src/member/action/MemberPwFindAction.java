package member.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;

public class MemberPwFindAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		 	throws Exception{
		
		HttpSession session = request.getSession();
		UserService userService = new UserService();
		ActionForward forward = null;
		
		String user_id = request.getParameter("userID");
		String email1 = request.getParameter("userEmailId");
		String email2 = request.getParameter("userEmailAd");
		String email = email1+"@"+email2;
		
		String email_q = userService.findPw(user_id);
		
		if(email.equals(email_q)){
	   		forward = new ActionForward();
	   		session.setAttribute("user_id_forPw", user_id);
	   		forward.setPath("/member/pwFindResult.jsp");
   		}else{
   			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('입력하신 회원이 존재하지 않습니다. 다시 확인 해주세요.');");
	   		out.println("history.back();");
	   		out.println("</script>");
	   	}
		 
		return forward;
	}

}
