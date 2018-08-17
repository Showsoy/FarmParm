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
		UserService userService = new UserService();
		
		String user_id = (String)session.getAttribute("id");
		String salt = userService.salt(user_id); //소금값 가져옴
		String pass = userService.passwd(user_id); //비밀번호 값 가져옴
		
		String old_pswd_2 = Util.getPassword(request.getParameter("old_pswd"), salt);
		
		String new_pswd = request.getParameter("userPass");
		String new_pswd_re = request.getParameter("userPassre");
		String new_pswd_last = Util.getPassword(new_pswd_re, salt);
		
		ActionForward forward = null;

			if(pass.equals(old_pswd_2)&&new_pswd.equals(new_pswd_re)){
			   	boolean modifyResult = userService.modifyPw(user_id, new_pswd_last);
				if(modifyResult){
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('비밀번호가 변경되었습니다.');");
					out.println("location.href='/FarmParm/mymod.us';");
					out.println("</script>");
						/*forward = new ActionForward();
				   		//forward.setRedirect(false);
				   		forward.setPath("./member/mymod.jsp");*/
			   	}else{
			   		response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('비밀번호가 맞지 않습니다.');");
					out.println("history.back();");
					out.println("</script>");
				   	forward = new ActionForward();
						//forward.setRedirect(true);
						//forward.setPath("./member/myPage.jsp");
				}
			}else{
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('새 비밀번호를 다시 확인해주세요.');");
				out.println("history.back();");
				out.println("</script>");
		
			}
		
		return forward;
	}

}
