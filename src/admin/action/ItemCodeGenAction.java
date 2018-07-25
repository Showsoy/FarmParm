package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.ItemService;
import vo.ActionForward;

public class ItemCodeGenAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		String category = request.getParameter("category");
		String item_code = null;
		ItemService itemService = new ItemService();
		item_code = itemService.makeItemCode(category);
		request.setAttribute("item_code", item_code);
		System.out.println(item_code);
		
		forward= new ActionForward("./codeGen.jsp",true);
		
		return forward;
	}

}
