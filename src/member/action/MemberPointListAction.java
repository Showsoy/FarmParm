package member.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.UserService;
import vo.ActionForward;
import vo.PageInfo;
import vo.PointBean;

public class MemberPointListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		if(id==null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='./member/memberLogin.us?turn=ok';");
			out.println("</script>");
		}else {
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			int page = request.getParameter("page")==null ? 1 : Integer.parseInt(request.getParameter("page"));
			int limit = 10;
			int limitPage = 10;
			int listCount = 10;
			
			UserService userService = new UserService();
			ArrayList<PointBean> pointList = new ArrayList<PointBean>();

			if(start==null&&request.getParameter("sYear")==null) {
				String period = request.getParameter("period");
				SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
				Calendar cal = Calendar.getInstance();
				Date date = cal.getTime();
				end = DATE_FORMAT.format(date);
				if(period==null||period.equals("3")) cal.add(Calendar.MONTH,-3);
				else if(period.equals("1")) cal.add(Calendar.MONTH,-1);
				else if(period.equals("6")) cal.add(Calendar.MONTH,-6);
				
				date = cal.getTime(); 
		        start = DATE_FORMAT.format(date);
			}else if(start==null&&request.getParameter("sYear")!=null) {
				start = request.getParameter("sYear")+"-"+request.getParameter("sMonth")+"-"+request.getParameter("sDay");
				end = request.getParameter("eYear")+"-"+request.getParameter("eMonth")+"-"+request.getParameter("eDay");
			}
			listCount = userService.myPointListCount(id, start, end);
			pointList = userService.myPointList(id, start, end, page);
			int maxPage = (int)((double)listCount/limit+0.95); 
			int startPage = (((int)((double)page/limitPage+0.9))-1) *limitPage +1;
			int endPage = startPage+limitPage-1;
			
			if(endPage>maxPage) endPage = maxPage;
			PageInfo pageInfo = new PageInfo();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);

			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("pointList", pointList);
			request.setAttribute("start", start);
			request.setAttribute("end", end);
			request.setAttribute("page", page);
			forward= new ActionForward("./member/myPoint.jsp",false);
		}
		return forward;
	}

}
