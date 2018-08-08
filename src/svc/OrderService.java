package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.io.PrintWriter;
import java.sql.Connection;
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
import order.action.SMTPAuthenticator;
import vo.OrderBean;
import vo.OrderItemBean;
import vo.OrderViewBean;

public class OrderService {
	public int selectOrderId() {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection conn = getConnection();
		orderDAO.setConnection(conn);
		int order_id = orderDAO.selectOrderId();
		
		close(conn);
		return order_id;
	}
	public boolean takeOrder(OrderBean order, ArrayList<OrderViewBean> orderList, String id, int depoint, int plpoint) {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection conn = getConnection();
		orderDAO.setConnection(conn);
		boolean isRegistSuccess = false;
		int insertCount1 = orderDAO.takeOrder(order);
		int insertCount2 = orderDAO.takeOrderItem(orderList);
		UserService userService = new UserService();
		int updateCount1 = userService.userDeductPoint(id, depoint);
		int updateCount2 = userService.userPlusPoint(id, plpoint);
		
		if(insertCount1>0&&insertCount2>0&&updateCount1>0&&updateCount2>0) {
			commit(conn);
			isRegistSuccess = true;
		}else {
			rollback(conn);
		}
		
		close(conn);
		return isRegistSuccess;
	}
	public boolean takeOrderItem(ArrayList<OrderViewBean> orderList) {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection conn = getConnection();
		orderDAO.setConnection(conn);
		boolean isRegistSuccess = false;
		int insertCount = orderDAO.takeOrderItem(orderList);
		
		if(insertCount>0) {
			commit(conn);
			isRegistSuccess = true;
		}else {
			rollback(conn);
		}
		
		close(conn);
		return isRegistSuccess;
	}
	public OrderBean selectOrder(int order_id) {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection conn = getConnection();
		orderDAO.setConnection(conn);
		OrderBean order = orderDAO.selectOrder(order_id);
		
		close(conn);
		return order;
	}
	public int listCountOrder(){
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection conn = getConnection();
		orderDAO.setConnection(conn);
		int listCount = orderDAO.listCountOrder();
		
		close(conn);
		return listCount;
	}
	public int listCountOrderState(String state){
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection conn = getConnection();
		orderDAO.setConnection(conn);
		int listCount = orderDAO.listCountOrderState(state);
		
		close(conn);
		return listCount;
	}
	public int listCountUserOrder(String user_id){
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection conn = getConnection();
		orderDAO.setConnection(conn);
		int listCount = orderDAO.listCountUserOrder(user_id);
		
		close(conn);
		return listCount;
	}
	public ArrayList<OrderBean> selectOrderList(int page) {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection conn = getConnection();
		orderDAO.setConnection(conn);
		ArrayList<OrderBean> orderList = orderDAO.selectOrderList(page);
		
		close(conn);
		return orderList;
	}
	public ArrayList<OrderBean> selectOrderStateList(int page, String state) {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection conn = getConnection();
		orderDAO.setConnection(conn);
		ArrayList<OrderBean> orderList = orderDAO.selectOrderList(page, state);
		
		close(conn);
		return orderList;
	}
	public ArrayList<OrderViewBean> orderItemList(int order_id) {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection conn = getConnection();
		orderDAO.setConnection(conn);
		ArrayList<OrderViewBean> orderList = orderDAO.orderItemList(order_id);
		
		close(conn);
		return orderList;
	}
	public ArrayList<OrderViewBean> userItemList(String user_id) {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection conn = getConnection();
		orderDAO.setConnection(conn);
		ArrayList<OrderViewBean> orderList = orderDAO.userItemList(user_id);
		
		close(conn);
		return orderList;
	}
	public ArrayList<OrderBean> userOrderList(String user_id, int page, int limit) {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection conn = getConnection();
		orderDAO.setConnection(conn);
		ArrayList<OrderBean> orderList = orderDAO.userOrderList(user_id, page, limit);
		
		close(conn);
		return orderList;
	}
	public void sendOrderMail(String email, String mail_content) {
		String sender = "clemado1@gmail.com";
		String receiver = email;
		String subject = "주문이 완료되었습니다.";
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
	public int changeOrderState(int order_id, String state) {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection conn = getConnection();
		orderDAO.setConnection(conn);
		int updateCount = orderDAO.changeOrderState(order_id, state);
		if(updateCount>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateCount;
	}
}
