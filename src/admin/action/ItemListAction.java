package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.ItemService;
import vo.ActionForward;
import vo.ItemViewBean;
import vo.PageInfo;

public class ItemListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
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
			ArrayList<ItemViewBean> itemList = new ArrayList<ItemViewBean>();
			int page = 1;
			int limit = 10;
			int limitPage = 10;
			int listCount = 10;
			
			if(request.getParameter("page")!=null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			String category = request.getParameter("category");
			
			ItemService itemService = new ItemService();
			if(category==null){
				category="all";
				listCount = itemService.itemListCount();
				itemList = itemService.adminItemList(page);
			}else {
				listCount = itemService.itemListCountIn(category);
				itemList = itemService.adminItemListIn(category, page);
			}
			//총 리스트 수
			
			
			//리스트를 받아옴
			//총 페이지 수
			int maxPage = (int)((double)listCount/limit+0.95); 
			//올림 처리
			//현재 페이지를 보여줄 시작 페이지 수
			int startPage = (((int)((double)page/limitPage+0.9))-1) *limitPage +1;
			//현재 페이지에 보여줄 마지막 페이지 수
			int endPage = startPage+limitPage-1;
			
			if(endPage>maxPage) endPage = maxPage;
			//System.out.println(itemList);
			PageInfo pageInfo = new PageInfo();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);
			request.setAttribute("category", category);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("itemList", itemList);
			forward= new ActionForward("/admin/itemList.jsp",false);
		}
		return forward;
	}

}
