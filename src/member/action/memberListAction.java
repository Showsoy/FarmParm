package member.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.Action;
import svc.UserService;
import vo.ActionForward;
import vo.PageInfo;
import vo.UserViewBean;

public class MemberListAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		 	throws Exception{
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
		}else if(!id.equals("admin")) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다.');");
			out.println("location.href='../main.im';");
			out.println("</script>");
		}else {
		   		
		   		ArrayList<UserViewBean> userList = new ArrayList<UserViewBean>();
		   		UserService userService = new UserService();
			  	int page=1;
				int limit=10;
				int listCount = 0;
				String keyword = "";
				
				if(request.getParameter("page")!=null){
					page=Integer.parseInt(request.getParameter("page"));
				}
				if(request.getParameter("std")!=null) {
					keyword = request.getParameter("std");
					if(keyword.equals("grade")) {
						keyword = request.getParameter("grade");
						listCount = userService.gradeListCount(keyword);
						userList = userService.getGradeList(page, keyword);
					}else if(keyword.equals("purchase")){
						keyword="구매금액";
						listCount = userService.getListCount();
						userList = userService.getPurchList(page);
					}
				}else {
					if(request.getParameter("search")!=null) {
						keyword = request.getParameter("search");
						listCount = userService.getSearchList(keyword);
						userList = userService.searchId(page, keyword);
					}else {
						keyword="all";
						listCount = userService.getListCount();
						userList = userService.userList(page);
					}
				}
				
				int maxPage=(int)((double)listCount/limit+0.95); //0.95를 더해서 올림 처리.
		   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
		   		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		   	    int endPage = startPage+10-1;
		   	    
		   	 if (endPage> maxPage) endPage= maxPage;

		   		PageInfo pageInfo = new PageInfo();
		   		pageInfo.setEndPage(endPage);
		   		pageInfo.setListCount(listCount);
				pageInfo.setMaxPage(maxPage);
				pageInfo.setPage(page);
				pageInfo.setStartPage(startPage);	
				request.setAttribute("category", keyword);
				request.setAttribute("pageInfo", pageInfo);
				request.setAttribute("userList", userList);
				forward = new ActionForward();
				forward.setPath("/admin/userList.jsp");
		}
		return forward;
		   		
			 }
		   	   /* forward = new ActionForward();
		   	    UserService userService = new UserService();
		   		ArrayList<UserViewBean> userList = userService.userList();
		   		session.setAttribute("userList", userList);
		   		forward.setPath("/admin/userList.jsp");

		   		return forward;*/
		}

