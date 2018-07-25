package member.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import vo.ActionForward;
import vo.UserBean;

public class memberPwCheckAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		 	throws Exception{
		HttpSession session = request.getSession();
		String pw = request.getParameter("userPass");
		String opw = (String)session.getAttribute(); //이거 밑에 null임
		ActionForward forward = null;
		
		System.out.println(pw + "이거?");
		System.out.println(opw + "이거는?"); //이거 null 값으로 넘어옴
		
		if(pw==null){
   			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./main.jsp");
   		}else if(pw==opw){
	   		forward = new ActionForward();
	   		forward.setRedirect(false);
	   		forward.setPath("./member/myMod.jsp");
	   		}
		 
		return forward;
	}

}
