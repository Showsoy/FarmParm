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
		UserBean users = new UserBean();
   		boolean joinResult=false;
   		Util util = new Util();
		Date birth = util.transformDate(request.getParameter("userBirth"));
		String salt = Util.getSalt();
		String passwd = Util.getPassword(request.getParameter("userPass"), salt);
		String email = request.getParameter("userEmailId") +"@"+ request.getParameter("userEmailAd");
   		
   		users.setUser_id(request.getParameter("userID"));
   		users.setPasswd(passwd);
   		users.setName(request.getParameter("userName"));
   		users.setPhone(request.getParameter("userPhone"));
   		users.setBirth(birth);
   		users.setGender(request.getParameter("userGen"));
   		users.setPostcode(request.getParameter("userAddr1"));
   		users.setAddress(request.getParameter("userAddr2"));
   		users.setAddress_second(request.getParameter("userAddr3"));
   		users.setEmail(email);
   		users.setGrade("일반회원");
   		users.setUsalt(salt);
   		
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
   			PointBean point = new PointBean(request.getParameter("userID"), 0, "리뷰작성", 1, 500);
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
