package member.action;

import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;
import vo.UserBean;

public class memberMyModifyAction implements Action{
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		UserService userService = new UserService();
		
		String id = (String)session.getAttribute("id");
		Date birth = Date.valueOf(request.getParameter("userBirth"));
		
			UserBean user = new UserBean(
					request.getParameter("userPhone"), 
					birth, 
					request.getParameter("userGen"),
					request.getParameter("userAddr1"),
					request.getParameter("userAddr2"),
					request.getParameter("userAddr3"),
					request.getParameter("userEmailId"),
					request.getParameter("userEmailAd"),
					id
					);
			
			ActionForward forward = null;
			boolean isRegistSuccess = userService.modifyMy(user);
				
			if(isRegistSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정되었습니다.');");
				/*out.println("document.id.action='/FarmParm/member/myPage.jsp';");
				out.println("document.id.submit();");*/
				out.println("location.href='./myPage.us';");
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
	
