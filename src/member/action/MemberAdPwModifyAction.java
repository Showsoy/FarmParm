package member.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;
import vo.Util;

public class MemberAdPwModifyAction implements Action{
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
			UserService userService = new UserService();
			String uid = request.getParameter("uid");
			
			boolean pwflag = userService.isPasswdValid(id, request.getParameter("ad_pswd"));
	
			if(pwflag){
				String newSalt = Util.getSalt();
				boolean modifyResult = userService.modifyPw(uid, request.getParameter("userPass"), newSalt);
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				if(modifyResult){
					String path = "/FarmParm/userView.us?page="+request.getParameter("page")+"&user_id="+uid+"&std="+request.getParameter("std")+"&keyword="+request.getParameter("keyword");
					out.println("<script>");
					out.println("alert('비밀번호가 변경되었습니다.');");
					out.println("location.href='"+path+"';");
					out.println("</script>");
				 }else{
					out.println("<script>");
					out.println("alert('변경실패 문의요망');");
					out.println("history.back();");
					out.println("</script>");
				 }
			}else{
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('관리자 비밀번호가 일치하지 않습니다.');");
				out.println("history.back();");
				out.println("</script>");
			}
		}
		return forward;
	}
}
