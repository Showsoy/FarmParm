package member.action;

import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;
import vo.UserViewBean;
import vo.Util;

public class MemberAdModifyAction implements Action{
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		//HttpSession session = request.getSession();
		UserService userService = new UserService();
		
		String uid = request.getParameter("uid");
		Util util = new Util();
		Date birth = util.transformDate(request.getParameter("userBirth"));
		String email = (request.getParameter("userEmailId") +"@"+ request.getParameter("userEmailAd"));
		
		UserViewBean user = new UserViewBean(
					request.getParameter("userName"),
					request.getParameter("userGrade"),
					request.getParameter("userPhone"),
					birth,
					request.getParameter("userGen"),
					email,
					request.getParameter("userAddr1"),
					request.getParameter("userAddr2"),
					request.getParameter("userAddr3"),
					uid
					);

			ActionForward forward = null;
			boolean isRegistSuccess = userService.modifyUsers(user);
				
			if(isRegistSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정되었습니다.');");
				/*out.println("document.id.action='/FarmParm/member/myPage.jsp';");
				out.println("document.id.submit();");*/
				out.println("location.href='./memberList.us';");
				out.println("</script>");
				
				/*forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/myPage.us?id="+id);*/
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
