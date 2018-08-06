package item.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import action.Action;
import svc.ItemService;
import vo.ActionForward;
import vo.ItemBoardBean;
import vo.ItemStockBean;
import vo.PageInfo;
import vo.Util;

public class UserItemQnaAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		Util util = new Util();
		
		ActionForward forward=null;
		ItemBoardBean itemBoardBean = null;
		String realFolder="";
		String saveFolder="/images";
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		String indate = request.getParameter("qdate");
		Date date = util.transformDate(indate);
		String item_code = request.getParameter("item_code");
		
		System.out.println(date + " : 날짜 안넘어오냐구우");
		System.out.println(item_code + " : 코드는?");
		
		itemBoardBean = new ItemBoardBean();
		itemBoardBean.setItem_code(multi.getParameter("item_code"));
		itemBoardBean.setContent(multi.getParameter("qna_content"));
		itemBoardBean.setSubject(multi.getParameter("qna_subject"));
		itemBoardBean.setQdate(date);
		itemBoardBean.setUser_id(id);
		itemBoardBean.setImg_path(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		
		ItemService itemService = new ItemService();
		boolean isWriteSuccess = itemService.itemQna(itemBoardBean, id);

		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("여기에 주소넣기");
		}

		return forward;
	}  	
	

}
