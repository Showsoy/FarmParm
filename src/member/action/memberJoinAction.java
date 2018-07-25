package member.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;
import vo.UserBean;

public class memberJoinAction  implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		
		UserBean users = new UserBean();
   		boolean joinResult=false;
   		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
   		Date birth = (Date) sdf.parse(request.getParameter("userBirth"));*/
   		
   		Date birth = Date.valueOf(request.getParameter("userBirth"));
   		String address = request.getParameter("userAddr2") + request.getParameter("userAddr3");
   		users.setUser_id(request.getParameter("userID"));
   		users.setPasswd(request.getParameter("userPass"));
   		users.setName(request.getParameter("userName"));
   		users.setPhone(request.getParameter("userPhone"));
   		users.setBirth(birth);
   		users.setGender(request.getParameter("userGen"));
   		users.setPostcode(request.getParameter("userAddr1"));
   		users.setAddress(address);
   		users.setEmail(request.getParameter("userEmailId"));
   		users.setGrade("일반");
   		
   		UserService userService = new UserService();
   		joinResult = userService.joinUser(users);
   		
   		ActionForward forward = null;
   		if(joinResult==false){
   			response.setContentType("text/html;charset=UTF-8");
   			PrintWriter out = response.getWriter();
   			out.println("<script>");
   			out.println("alert('회원등록실패')");
   			out.println("history.back()");
   			out.println("</script>");
	   	}
   		else{
   	    forward = new ActionForward();
   		forward.setRedirect(true);
   		forward.setPath("../common/main.jsp");
   		}
   		return forward;
}
		
	}
