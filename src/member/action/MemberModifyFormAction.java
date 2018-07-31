package member.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;
import vo.UserBean;

public class MemberModifyFormAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		 	throws Exception{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		UserService userService = new UserService();
		
		String email = userService.email(id);
		String emails[] = new String[2];
		emails = email.split("@");
		
		ActionForward forward = null;

		if(id==null){
   			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.us");
   		}else{
	   		forward = new ActionForward();
	   		UserBean user = userService.myModForm(id);
	   		request.setAttribute("user", user);
	   		request.setAttribute("email1", emails[0]);
	   		request.setAttribute("email2", emails[1]);
	   		//forward.setRedirect(false);
	   		forward.setPath("./member/mymod.jsp");
	   		}
		 
		return forward;
	}


}
