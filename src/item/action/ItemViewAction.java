package item.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;

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
			
			int page = request.getParameter("page")==null ? 1 : Integer.parseInt(request.getParameter("page"));
			int i_page = request.getParameter("i_page")==null ? 1 : Integer.parseInt(request.getParameter("i_page"));
			int i_limit = 10;
			int i_limitPage = 10;

			Calendar tmpCal = Calendar.getInstance();
			int iyear = request.getParameter("iyear")==null ? tmpCal.get(Calendar.YEAR) 
					: Integer.parseInt(request.getParameter("iyear"));
			int imonth = request.getParameter("imonth")==null ? tmpCal.get(Calendar.MONTH)+1 
					: Integer.parseInt(request.getParameter("imonth"));

			int listCount = itemService.itemStockCount(item_code, iyear, imonth);
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
			ItemBean item = itemService.getItemWithStock(item_code);
			ArrayList<ItemStockBean> itemStockList = itemService.getItemStockList(item_code, iyear, imonth, i_page);
			
			request.setAttribute("item",item);
			request.setAttribute("itemStockList", itemStockList);
			request.setAttribute("page", page);
			request.setAttribute("imonth", imonth);
			request.setAttribute("iyear", iyear);
			request.setAttribute("i_page", i_page);
			forward= new ActionForward();
			forward.setPath("./itemView.jsp");
		}
		return forward;
	}

}
