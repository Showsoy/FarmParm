//package member.action;
//
//import java.io.PrintWriter;
//import java.util.ArrayList;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import action.Action;
//import svc.UserService;
//import vo.ActionForward;
//import vo.PageInfo;
//import vo.UserViewBean;
//
//public class MemberSearchAction implements Action{
//	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
//		 	throws Exception{
//				request.setCharacterEncoding("utf-8");
//			 	HttpSession session=request.getSession();
//		   		ActionForward forward = null;
//		   		UserService userService = new UserService();
//		   		
//		   		ArrayList<UserViewBean> articleList = new ArrayList<UserViewBean>();
//			  	int page=1;
//				int limit=5;
//				
//				String search_list = request.getParameter("searchList");
//				String search_value = request.getParameter("searchValue");
//				
//				if(search_list.equals("op_id")) {
//					articleList = userService.searchId(page, limit, search_value);
//					int listCount = userService.getSearchList(search_value);
//					int maxPage=(int)((double)listCount/limit+0.95); //0.95를 더해서 올림 처리.
//			   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
//			   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
//			   		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
//			   	    int endPage = startPage+10-1;
//			   	 if (endPage> maxPage) endPage= maxPage;
//
//			   		PageInfo pageInfo = new PageInfo();
//			   		pageInfo.setEndPage(endPage);
//			   		pageInfo.setListCount(listCount);
//					pageInfo.setMaxPage(maxPage);
//					pageInfo.setPage(page);
//					pageInfo.setStartPage(startPage);	
//					request.setAttribute("pageInfo", pageInfo);
//					request.setAttribute("articleList", articleList);
//					forward = new ActionForward();
//					forward.setPath("/admin/userList.jsp");
//	    
//					
//				}else {
//					articleList = userService.searchGrade(page, limit, search_value);
//					int listCount = userService.getSearchList_2(search_value);
//					int maxPage=(int)((double)listCount/limit+0.95); //0.95를 더해서 올림 처리.
//			   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
//			   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
//			   		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
//			   	    int endPage = startPage+10-1;
//			   	    
//			   	 if (endPage> maxPage) endPage= maxPage;
//
//			   		PageInfo pageInfo = new PageInfo();
//			   		pageInfo.setEndPage(endPage);
//			   		pageInfo.setListCount(listCount);
//					pageInfo.setMaxPage(maxPage);
//					pageInfo.setPage(page);
//					pageInfo.setStartPage(startPage);	
//					request.setAttribute("pageInfo", pageInfo);
//					request.setAttribute("articleList", articleList);
//					forward = new ActionForward();
//					forward.setPath("/admin/userList.jsp");
//				}
//				
//				if(request.getParameter("page")!=null){
//					page=Integer.parseInt(request.getParameter("page"));
//				}
// 
//				return forward;
//		   		
//			 }
//
//		}
//
