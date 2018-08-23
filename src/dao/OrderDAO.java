package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
		String sql = "INSERT INTO orders VALUES(?,?,now(),?,?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order.getOrder_id());
			pstmt.setString(2, order.getUser_id());
			pstmt.setString(3, order.getDel_phone());
			pstmt.setString(4, order.getDel_mail());
			pstmt.setString(5, order.getDel_addr());
			pstmt.setString(6, order.getDel_postcode());
			pstmt.setInt(7, order.getDepoint());
			pstmt.setString(8, order.getState());
			pstmt.setInt(9, order.getPay());
			pstmt.setString(10, order.getPayment());
			pstmt.setString(11, order.getReceiver());
			pstmt.setInt(12, order.getParcel());
			
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
	public int listCountOrder() {
		String sql = "SELECT COUNT(*) FROM orders ORDER BY dati DESC";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) listCount = rs.getInt(1);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		
		return listCount;
	}
	public int listCountOrderState(String state) {
		String sql = "SELECT COUNT(*) FROM orders WHERE state='"+state+"'";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) listCount = rs.getInt(1);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		
		return listCount;
	}
	public int listCountUserOrder(String user_id) {
		String sql = "SELECT COUNT(*) FROM orders WHERE user_id = '"+user_id+"' ORDER BY dati DESC";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) listCount = rs.getInt(1);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		
		return listCount;
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
					orderList.add(new OrderBean(rs.getInt("order_id"),rs.getString("user_id"),rs.getTimestamp("dati"),
							"", "","","", 0,rs.getString("state"),
							rs.getInt("pay"),rs.getString("payment"),rs.getString("receiver"),0));
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
	public ArrayList<OrderBean> selectOrderList(int page, String state){
		ArrayList<OrderBean> orderList = null;
		String sql = "SELECT * FROM orders WHERE state = '"+state+"' ORDER BY order_id DESC LIMIT ?,10";
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
					orderList.add(new OrderBean(rs.getInt("order_id"),rs.getString("user_id"),rs.getTimestamp("dati"),
							"", "","","", 0,rs.getString("state"),
							rs.getInt("pay"),rs.getString("payment"),rs.getString("receiver"),0));
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
	public ArrayList<OrderViewBean> orderItemList(int order_id){
		ArrayList<OrderViewBean> orderList = null;
		String sql = "SELECT * FROM order_view WHERE order_id = '"+order_id+"'";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				orderList = new ArrayList<OrderViewBean>();
				do {
					orderList.add(new OrderViewBean(rs.getInt("order_id"),rs.getString("item_code"),
							rs.getString("item_name"),rs.getInt("price"),rs.getInt("amount"), rs.getTimestamp("dati")));
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
	public ArrayList<OrderViewBean> userItemList(String user_id){
		ArrayList<OrderViewBean> orderList = null;
		String sql = "SELECT * FROM order_view WHERE user_id = '"+user_id+"' GROUP BY order_id";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				orderList = new ArrayList<OrderViewBean>();
				do {
					orderList.add(new OrderViewBean(rs.getInt("order_id"),rs.getString("item_code"),
							rs.getString("item_name"),rs.getInt("price"),rs.getInt("amount"), rs.getTimestamp("dati")));
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
	public ArrayList<OrderBean> userOrderList(String user_id, int page, int limit){
		ArrayList<OrderBean> orderList = null;
		String sql = "SELECT order_id, user_id, dati, state, pay, payment FROM orders WHERE user_id = '"+user_id+"' ORDER BY order_id DESC LIMIT ?,?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int startrow = (page-1)*limit;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				orderList = new ArrayList<OrderBean>();
				do {
					orderList.add(new OrderBean(rs.getInt("order_id"),rs.getString("user_id"),rs.getTimestamp("dati"),
							"", "","","", 0,rs.getString("state"),rs.getInt("pay"),rs.getString("payment"),"",0));
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
		String sql = "SELECT * FROM orders WHERE order_id = '"+order_id+"'";
		OrderBean order = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				order = new OrderBean(rs.getInt("order_id"),rs.getString("user_id"),rs.getTimestamp("dati"),
						rs.getString("del_phone"), rs.getString("del_mail"),rs.getString("del_addr"),
						rs.getString("del_postcode"), rs.getInt("depoint"),rs.getString("state"),
						rs.getInt("pay"),rs.getString("payment"),rs.getString("receiver"),rs.getInt("parcel"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		
		return order;
	}
	public int changeOrderState(int order_id, String state) {
		int updateCount = 0;
		String sql = "UPDATE orders SET state= '"+state+"' WHERE order_id = ?";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order_id);
			updateCount = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) close(pstmt);
		}
		
		return updateCount;
	}
	public boolean isBoughtUser(String item_code, String id, int order_id) {
		boolean result = false;
		String sql = "SELECT a.order_id AS order_id, a.user_id AS user_id, b.item_code AS item_code from orders AS a, order_item AS b WHERE a.order_id=b.order_id AND b.item_code=? AND user_id=? AND a.order_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, item_code);
			pstmt.setString(2, id);
			pstmt.setInt(3, order_id);
			rs = pstmt.executeQuery();
			if(rs.next()) result = true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		
		return result;
	}
	public ArrayList<Integer> orderIdList(String item_code, String id) {
		ArrayList<Integer> orderids = new ArrayList<Integer>();
		String sql = "SELECT a.order_id AS order_id, a.user_id AS user_id, b.item_code AS item_code from orders AS a, order_item AS b WHERE a.order_id=b.order_id AND b.item_code=? AND user_id=? ORDER BY order_id ASC";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, item_code);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do orderids.add(rs.getInt("order_id")); while(rs.next());
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		
		return orderids;
	}
	public int salesOrderCount1(String start, String end){
		String sql = "SELECT count(*) FROM orders WHERE dati between '"+start+"' and '"+end+"'";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) listCount = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		
		return listCount;
	}
	public int salesOrderCount2(String date){
		//String sql = "SELECT order_id, user_id, dati, state, pay, payment FROM orders WHERE YEAR(dati) = ? AND MONTH(dati) = ? ORDER BY dati DESC LIMIT ?,10";
		String sql = "select count(*) from orders where dati BETWEEN str_to_date('"+date+"','%Y-%m-%d') AND date_add(str_to_date('"+date+"', '%Y-%m-%d'), interval 1 month)";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) listCount = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		
		return listCount;
	}
	public int salesItemCount1(String start, String end){
		String sql = "SELECT count(*) FROM order_view WHERE dati between '"+start+"' and '"+end+"'";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) listCount = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		
		return listCount;
	}
	public int salesItemCount2(String date){
		String sql = "select count(*) from order_view a where dati BETWEEN str_to_date('"+date+"','%Y-%m-%d') AND date_add(str_to_date('"+date+"', '%Y-%m-%d'), interval 1 month)";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) listCount = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		
		return listCount;
	}
	public ArrayList<OrderBean> salesOrderList1(String start, String end, int page){
		ArrayList<OrderBean> salesList = null;
		String sql = "SELECT order_id, user_id, dati, state, pay, payment FROM orders WHERE dati between '"+start+"' and '"+end+"' ORDER BY dati DESC LIMIT ?,10";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int startrow = (page-1)*10;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				salesList = new ArrayList<OrderBean>();
				do {
					salesList.add(new OrderBean(rs.getInt("order_id"),rs.getString("user_id"),rs.getTimestamp("dati"),
							"", "","","", 0,rs.getString("state"),rs.getInt("pay"),rs.getString("payment"),"",0));
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		
		return salesList;
	}
	public Map<String, Integer> calculateProfit(String start, String end) {
		Map<String, Integer> salesMap = new HashMap<String, Integer>();
		PreparedStatement pstmt1 = null;
		ResultSet rs1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		String sql1 = "SELECT sum(pay), sum(depoint), sum(parcel) FROM orders WHERE dati between '"+start+"' and '"+end+"'";
		String sql2 = "SELECT count(*) FROM order_view WHERE dati between '"+start+"' and '"+end+"'";
		try {
			pstmt1 = conn.prepareStatement(sql1);
			rs1 = pstmt1.executeQuery();
			if(rs1.next()) {
				salesMap.put("this_profit", rs1.getInt(1)-rs1.getInt(3));
				salesMap.put("this_depoint", rs1.getInt(2));
				salesMap.put("this_pay", rs1.getInt(1)+rs1.getInt(2));
			}
			
			pstmt2 = conn.prepareStatement(sql2);
			rs2 = pstmt2.executeQuery();
			if(rs2.next()) salesMap.put("this_sales", rs2.getInt(1));
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs2!=null) close(rs2);
			if(pstmt2!=null) close(pstmt2);
			if(rs1!=null) close(rs1);
			if(pstmt1!=null) close(pstmt1);
		}
		
		return salesMap;
	}
	public ArrayList<OrderBean> salesOrderList2(String date, int page){
		ArrayList<OrderBean> salesList = null;
<<<<<<< HEAD
		//둘 다 가능.
		//String sql = "SELECT order_id, user_id, dati, state, pay, payment FROM orders WHERE YEAR(dati) = ? AND MONTH(dati) = ? ORDER BY dati DESC LIMIT ?,10";
=======
>>>>>>> 5166f2568e8c6acb26007983da939408557e6f88
		String sql = "select order_id, user_id, dati, state, pay, payment from orders where dati BETWEEN str_to_date('"+date+"','%Y-%m-%d') AND date_add(str_to_date('"+date+"', '%Y-%m-%d'), interval 1 month) ORDER BY dati DESC LIMIT ?,10";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int startrow = (page-1)*10;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				salesList = new ArrayList<OrderBean>();
				do {
					salesList.add(new OrderBean(rs.getInt("order_id"),rs.getString("user_id"),rs.getTimestamp("dati"),
							"", "","","", 0,rs.getString("state"),rs.getInt("pay"),rs.getString("payment"),"",0));
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		
		return salesList;
	}
	public ArrayList<OrderViewBean> salesItemList1(String start, String end, String order, int page){
		ArrayList<OrderViewBean> orderList = null;
		String sql = "SELECT order_id, item_code, item_name, price, amount, dati, "
				+ "(select sum(price*amount) from order_view b where dati between '"+start+"' and '"+end+"' and a.item_code=b.item_code group by item_code) as profit, "
				+ "(select sum(amount) from order_view c where dati between '"+start+"' and '"+end+"' and a.item_code=c.item_code group by item_code) as sales "
				+ "FROM order_view a WHERE dati between '"+start+"' and '"+end+"' ORDER BY "+order+" DESC LIMIT ?,10";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int startrow = (page-1)*10;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				orderList = new ArrayList<OrderViewBean>();
				do {
					orderList.add(new OrderViewBean(rs.getInt("order_id"),rs.getString("item_code"),
							rs.getString("item_name"),rs.getInt("price"),rs.getInt("amount"),
							rs.getTimestamp("dati"), rs.getInt("profit"), rs.getInt("sales")));
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
	public ArrayList<OrderViewBean> salesItemList2(String date, String order, int page){
		ArrayList<OrderViewBean> orderList = null;
		String sql = "select order_id, item_code, item_name, price, amount, dati, "
				+ "(select sum(price*amount) from order_view b where dati BETWEEN str_to_date('"+date+"','%Y-%m-%d') AND date_add(str_to_date('"+date+"', '%Y-%m-%d'), interval 1 month) and a.item_code=b.item_code group by item_code) as profit, "
				+ "(select sum(amount) from order_view c where dati BETWEEN str_to_date('"+date+"','%Y-%m-%d') AND date_add(str_to_date('"+date+"', '%Y-%m-%d'), interval 1 month) and a.item_code=c.item_code group by item_code) as sales "
				+ "from order_view a where dati BETWEEN str_to_date('"+date+"','%Y-%m-%d') AND date_add(str_to_date('"+date+"', '%Y-%m-%d'), interval 1 month) ORDER BY "+order+" DESC LIMIT ?,10";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int startrow = (page-1)*10;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				orderList = new ArrayList<OrderViewBean>();
				do {
					orderList.add(new OrderViewBean(rs.getInt("order_id"),rs.getString("item_code"),
							rs.getString("item_name"),rs.getInt("price"),rs.getInt("amount"),
							rs.getTimestamp("dati"), rs.getInt("profit"), rs.getInt("sales")));
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
	public Map<String, Integer> thisMonthSales(String start, String end){
		Map<String, Integer> salesMap = new HashMap<String, Integer>(); 
		PreparedStatement pstmt1 = null;PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;PreparedStatement pstmt4 = null;
		ResultSet rs1 = null;ResultSet rs2 = null;ResultSet rs3 = null;ResultSet rs4 = null;
<<<<<<< HEAD
		String sql1 = "select sum(pay), sum(depoint), sum(parcel) from orders where dati BETWEEN "+start+" AND "+end;
		String sql2 = "select count(*) from order_view a where dati BETWEEN "+start+" AND "+end;
		String sql3 = "select sum(pay)-sum(parcel) from orders where dati BETWEEN "+start+" AND "+end;
		String sql4 = "select count(*) from order_view a where dati BETWEEN "+start+" AND "+end;
=======
		String sql1 = "select sum(pay), sum(depoint), sum(parcel) from orders where dati BETWEEN '"+start+"' AND '"+end+"'";
		String sql2 = "select count(*) from order_view a where dati BETWEEN '"+start+"' AND '"+end+"'";
		String sql3 = "select sum(pay)-sum(parcel) from orders where dati BETWEEN date_add(str_to_date('"+start+"', '%Y-%m-%d'), interval -1 month) AND date_add(str_to_date('"+end+"', '%Y-%m-%d'), interval -1 month)";
		String sql4 = "select count(*) from order_view a where dati BETWEEN date_add(str_to_date('"+start+"', '%Y-%m-%d'), interval -1 month) AND date_add(str_to_date('"+end+"', '%Y-%m-%d'), interval -1 month)";
>>>>>>> 5166f2568e8c6acb26007983da939408557e6f88
		try {
			pstmt1 = conn.prepareStatement(sql1);
			rs1 = pstmt1.executeQuery();
			if(rs1.next()) {
				salesMap.put("this_profit", rs1.getInt(1)-rs1.getInt(3));//(총 금액 - 포인트 결제 (결제금액)) - 택배비 = 순이익
				salesMap.put("this_depoint", rs1.getInt(2));
				salesMap.put("this_pay", rs1.getInt(1)+rs1.getInt(2)); //결제금액+포인트결제 = 총 금액
			}
			
			pstmt2 = conn.prepareStatement(sql2);
			rs2 = pstmt2.executeQuery();
			if(rs2.next()) salesMap.put("this_sales", rs2.getInt(1));
			
			pstmt3 = conn.prepareStatement(sql3);
			rs3 = pstmt3.executeQuery();
			if(rs3.next()) {
				int temp = rs3.getInt(1)==0||salesMap.get("this_profit")==0 ? 
						salesMap.get("this_profit")-rs3.getInt(1) : (int)(((double)salesMap.get("this_profit")/rs3.getInt(1)-1.0)*100);
				salesMap.put("profit_ration", temp);
			}
			
			pstmt4 = conn.prepareStatement(sql4);
			rs4 = pstmt4.executeQuery();
			if(rs4.next()) {
				int temp = rs4.getInt(1)==0||salesMap.get("this_sales")==0 ? 
						salesMap.get("this_sales")-rs4.getInt(1) : (int)(((double)salesMap.get("this_sales")/rs4.getInt(1)-1.0)*100);
				salesMap.put("sales_ration", temp);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs4!=null) close(rs4);
			if(pstmt4!=null) close(pstmt4);
			if(rs3!=null) close(rs3);
			if(pstmt3!=null) close(pstmt3);
			if(rs2!=null) close(rs2);
			if(pstmt2!=null) close(pstmt2);
			if(rs1!=null) close(rs1);
			if(pstmt1!=null) close(pstmt1);
		}
		
		return salesMap;
	}
}
