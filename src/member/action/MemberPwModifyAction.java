package member.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;
import vo.Util;

public class MemberPwModifyAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		 	throws Exception{
		
		HttpSession session = request.getSession();
		ActionForward forward = null;
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
			String salt = userService.salt(user_id);
			String old_pswd = Util.getPassword(request.getParameter("old_pswd"), salt);
			String new_pswd = Util.getPassword(request.getParameter("userPass"), salt);
			boolean pwflag = userService.isPasswdValid(user_id, old_pswd);
			
			if (pwflag) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				boolean modifyResult = userService.modifyPw(user_id, new_pswd);
				if(modifyResult) {
					out.println("<script>");
					out.println("alert('비밀번호가 변경되었습니다.');");
					out.println("location.href='/FarmParm/mymod.us';");
					out.println("</script>");
				}else {
					out.println("<script>");
					out.println("alert('변경실패 문의요망');");
					out.println("location.href='/FarmParm/mymod.us';");
					out.println("</script>");
				}
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('현재 비밀번호가 일치하지 않습니다.');");
				out.println("history.back();");
				out.println("</script>");
				forward = new ActionForward();
			}
		}
		return forward;
	}

}
