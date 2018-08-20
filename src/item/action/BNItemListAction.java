package item.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.ItemService;
import vo.ActionForward;
import vo.ItemViewBean;

public class BNItemListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		ItemService itemService = new ItemService();
		String type=request.getParameter("type");
		ArrayList<ItemViewBean> itemList = new ArrayList<ItemViewBean>();
		if(type!=null&&type.equals("best")) {
			itemList = itemService.bestItemList(12);
		}else if(type!=null&&type.equals("new")) {
			itemList = itemService.newItemList(12);
		}
		
		Cookie[] cookieArray = request.getCookies();
		Map<String, String> todayImageMap = new HashMap<String, String>();
		int count = 0;
		if (cookieArray != null) {
			for (int i = cookieArray.length - 1; i >= 0; i--) {
				if (count == 5)
					break;
				if (cookieArray[i].getName().startsWith("today")) {
					todayImageMap.put(cookieArray[i].getName().replaceAll("today", ""), cookieArray[i].getValue());
					count++;
				}
			}
		}
		request.setAttribute("todayImageMap", todayImageMap);
				
		request.setAttribute("itemList", itemList);
		request.setAttribute("type", type);
		forward= new ActionForward("./item/bnItem.jsp",false);
		return forward;
	}

}
