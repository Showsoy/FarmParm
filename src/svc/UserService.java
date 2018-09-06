package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import dao.OrderDAO;
import dao.UserDAO;
import vo.PointBean;
import vo.SMTPAuthenticator;
import vo.UserBean;
import vo.UserViewBean;

public class UserService {
	
	public boolean userIdTest(String id) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		boolean result = userDAO.userIdTest(id);
		
		close(con);
		return result;
	}
	public boolean login(String id, String pass) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		boolean loginResult = userDAO.selectLoginId(id, pass);

		close(con);
		return loginResult;
	}
	public String salt(String id) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		String loginSalt = userDAO.selectLoginSalt(id);
		
		close(con);
		return loginSalt;
	}
	public boolean joinUser(UserBean users) {
		boolean joinSuccess = false;
		UserDAO userDAO = UserDAO.getInstance();
		Connection con = getConnection();
		userDAO.setConnection(con);
		int insertCount = userDAO.insertUser(users);
		if(insertCount>0) {
			joinSuccess = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return joinSuccess;
	}
	public int getListCount() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		listCount = userDAO.selectListCount();
		
		close(con);
		return listCount;
	}
	public int getSearchList(String user_id) throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		listCount = userDAO.getSearchList(user_id);
		
		close(con);
		return listCount;
	}
	public int gradeListCount(String grade) throws Exception {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		int listCount = userDAO.gradeListCount(grade);
		
		close(con);
		return listCount;
	}
	public ArrayList<UserViewBean> userList(int page, String std) throws Exception{
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		ArrayList<UserViewBean> userList = userDAO.users(page, std);
		
		close(con);
		return userList;
	}
	public boolean modifyUsers(UserBean user) {
		UserDAO userDAO = UserDAO.getInstance();
		Connection con = getConnection();
		userDAO.setConnection(con);		
		boolean isModifySuccess = false;
		int insertCount = userDAO.updateUserModify(user);
		if(insertCount>0){
			commit(con);
			isModifySuccess=true;
		}else{
			rollback(con);
		}
		close(con);
		return isModifySuccess;
	}
	public boolean isPasswdValid(String users, String pw) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		boolean modifyPw = false;
		boolean loginPw = userDAO.isPasswdValid(users,pw);
		if(loginPw){
			modifyPw = true;
		}
		close(con);
		return modifyPw;
	}
	public boolean modifyMy(UserBean users) {
		UserDAO userDAO = UserDAO.getInstance();
		Connection con = getConnection();
		userDAO.setConnection(con);		
		boolean isModifySuccess = false;
		int insertCount = userDAO.updateMyModify(users);
		if(insertCount>0){
			commit(con);
			isModifySuccess=true;
		}else{
			rollback(con);
		}
		close(con);
		return isModifySuccess;
	}
	public boolean modifyPw(String user_id, String new_pswd_last) {
		UserDAO userDAO = UserDAO.getInstance();
		Connection con = getConnection();
		userDAO.setConnection(con);		
		boolean modifyPw = false;
		int loginPw = userDAO.updatePwModify(user_id,new_pswd_last);
		if(loginPw > 0){
			commit(con);
			modifyPw = true;
		}
		close(con);
		return modifyPw;
	}
	public String findId(String name, Date birth){
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		String loginId = userDAO.findUserId(name,birth);

		close(con);
		return loginId;
	}
	public String findPw(String user_id) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		String email = userDAO.findUserPw(user_id);
		
		close(con);
		return email;
	}
	public boolean deleteMember(String uid) {
		boolean deleteResult = false;
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		int deleteCount = userDAO.deleteUser(uid);
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		int updateCount = orderDAO.setNullUserId(uid);
		
		if(deleteCount > 0 && updateCount >= 0){
			commit(con);
			deleteResult = true;
		}
		else{
			rollback(con);
		}
		close(con);
		return deleteResult;
	}
	public ArrayList<UserViewBean> searchId(int page, String search_id) throws Exception{
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		ArrayList<UserViewBean> userList = userDAO.searchId(page, search_id);
		
		close(con);
		return userList;
	}
	public ArrayList<UserViewBean> getGradeList(int page, String grade, String std) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		ArrayList<UserViewBean> userList = userDAO.getGradeList(page, grade, std);
		
		close(con);
		return userList;
	}
	public UserBean selectUserInfo(String id) {
		Connection conn = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(conn);
		UserBean user = userDAO.selectUserInfo(id);
		
		close(conn);
		return user;
	}
	public int findRecentPoint(String user_id) {
		Connection conn = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(conn);
		int balance = userDAO.findRecentPoint(user_id);
		
		close(conn);
		return balance;
	}
	public int userPlminusPoint(PointBean point) {
		Connection conn = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(conn);
		int updateCount = userDAO.userPlminusPoint(point);
		if(updateCount > 0){
			commit(conn);
		}
		else{
			rollback(conn);
		}
		close(conn);
		return updateCount;
	}
	public int myPointListCount(String id, String start, String end) {
		Connection conn = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(conn);
		int listCount = userDAO.myPointListCount(id, start, end);
		
		close(conn);
		return listCount;
	}
	public ArrayList<PointBean> myPointList(String id, String start, String end, int page) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		ArrayList<PointBean> pointList = userDAO.myPointList(id, start, end, page);
		close(con);
		return pointList;
	}
	public int orderPointMap(int order_id) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		int updateCount = userDAO.orderPointMap(order_id);
		close(con);
		return updateCount;
	}
	public void sendIssueMail(String email, String mail_subject, String mail_content) {
		String sender = email;
		String receiver = "clemado1@gmail.com";
		String subject = mail_subject;
		String content = mail_content;
		try {
			Properties properties = System.getProperties();
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.port", "587");
			Authenticator auth = (Authenticator) new SMTPAuthenticator();
			Session s = Session.getDefaultInstance(properties, auth);
			Message message = new MimeMessage(s);
			Address sender_address = new InternetAddress(sender);
			Address receiver_address = new InternetAddress(receiver);
			message.setHeader("content-type", "text/html;charset=UTF-8");
			message.setFrom(sender_address);
			message.addRecipient(Message.RecipientType.TO, receiver_address);
			message.setSubject(subject);
			message.setContent(content, "text/html;charset=UTF-8");
			message.setSentDate(new java.util.Date());
			Transport.send(message);
			System.out.println("<h3>메일이 정상적으로 전송되었습니다.</h3>");
		}catch (Exception e){
			System.out.println("SMTP 서버가 잘못 설정되었거나 서비스에 문제가 있습니다.");
			e.printStackTrace();
		}
	}
}
