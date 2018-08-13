package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import board.action.CsBoardListAction;
import board.action.CsBoardRemoveAction;
import board.action.CsBoardReplyAction;
import board.action.CsBoardReplyFormAction;
import board.action.CsBoardViewAction;
import board.action.CsBoardWriteAction;
import board.action.NoticeListAction;
import board.action.NoticeRemoveAction;
import board.action.NoticeViewAction;
import board.action.NoticeWriteAction;
import board.action.QnARemoveAction1;
import board.action.QnAReplyAction1;
import board.action.QnAReplyFormAction1;
import board.action.QnAReplyAction;
import board.action.QnAReplyFormAction;
import board.action.QnAWriteAction1;
import board.action.QnAWriteFormAction;
import board.action.ReviewRemoveAction;
import board.action.ReviewReplyAction;
import board.action.ReviewReplyFormAction;
import board.action.ReviewWriteAction1;
import board.action.ReviewWriteFormAction;
import vo.ActionForward;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("*.bo")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardController() {
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
    	
    	if(command.equals("/csList.bo")) {
    		action = new CsBoardListAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/csWrite.bo")) {
    		action = new CsBoardWriteAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/csView.bo")) {
    		action = new CsBoardViewAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/csRemove.bo")) {
    		action = new CsBoardRemoveAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/csReplyForm.bo")) {
    		action = new CsBoardReplyFormAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/csReply.bo")) {
    		action = new CsBoardReplyAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/noList.bo")) {
    		action = new NoticeListAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/noWrite.bo")) {
    		action = new NoticeWriteAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/noView.bo")) {
    		action = new NoticeViewAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/noRemove.bo")) {
    		action = new NoticeRemoveAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/qnaRegist.bo")) {
    		action = new QnAWriteAction1();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/reWrite.bo")) {
    		action = new ReviewWriteAction1();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/reForm.bo")) {
    		action = new ReviewWriteFormAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/qnaForm.bo")) {
    		action = new QnAWriteFormAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/qnaWrite.bo")) {
    		action = new QnAWriteAction1();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/reReply.bo")) {
    		action = new ReviewReplyAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/rereForm.bo")) {
    		action = new ReviewReplyFormAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/qnaReplyForm.bo")) {
    		action = new QnAReplyFormAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/qnaReply.bo")) {
    		action = new QnAReplyAction1();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/qnareForm.bo")) {
    		action = new QnAReplyFormAction1();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/reRemove.bo")) {
    		action = new ReviewRemoveAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/qnaRemove.bo")) {
    		action = new QnARemoveAction1();
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
