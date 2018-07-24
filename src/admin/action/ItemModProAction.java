package admin.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ItemService;
import vo.ActionForward;
import vo.ItemBean;

public class ItemModProAction implements action.Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");
		ActionForward forward = null;
		
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
		String realFolder = "";
		String saveFolder = "/images";
		String encType = "UTF-8";
		int fileSize = 5*1024*1024;
		
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, encType, new DefaultFileRenamePolicy());
		
		String image = multi.getFilesystemName("image");
		
		if(multi.getFilesystemName("image")==null) {
			image = multi.getParameter("oldImage");
		}else {
			image = multi.getFilesystemName("image");
		}
		ItemBean item = new ItemBean(
				multi.getParameter("item_code"),
				multi.getParameter("item_name"),
				Integer.parseInt(multi.getParameter("price")),
				multi.getParameter("origin"),
				multi.getParameter("category"),
				image,
				Integer.parseInt(multi.getParameter("sale")),
				multi.getParameter("content"),
				0);
		
		boolean isModifySuccess = itemService.updateItem(item, multi.getParameter("item_code"));
		
		if(!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward= new ActionForward("/ItemViewAction.im",true);
		}
		
		return forward;
	}

}
