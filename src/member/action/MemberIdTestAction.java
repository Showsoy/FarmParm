package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.UserService;
import vo.ActionForward;

public class MemberIdTestAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		UserService userService = new UserService();
		String id = request.getParameter("id");
		boolean result = userService.userIdTest(id);
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		ActionForward forward = new ActionForward("/member/dulpTest.jsp",false);
		return forward;
	}

}
