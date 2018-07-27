package member.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;
import vo.UserViewBean;

public class memberListAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		 	throws Exception{
			 	HttpSession session=request.getSession();
		   		ActionForward forward = null;
		   		
		   	    forward = new ActionForward();
		   	    UserService userService = new UserService();
		   		ArrayList<UserViewBean> userList = userService.userList();
		   		session.setAttribute("userList", userList);
		   		forward.setPath("/admin/userList.jsp");

		   		return forward;
		}

}
