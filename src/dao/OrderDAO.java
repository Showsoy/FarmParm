package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.OrderBean;
import vo.OrderViewBean;

public class OrderDAO {
	Connection conn;
	private static OrderDAO orderDAO;
	
	private OrderDAO() {
		
	}
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public static OrderDAO getInstance() {
		if(orderDAO==null) {
			orderDAO = new OrderDAO();
		}
		return orderDAO;
	}
	public int selectOrderId() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int order_id = 1;
		String sql = "SELECT MAX(order_id) FROM orders";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) order_id = rs.getInt(1)+1;
		}catch(Exception e) {
			e.getStackTrace();
		}finally {
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		return order_id;
	}
	public int takeOrder(OrderBean order) {
		int insertCount = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO orders VALUES(?,?,now(),?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order.getOrder_id());
			pstmt.setString(2, order.getUser_id());
			pstmt.setString(3, order.getDel_addr());
			pstmt.setString(4, order.getDel_postcode());
			pstmt.setInt(5, order.getDepoint());
			pstmt.setString(6, order.getState());
			pstmt.setInt(7, order.getPay());
			pstmt.setString(8, order.getPayment());
			pstmt.setString(9, order.getReceiver());
			
			insertCount = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) close(pstmt);
		}
		
		return insertCount;
	}
	public int takeOrderItem(ArrayList<OrderViewBean> orderList) {
		int insertCount = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO order_item VALUES(?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0;i<orderList.size();i++) {
				pstmt.setString(1, orderList.get(i).getItem_code());
				pstmt.setInt(2, orderList.get(i).getOrder_id());
				pstmt.setInt(3, orderList.get(i).getAmount());
				pstmt.setInt(4, orderList.get(i).getPrice());
				
				insertCount = pstmt.executeUpdate();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) close(pstmt);
		}
		
		return insertCount;
	}
	public ArrayList<OrderBean> selectOrderList(int page){
		ArrayList<OrderBean> orderList = null;
		String sql = "SELECT * FROM orders ORDER BY dati DESC LIMIT ?,10";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int startrow = (page-1)*10;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				orderList = new ArrayList<OrderBean>();
				do {
					orderList.add(new OrderBean(rs.getInt("order_id"),rs.getString("user_id"),rs.getDate("dati"),
							rs.getString("del_addr"),rs.getString("del_postcode"), rs.getInt("depoint"),
							rs.getString("state"),rs.getInt("pay"),rs.getString("payment"),rs.getString("receiver")));
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		
		return orderList;
	}
	
	public ArrayList<OrderBean> userOrderList(String user_id, int page){
		ArrayList<OrderBean> orderList = null;
		String sql = "SELECT * FROM orders WHERE user_id = '"+user_id+"' ORDER BY dati DESC LIMIT ?,10";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int startrow = (page-1)*10;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				orderList = new ArrayList<OrderBean>();
				do {
					orderList.add(new OrderBean(rs.getInt("order_id"),rs.getString("user_id"),rs.getDate("dati"),
							rs.getString("del_addr"),rs.getString("del_postcode"), rs.getInt("depoint"),
							rs.getString("state"),rs.getInt("pay"),rs.getString("payment"), rs.getString("receiver")));
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		
		return orderList;
	}
	public OrderBean selectOrder(int order_id){
		String sql = "SELECT * FROM orders WHERE order_id = "+order_id;
		OrderBean order = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				order = new OrderBean(rs.getInt("order_id"), rs.getString("user_id"), rs.getDate("dati"),
						rs.getString("del_addr"), rs.getString("del_postcode"), rs.getInt("depoint"),
						rs.getString("state"), rs.getInt("pay"), rs.getString("payment"),rs.getString("receiver"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		
		return order;
	}
}
