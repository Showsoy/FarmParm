package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.OrderService;
import vo.ActionForward;
import vo.OrderBean;
import vo.OrderViewBean;
import vo.PageInfo;

public class SalesListAction implements Action {

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
			OrderService orderService = new OrderService();
			ArrayList<OrderBean> salesList1 = new ArrayList<OrderBean>();
			ArrayList<OrderViewBean> salesList2 = new ArrayList<OrderViewBean>();
			int o_page = 1;	int i_page = 1;
			int limit = 10;
			int o_limitPage = 10;	int i_limitPage = 10;
			int o_listCount = 10;		int i_listCount = 10;
			
			if(request.getParameter("o_page")!=null) o_page = Integer.parseInt(request.getParameter("o_page"));
			if(request.getParameter("i_page")!=null) i_page = Integer.parseInt(request.getParameter("i_page"));
			String period = request.getParameter("period");
			String orderby = request.getParameter("orderby")==null||request.getParameter("orderby").equals("profit") ? "profit" : "sales";
			
			if(request.getParameter("datesel")==null) {
				if(period==null||period.equals("week")) period="-7 day";
				else if(period.indexOf("month")>0) period = "-"+period.substring(0, 1)+" month";
				else if(period.equals("year")) period="-1 year";
				
				o_listCount = orderService.salesOrderCount1(period);
				salesList1 = orderService.salesOrderList1(period, o_page);
				i_listCount = orderService.salesItemCount1(period);
				salesList2 = orderService.salesItemList1(period, orderby, i_page);
				period = request.getParameter("period")==null ? "week":request.getParameter("period");
			}else {
				String allDate = request.getParameter("orderYear")==null ? 
						request.getParameter("date") : 
						request.getParameter("orderYear")+"-"+request.getParameter("orderMonth")+"-01";
				o_listCount = orderService.salesOrderCount2(allDate);
				salesList1 = orderService.salesOrderList2(allDate, o_page);
				i_listCount = orderService.salesItemCount2(allDate);
				salesList2 = orderService.salesItemList2(allDate, orderby, i_page);
				request.setAttribute("date", allDate);
			}
			int o_maxPage = (int)((double)o_listCount/limit+0.95); 
			int o_startPage = (((int)((double)o_page/o_limitPage+0.9))-1) *o_limitPage +1;
			int o_endPage = o_startPage+o_limitPage-1;
			if(o_endPage>o_maxPage) o_endPage = o_maxPage;
			PageInfo o_pageInfo = new PageInfo();
			o_pageInfo.setEndPage(o_endPage);
			o_pageInfo.setListCount(o_listCount);
			o_pageInfo.setMaxPage(o_maxPage);
			o_pageInfo.setPage(o_page);
			o_pageInfo.setStartPage(o_startPage);
			
			int i_maxPage = (int)((double)i_listCount/limit+0.95); 
			int i_startPage = (((int)((double)i_page/i_limitPage+0.9))-1) *i_limitPage +1;
			int i_endPage = i_startPage+i_limitPage-1;
			if(i_endPage>i_maxPage) i_endPage = i_maxPage;
			PageInfo i_pageInfo = new PageInfo();
			i_pageInfo.setEndPage(i_endPage);
			i_pageInfo.setListCount(i_listCount);
			i_pageInfo.setMaxPage(i_maxPage);
			i_pageInfo.setPage(i_page);
			i_pageInfo.setStartPage(i_startPage);
			
			request.setAttribute("period", period);
			request.setAttribute("orderby", orderby);
			request.setAttribute("o_pageInfo", o_pageInfo);
			request.setAttribute("i_pageInfo", i_pageInfo);
			request.setAttribute("o_page", o_page);
			request.setAttribute("i_page", i_page);
			request.setAttribute("salesList1", salesList1);
			request.setAttribute("salesList2", salesList2);
			forward= new ActionForward("./salesList.jsp",false);
		}
		return forward;
	}

}
