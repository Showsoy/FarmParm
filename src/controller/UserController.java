package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import member.action.MemberAdModifyAction;
import member.action.MemberAdModifyFormAction;
import member.action.MemberAdPwModifyAction;
import member.action.MemberAdViewAction;
import member.action.MemberDeleteAction;
import member.action.MemberIdFindAction;
import member.action.MemberIdTestAction;
import member.action.MemberJoinAction;
import member.action.MemberListAction;
import member.action.MemberLoginAction;
import member.action.MemberLogoutAction;
import member.action.MemberLostPwModifyAction;
import member.action.MemberModifyFormAction;
import member.action.MemberMyIdDeleteAction;
import member.action.MemberMyModifyAction;
import member.action.MemberMyPageAction;
import member.action.MemberMyPointAction;
import member.action.MemberPointListAction;
import member.action.MemberPwCheckAction;
import member.action.MemberPwFindAction;
import member.action.MemberPwModifyAction;
import member.action.MemberSelectDeleteAction;
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
    	
    	if(command.equals("/memberLogin.us")){
    		forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/login.jsp");
		}else if(command.equals("/member/memberLogin.us")){
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./login.jsp");
			if(request.getParameter("turn")!=null) request.setAttribute("turn", request.getParameter("turn"));
			if(request.getParameter("returnURI")!=null) request.setAttribute("returnURI", request.getParameter("returnURI"));
			if(request.getParameter("type")!=null) request.setAttribute("type", request.getParameter("type"));
    	}else if(command.equals("/member/memberLoginAction.us")){
			action = new MemberLoginAction();
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
    		action = new MemberJoinAction();
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
    		action = new MemberMyPageAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/pwCheckForm.us")) {
    		forward=new ActionForward();
			forward.setPath("./member/pwCheck.jsp");
    	}else if(command.equals("/pwCheck.us")) {
    		action = new MemberPwCheckAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/memberLogout.us")) {
    		action = new MemberLogoutAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/myPage.us")) {
    		action = new MemberMyPageAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/memberMod.us")) {
    		action = new MemberMyModifyAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/pwModify.us")) {
    		action = new MemberPwModifyAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/adminPage.us")) {
    		forward=new ActionForward();
			forward.setPath("./admin/adminPage.jsp");
    	}else if(command.equals("/memberList.us")) {
    		action = new MemberListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/memberModAdForm.us")) {
    		action = new MemberAdModifyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/memberModAd.us")) {
    		action = new MemberAdModifyAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/mymod.us")) {
    		action = new MemberModifyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/memberDelete.us")) {
    		action = new MemberDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/pwAdModify.us")) {
    		action = new MemberAdPwModifyAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/member/findIdAction.us")) {
    		action = new MemberIdFindAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/member/findPwAction.us")) {
    		action = new MemberPwFindAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/lostPwModify.us")) {
    		action = new MemberLostPwModifyAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}
    	else if(command.equals("/memberSelectDelete.us")) {
    		action = new MemberSelectDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/userView.us")) {
    		action = new MemberAdViewAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/member/idTest.us")) {
    		action = new MemberIdTestAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/myPoint.us")) {
    		action = new MemberMyPointAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/usPoint.us")) {
    		action = new MemberPointListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
    	}else if(command.equals("/myIdDelete.us")) {
    		action = new MemberMyIdDeleteAction();
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
