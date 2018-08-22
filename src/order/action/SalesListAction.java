package order.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.ItemService;
import svc.OrderService;
import vo.ActionForward;
import vo.ItemViewBean;
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
			int page = request.getParameter("page")==null ? 1 : Integer.parseInt(request.getParameter("page"));
			int limit = 10;
			int limitPage = 10;
			int listCount = 10;
			
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			String orderby = request.getParameter("orderby");
			
			Map<String, Integer> salesMap = new HashMap<String, Integer>();
			
			if(start!=null){
				if(orderby==null) {
					listCount = orderService.salesOrderCount1(start, end);
					salesList1 = orderService.salesOrderList1(start, end, page);
				}else {
					listCount = orderService.salesItemCount1(start, end);
					salesList2 = orderService.salesItemList1(start, end, orderby, page);
				}
			}else if(request.getParameter("sYear")==null) {
				String period = request.getParameter("period");
				SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
				Calendar cal = Calendar.getInstance();
				Date date = cal.getTime();
				end = DATE_FORMAT.format(date);
				if(period==null||period.equals("week")) cal.add(Calendar.DATE,-7);
				else if(period.equals("2week")) cal.add(Calendar.DATE,-14);
				else if(period.equals("month")) cal.add(Calendar.MONTH,-1);
				
				date = cal.getTime(); 
		        start = DATE_FORMAT.format(date);
		        if(orderby==null) {
					listCount = orderService.salesOrderCount1(start, end);
					salesList1 = orderService.salesOrderList1(start, end, page);
				}else {
					listCount = orderService.salesItemCount1(start, end);
					salesList2 = orderService.salesItemList1(start, end, orderby, page);
				}
			}else {
				start = request.getParameter("sYear")+"-"+request.getParameter("sMonth")+"-"+request.getParameter("sDay");
				end = request.getParameter("eYear")+"-"+request.getParameter("eMonth")+"-"+request.getParameter("eDay");
				if(orderby==null) {
					listCount = orderService.salesOrderCount1(start, end);
					salesList1 = orderService.salesOrderList1(start, end, page);
				}else {
					listCount = orderService.salesItemCount1(start, end);
					salesList2 = orderService.salesItemList1(start, end, orderby, page);
				}
			}
			System.out.println(start+","+end);
			if(request.getParameter("monthsel")==null) {
				salesMap = orderService.calculateProfit(start, end);
			}else {
				salesMap = orderService.thisMonthSales(start, end);
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
			request.setAttribute("start", start);
			request.setAttribute("end", end);
			request.setAttribute("orderby", orderby);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("page", page);
			request.setAttribute("salesList1", salesList1);//하나만
			request.setAttribute("salesList2", salesList2);
			forward= new ActionForward("./salesList.jsp",false);
		}
		return forward;
	}

}
