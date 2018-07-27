package admin.action;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ItemService;
import vo.ActionForward;
import vo.ItemBean;
import vo.ItemStockBean;

public class ItemNewAction implements action.Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");
//		if(id==null) {
//			forward = new ActionForward();
//			forward.setRedirect(true);
//			forward.setPath("./memberLogin.me");
//		}else if(!id.equals("admin")) {
//			response.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('관리자가 아닙니다.');");
//			out.println("location.href='../dog/dogList.dog';");
//			out.println("</script>");
//		}
		
		ItemService itemService = new ItemService();
	
		Date date = new Date(0, 0, 0);	
		
		String realFolder = "";
		String saveFolder = "/images";
		String encType = "UTF-8";
		int fileSize = 5*1024*1024;
		
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, encType, new DefaultFileRenamePolicy());
		String image = multi.getFilesystemName("img_path");
		ItemBean item = new ItemBean(
				multi.getParameter("item_code"),
				multi.getParameter("item_name"),
				Integer.parseInt(multi.getParameter("price")),
				multi.getParameter("origin"),
				multi.getParameter("category"),
				image,
				Integer.parseInt(multi.getParameter("sale")),
				multi.getParameter("content"),
				0,0);
		ItemStockBean itemS = new ItemStockBean(
				multi.getParameter("item_code"),
				"등록",
				date,
				0,0,1);
		boolean isRegistSuccess = itemService.registItem(item);
		
		if(!isRegistSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			boolean isEnrollSuccess = itemService.enrollItemStock(itemS);
			if(!isEnrollSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('재고등록실패 직접등록해주세요');");
				out.println("</script>");
			}
			forward= new ActionForward("./itemList.im",true);//리스트로 들어감
		}
		return forward;
	}

}
