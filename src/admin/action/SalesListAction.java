package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
			int page = 1;
			int limit = 10;
			int limitPage = 10;
			int listCount = 10;
			
			if(request.getParameter("page")!=null) page = Integer.parseInt(request.getParameter("page"));
			String period = request.getParameter("period");
			String orderby = request.getParameter("orderby");
			Map<String, Integer> salesMap = new HashMap<String, Integer>();
			
			if(request.getParameter("datesel")==null) {
				if(period==null||period.equals("week")) period="-7 day";
				else if(period.indexOf("month")>0) period = "-"+period.substring(0, 1)+" month";
				else if(period.equals("year")) period="-1 year";
				if(orderby==null) {
					listCount = orderService.salesOrderCount1(period);
					salesList1 = orderService.salesOrderList1(period, page);
				}else {
					listCount = orderService.salesItemCount1(period);
					salesList2 = orderService.salesItemList1(period, orderby, page);
				}
				salesMap = orderService.calculateProfit(period);
				period = request.getParameter("period")==null ? "week":request.getParameter("period");
			}else {
				String allDate = request.getParameter("orderYear")==null ? 
						request.getParameter("date") : 
						request.getParameter("orderYear")+"-"+request.getParameter("orderMonth")+"-01";
				if(orderby==null) {
					listCount = orderService.salesOrderCount2(allDate);
					salesList1 = orderService.salesOrderList2(allDate, page);
				}else {
					listCount = orderService.salesItemCount2(allDate);
					salesList2 = orderService.salesItemList2(allDate, orderby, page);
				}
				salesMap = orderService.thisMonthSales(allDate);
				request.setAttribute("date", allDate);
			}
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
			
			request.setAttribute("salesMap", salesMap);
			request.setAttribute("period", period);
			request.setAttribute("orderby", orderby);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("page", page);
			request.setAttribute("salesList1", salesList1);
			request.setAttribute("salesList2", salesList2);
			forward= new ActionForward("./salesList.jsp",false);
		}
		return forward;
	}

}
