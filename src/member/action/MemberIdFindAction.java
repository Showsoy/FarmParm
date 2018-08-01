package member.action;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import svc.UserService;
import vo.ActionForward;
import vo.Util;

public class MemberIdFindAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		 	throws Exception{
		UserService userService = new UserService();
		ActionForward forward = null;
		Util util = new Util();
		
		String user_name = request.getParameter("userName");
		Date birth = util.transformDate(request.getParameter("userAge"));
		
		String user_id = userService.findId(user_name,birth);
		
		if(user_id != null){
	   		forward = new ActionForward();
	   		request.setAttribute("user_id", user_id);
	   		forward.setPath("/member/idFindResult.jsp");
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
