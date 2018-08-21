package item.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ItemService;
import vo.ActionForward;
import vo.ItemBean;
import vo.ItemStockBean;
import vo.PageInfo;

public class ItemViewAction implements action.Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		if(id==null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='../member/memberLogin.us?turn=ok';");
			out.println("</script>");
		}else if(!id.equals("admin")) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다.');");
			out.println("location.href='../main.im';");
			out.println("</script>");
		}else {
			String item_code = request.getParameter("item_code");
			ItemService itemService = new ItemService();
			
			//재고 페이지
			int i_page = 1;
			int i_limit = 10;
			int i_limitPage = 10;
			
			if(request.getParameter("i_page")!=null) {
				i_page = Integer.parseInt(request.getParameter("i_page"));
			}
			
			int listCount = itemService.itemStockCount(item_code);
			int i_maxPage = (int)((double)listCount/i_limit+0.95); 
			int i_startPage = (((int)((double)i_page/i_limitPage+0.9))-1) *i_limitPage +1;
			int i_endPage = i_startPage+i_limitPage-1;
			
			if(i_endPage>i_maxPage) i_endPage = i_maxPage;
			PageInfo i_pageInfo = new PageInfo();
			i_pageInfo.setEndPage(i_endPage);
			i_pageInfo.setListCount(listCount);
			i_pageInfo.setMaxPage(i_maxPage);
			i_pageInfo.setPage(i_page);
			i_pageInfo.setStartPage(i_startPage);
			request.setAttribute("i_pageInfo", i_pageInfo);
			
			forward = new ActionForward();
			ItemBean item = itemService.getItem(item_code);
			ArrayList<ItemStockBean> itemStockList = itemService.getItemStockList(item_code,i_page);
			
			request.setAttribute("item",item);
			request.setAttribute("itemStockList", itemStockList);
			
			String page = request.getParameter("page");
			String stock = request.getParameter("stock");
			request.setAttribute("page", page);
			request.setAttribute("i_page", i_page);
			request.setAttribute("stock", stock);
			forward= new ActionForward();
			forward.setPath("./itemView.jsp?page="+page);
		}
		return forward;
	}

}
