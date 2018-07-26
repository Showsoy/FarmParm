package member.action;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import svc.UserService;
import vo.ActionForward;
import vo.UserBean;

public class memberModifyAction implements Action{
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		UserService userService = new UserService();
		String id = request.getParameter("id");
		Date birth = Date.valueOf(request.getParameter("userBirth"));
		
		UserBean user = new UserBean(
				request.getParameter("userPhone"), 
				birth, 
				request.getParameter("userGen"),
				request.getParameter("userEmailId"),
				request.getParameter("userEmailAd"),
				request.getParameter("userAddr1"),
				request.getParameter("userAddr2"),
				request.getParameter("userAddr3"),
				id
				);
		
		boolean isRegistSuccess = userService.modifyMy(user);
		ActionForward forward = null;
		
		if(isRegistSuccess){
			forward = new ActionForward();
			//forward.setRedirect(true);
			forward.setPath("/myPage.us");
		}else{
			try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패');");
			out.println("history.back();");
			out.println("</script>");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return forward;
	}

}
