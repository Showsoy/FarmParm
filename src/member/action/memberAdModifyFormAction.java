package member.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;
import vo.UserBean;

public class memberAdModifyFormAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		 	throws Exception{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String uid = request.getParameter("uid");
		
		ActionForward forward = null;

		if(id==null){
   			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.us");
   		}else{
	   		forward = new ActionForward();
	   		UserService userService = new UserService();
	   		UserBean user = userService.modifyUserForm(uid);
	   		session.setAttribute("user", user);
	   		//forward.setRedirect(false);
	   		forward.setPath("./admin/userMod.jsp");
	   		}
		 
		return forward;
	}

}
