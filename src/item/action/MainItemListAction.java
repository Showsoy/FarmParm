package item.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.ItemService;
import vo.ActionForward;
import vo.ItemViewBean;

public class MainItemListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		ItemService itemService = new ItemService();
		ArrayList<ItemViewBean> bestList = itemService.bestItemList();
		ArrayList<ItemViewBean> newList = itemService.newItemList();
		
		request.setAttribute("bestList", bestList);
		request.setAttribute("newList", newList);
		forward= new ActionForward("common/main.jsp",false);
		return forward;
	}

}
