package item.action;
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
		String id = (String)session.getAttribute("id");
		
		if(id==null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='../member/memberLogin.us?turn=ok';");
			out.println("</script>");
		}else if(!id.equals("admin")) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다.');");
			out.println("location.href='../main.im';");
			out.println("</script>");
		}else {
			ItemService itemService = new ItemService();
			
			String realFolder = "";
			String saveFolder = "/images";
			String encType = "UTF-8";
			int fileSize = 5*1024*1024;
			
			ServletContext context = request.getServletContext();
			realFolder = context.getRealPath(saveFolder);
			MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, encType, new DefaultFileRenamePolicy());
			String image = multi.getFilesystemName("img_path");
			String content = multi.getParameter("content");
			content = content.replace("\r\n", "<br>");
			
			ItemBean item = new ItemBean(
					multi.getParameter("item_code"),
					multi.getParameter("item_name"),
					Integer.parseInt(multi.getParameter("price")),
					multi.getParameter("origin"),
					multi.getParameter("category"),
					image,
					Integer.parseInt(multi.getParameter("sale")),
					content,
					0,0);
			
			ItemStockBean itemS = new ItemStockBean(
					multi.getParameter("item_code"),"등록",
					Integer.parseInt(multi.getParameter("stock")),
					Integer.parseInt(multi.getParameter("stock")),1);
			
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
		}
		return forward;
	}

}
