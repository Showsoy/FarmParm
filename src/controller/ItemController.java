package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin.action.ItemCodeGenAction;
import admin.action.ItemDeleteAction;
import admin.action.ItemEnterFormAction;
import admin.action.ItemEnterProAction;
import admin.action.ItemHideAction;
import admin.action.ItemListAction;
import admin.action.ItemModFormAction;
import admin.action.ItemModProAction;
import admin.action.ItemNewAction;
import admin.action.ItemSearchAction;
import admin.action.ItemUnhideAction;
import admin.action.ItemViewAction;
import item.action.BestItemListAction;
import item.action.CartAddAction;
import item.action.CartChangeQtyAction;
import item.action.CartListAction;
import item.action.CartRemoveAction;
import item.action.MainItemListAction;
import item.action.NewItemListAction;
import item.action.UserItemListAction;
import item.action.UserItemViewAction;
import vo.ActionForward;

/**
 * Servlet implementation class ItemsController
 */
@WebServlet("*.im")
public class ItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemController() {
        super();
        // TODO Auto-generated constructor stub
    }
protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	
    	request.setCharacterEncoding("UTF-8");
    	String RequestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command = RequestURI.substring(contextPath.length());
    	String[] commands;
		commands = command.split("/");
		command = "/"+commands[commands.length-1];
    	
    	ActionForward forward = null;
    	Action action = null;
    	
    	if(command.equals("/itemRegistForm.im")) {
    		forward = new ActionForward();
    		forward.setPath("/admin/itemNew.jsp");
    	}else if(command.equals("/itemRegistPro.im")) {
    		action = new ItemNewAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/itemList.im")) {
    		action = new ItemListAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/itemView.im")) {
    		action = new ItemViewAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}
    	else if(command.equals("/itemEnterForm.im")) {
    		action = new ItemEnterFormAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}
    	else if(command.equals("/itemEnterPro.im")) {
    		action = new ItemEnterProAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/itemModForm.im")) {
    		action = new ItemModFormAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/itemModPro.im")) {
    		action = new ItemModProAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/itemSearch.im")) {
    		action = new ItemSearchAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/itemCodeGen.im")) {
    		action = new ItemCodeGenAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/itemDelete.im")) {
    		action = new ItemDeleteAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/itemHide.im")) {
    		action = new ItemHideAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/itemUnhide.im")) {
    		action = new ItemUnhideAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/uitemList.im")) {
    		action = new UserItemListAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/uitemView.im")) {
    		action = new UserItemViewAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/main.im")) {
    		action = new MainItemListAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/bestlist.im")) {
    		action = new BestItemListAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/newlist.im")) {
    		action = new NewItemListAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/cartList.im")) {
    		action = new CartListAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/changeCart.im")) {
    		action = new CartChangeQtyAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/removeCart.im")) {
    		action = new CartRemoveAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/addCart.im")) {
    		action = new CartAddAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}
    	
    	if(forward!=null) {
    		if(forward.isRedirect()) {
    			response.sendRedirect(forward.getPath());
    		}else {
    			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
    			dispatcher.forward(request, response);
    		}
    	}
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
