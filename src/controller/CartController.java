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
import item.action.CartAddAction;
import item.action.CartChangeQtyAction;
import item.action.CartListAction;
import item.action.CartRemoveAction;
import item.action.UserItemListAction;
import item.action.UserItemViewAction;
import vo.ActionForward;

/**
 * Servlet implementation class CartController
 */
@WebServlet("*.ct")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartController() {
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
    	
    	if(command.equals("/cartList.ct")) {
    		action = new CartListAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/changeCart.ct")) {
    		action = new CartChangeQtyAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/removeCart.ct")) {
    		action = new CartRemoveAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/addCart.ct")) {
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
