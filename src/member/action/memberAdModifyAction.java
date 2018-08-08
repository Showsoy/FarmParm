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
import vo.UserViewBean;
import vo.Util;

public class MemberAdModifyAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		if (id == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='../member/memberLogin.us?turn=ok';");
			out.println("</script>");
		} else if (!id.equals("admin")) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다.');");
			out.println("location.href='../common/main.im';");
			out.println("</script>");
		} else {
			UserService userService = new UserService();

			String uid = request.getParameter("uid");
			Util util = new Util();
			Date birth = util.transformDate(request.getParameter("userBirth"));

			String email = (request.getParameter("userEmailId") + "@" + request.getParameter("userEmailAd"));

			UserBean user = new UserBean(id, "", request.getParameter("userName"), request.getParameter("userPhone"),
					birth, request.getParameter("userGen"), request.getParameter("userAddr1"),
					request.getParameter("userAddr2"), request.getParameter("userAddr3"), email,
					request.getParameter("userGrade"), "", 0);
			boolean isRegistSuccess = userService.modifyUsers(user);

			if (isRegistSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정되었습니다.');");
				/*
				 * out.println("document.id.action='/FarmParm/member/myPage.jsp';");
				 * out.println("document.id.submit();");
				 */
				out.println("location.href='./memberList.us';");
				out.println("</script>");

				/*
				 * forward = new ActionForward(); forward.setRedirect(false);
				 * forward.setPath("/myPage.us?id="+id);
				 */
			} else {
				try {

					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('수정실패');");
					out.println("history.back();");
					out.println("</script>");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return forward;
	}

}
