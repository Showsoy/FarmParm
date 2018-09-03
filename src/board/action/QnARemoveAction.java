package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.BoardService;
import vo.ActionForward;

public class QnARemoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		String myQna = null;
		String user_id = null;
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		myQna = request.getParameter("myQna");
		user_id = request.getParameter("user_id");
		String std = request.getParameter("std");
		System.out.println(myQna + " :?");
		
		if (id == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='./member/memberLogin.us?turn=ok';");
			out.println("</script>");
		} else {
			String item_code = request.getParameter("item_code");
			int page = Integer.parseInt(request.getParameter("page"));
			BoardService boardService = new BoardService();
			String nums[];
			String codes[];
			int board_num;
			int deleteCount = 0;

			if (request.getParameter("bnum") == null) {
				if (!id.equals("admin")) {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('권한이 없습니다.');");
					out.println("history.back();");
					out.println("</script>");
				} else {
				nums = request.getParameterValues("icheck");
				codes = request.getParameterValues("codes");
				for (int i = 0; i < nums.length; i++) {
					deleteCount = boardService.removeArticle("qna_board", Integer.parseInt(nums[i]), codes[i]);
				}
			}
			} else {
				board_num = Integer.parseInt(request.getParameter("bnum"));
				String writer = boardService.selectWriter("qna_board", board_num);
				if (!id.equals("admin") && !id.equals(writer) && myQna.equals("MYQNA")) {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('권한이 없습니다.');");
					out.println("history.back();");
					out.println("</script>");
				} else {
					deleteCount = boardService.removeArticle("qna_board", board_num, item_code);
				}
			}
	
			if (deleteCount == 0) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제실패');");
				out.println("history.back();");
				out.println("</script>");
			} else {
				if(request.getParameter("r_page")==null) {
					String path = myQna!=null ? "myQna.bo?" : "./qnaList.bo?page="+page;
					String path2 = user_id!=null ? "userView.us?" : "./qnaList.bo?page="+page;
					if(request.getParameter("keyword")!=null && user_id==null) {
						System.out.println("1");
						path += "&std="+request.getParameter("std")+"&keyword="+request.getParameter("keyword");
						response.setContentType("text/html;charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>");
						out.println("location.href=encodeURI('"+path+"');");
						out.println("</script>");
					}else if(request.getParameter("keyword")==null && user_id==null) {
						System.out.println("2");
						forward= new ActionForward(path,true);
					}else if(myQna.equals("myQna")) {
							System.out.println("3");
							path += "&std="+std+"&keyword="+request.getParameter("keyword");
							response.setContentType("text/html;charset=UTF-8");
							PrintWriter out = response.getWriter();
							out.println("<script>");
							out.println("location.href=encodeURI('"+path+"');");
							out.println("</script>");
					}else if(user_id!=null&&!myQna.equals("myQna")) { 
							System.out.println("4");
							path2 += "&user_id="+user_id;
							response.setContentType("text/html;charset=UTF-8");
							PrintWriter out = response.getWriter();
							out.println("<script>");
							out.println("location.href=encodeURI('"+path2+"');");
							out.println("</script>");
					}
				}else {
					String r_page = request.getParameter("r_page");
					String q_page = request.getParameter("q_page");
					forward = new ActionForward("./uitemView.im?item_code="+item_code+"&page="+page+"&r_page="+r_page+"&q_page="+q_page, true);
					
				}
			}
		}
		return forward;
	}

}
