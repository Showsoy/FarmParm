package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;

public class MemberMyIdDeleteAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		ActionForward forward = null;
		
		if(id==null){
			forward = new ActionForward();
			//forward.setRedirect(true);
			forward.setPath("memberLogin.us");
		}else{
			UserService userService = new UserService();
			boolean deleteResult = userService.deleteMember(id);

			if(deleteResult){			
				forward = new ActionForward();
				forward.setRedirect(true);
				session.removeAttribute("id");
				forward.setPath("./main.im");
			}
			else{
				forward = new ActionForward();
				forward.setPath("./memberMod.us");
			}
		}
		return forward;
	}

}
