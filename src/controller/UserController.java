package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import member.action.memberLoginAction;
import member.action.memberLogoutAction;
import member.action.memberMyModifyAction;
import member.action.memberMyPageAction;
import member.action.memberPwCheckAction;
import member.action.memberPwModifyAction;
import member.action.memberAdModifyAction;
import member.action.memberAdModifyFormAction;
import member.action.memberJoinAction;
import member.action.memberListAction;
import vo.ActionForward;

/**
 * Servlet implementation class UsersController
 */
@WebServlet("*.us")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	
    	request.setCharacterEncoding("UTF-8");
    	String RequestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command = RequestURI.substring(contextPath.length());
    	ActionForward forward = null;
    	Action action = null;
    	
    	System.out.println(command);
    	
    	if(command.equals("/memberLogin.us")){
			forward=new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./member/login.jsp");
		}else if(command.equals("/member/memberLoginAction.us")){
			action = new memberLoginAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/memberJoinForm.us")) {
    		forward=new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./member/joinForm.jsp");
    	}else if(command.equals("/member/memberJoinAction.us")) {
    		action = new memberJoinAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/member/dulpTest.us")) {
    		forward=new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./dulpTest.jsp?openInit=true");
    	}else if(command.equals("/mypage.us")) {
    		action = new memberMyPageAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/pwCheckForm.us")) {
    		forward=new ActionForward();
			//forward.setRedirect(true);
			forward.setPath("./member/pwCheck.jsp");
    	}else if(command.equals("/pwCheck.us")) {
    		action = new memberPwCheckAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/memberLogout.us")) {
    		action = new memberLogoutAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/myPage.us")) {
    		action = new memberMyPageAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/memberMod.us")) {
    		action = new memberMyModifyAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/pwModify.us")) {
    		action = new memberPwModifyAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/adminPage.us")) {
    		forward=new ActionForward();
			//forward.setRedirect(true);
			forward.setPath("./admin/adminPage.jsp");
    	}else if(command.equals("/memberList.us")) {
    		action = new memberListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/memberModAdForm.us")) {
    		action = new memberAdModifyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/memberModAd.us")) {
    		action = new memberAdModifyAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
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
		doProcess(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request,response);
	}

}
