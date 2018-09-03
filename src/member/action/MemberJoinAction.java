package member.action;

import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import svc.UserService;
import vo.ActionForward;
import vo.PointBean;
import vo.UserBean;
import vo.Util;

public class MemberJoinAction  implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws Exception{
   		boolean joinResult=false;
   		Util util = new Util();
		Date birth = util.transformDate(request.getParameter("userBirth"));
		String salt = Util.getSalt();
		String passwd = Util.getPassword(request.getParameter("userPass"), salt);
		String email = request.getParameter("userEmailId") +"@"+ request.getParameter("userEmailAd");//null이면 email1
   		
		UserBean user = new UserBean(request.getParameter("userID"), passwd, request.getParameter("userName"), request.getParameter("userPhone"),
				birth, request.getParameter("userGen"), request.getParameter("userAddr1"), request.getParameter("userAddr2"),
				request.getParameter("userAddr3"), email, "일반회원", null, salt, 1000);
   		 
   		UserService userService = new UserService();
   		joinResult = userService.joinUser(user);
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
   			PointBean point = new PointBean(request.getParameter("userID"), 0, "가입감사", 1, user.getPoint());
   			int insertCount = userService.userPlminusPoint(point);
   			if(insertCount>0) {
   				forward = new ActionForward();
   				forward.setRedirect(true);
   				forward.setPath("../member/memberLogin.us?type=join");
   			}else {
   				response.setContentType("text/html;charset=UTF-8");
   	   			PrintWriter out = response.getWriter();
   	   			out.println("<script>");
   	   			out.println("alert('가입감사 포인트 오류/n고객센터 문의 요망')");
   	   			out.println("history.back()");
   	   			out.println("</script>");
   			}
   		}
   		return forward;
	}
		
}
