package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import vo.PointBean;
import vo.UserBean;
import vo.UserViewBean;

public class UserDAO {
	
	public static UserDAO instance;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	private UserDAO() {
	}
	
	public static UserDAO getInstance(){
		if(instance == null){
			instance = new UserDAO();
		}
		return instance;
	}
	public void setConnection(Connection con){
		this.con = con;
	}
	
	public UserBean selectUserInfo(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM users WHERE user_id = ?";
		UserBean user = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				user = new UserBean(rs.getString("user_id"), rs.getString("name"), rs.getString("phone"), 
						rs.getDate("birth"), rs.getString("gender"), rs.getString("postcode"), rs.getString("address"), 
						rs.getString("address_second"), rs.getString("email"), rs.getString("grade"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	public boolean userIdTest(String id) {
		boolean flag = true;
		try{
			pstmt = con.prepareStatement("SELECT user_id FROM users WHERE user_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if(rs.next()){
				flag = false;
			}else{
				flag = true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				rs.close();
				pstmt.close();
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return flag;
	}
	public boolean selectLoginId(String id, String pass){
		boolean token = false;
		String sql="SELECT * FROM users WHERE user_id=? AND passwd=?";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if(rs.next()) token = true;
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			close(rs);
			close(pstmt);
		}
		return token;
	}
	public String selectLoginSalt(String id){
		String loginSalt = null;
		String sql="SELECT usalt FROM users WHERE user_id=?";
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				loginSalt = rs.getString("usalt");
			}else loginSalt = "nullID";
		}catch(Exception e){
			e.printStackTrace();		
		}finally{
			close(rs);
			close(pstmt);
		}
		return loginSalt;
	}
	public int insertUser(UserBean users){
		String sql="INSERT INTO users VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
		int insertCount=0;
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, users.getUser_id());
			pstmt.setString(2, users.getPasswd());
			pstmt.setString(3, users.getName());
			pstmt.setString(4, users.getPhone());
			pstmt.setDate(5, users.getBirth());
			pstmt.setString(6, users.getGender());
			pstmt.setString(7, users.getPostcode());
			pstmt.setString(8, users.getAddress());
			pstmt.setString(9, users.getAddress_second());
			pstmt.setString(10, users.getEmail());
			pstmt.setString(11, users.getGrade());
			pstmt.setString(12, users.getUsalt());
			insertCount=pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			close(pstmt);
		}
		return insertCount;
	}
	public int selectListCount() {
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			pstmt=con.prepareStatement("select count(*) from user_view");
			rs = pstmt.executeQuery();
			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	public int getSearchList(String keyword) {
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from user_view where user_id LIKE '%"+keyword+"%'";
		try{
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();			
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	public int gradeListCount(String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount= 0;
		String sql = "select count(*) from user_view where grade = ?";
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();		
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	public ArrayList<UserViewBean> users(int page){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user_list_sql="select * from user_view order by user_id asc limit ?,10";
		ArrayList<UserViewBean> articleList = new ArrayList<UserViewBean>();
		UserViewBean userList = null;
		int startrow=(page-1)*10;
		try{
			pstmt = con.prepareStatement(user_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				userList = new UserViewBean(
				rs.getString("user_id"),
				rs.getString("grade"),
				rs.getString("userpay"));
				articleList.add(userList);	
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	public int updateUserModify(UserBean user) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "";
		try {
			sql = "UPDATE users SET name=?, grade=?, phone=?,birth=?,gender=?,email=?,postcode=?,address=?,address_second=? where user_id=?";					
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getGrade());
			pstmt.setString(3, user.getPhone());
			pstmt.setDate(4, user.getBirth());
			pstmt.setString(5, user.getGender());
			pstmt.setString(6, user.getEmail());
			pstmt.setString(7, user.getPostcode());
			pstmt.setString(8, user.getAddress());
			pstmt.setString(9, user.getAddress_second());
			pstmt.setString(10, user.getUser_id());
			updateCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return updateCount;
	}
	public boolean modifyPwCheck(String users, String pw){
		boolean modifyPw = false;
		String sql="SELECT passwd FROM users WHERE user_id=? and passwd=?";
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, users);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()){
				modifyPw = true;
			}
		}catch(Exception e){
			e.printStackTrace();			
		}finally{
			close(rs);
			close(pstmt);
		}
		return modifyPw;
	}
	public int updateMyModify(UserBean users) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "";
		try {
			sql = "UPDATE users SET phone=?,birth=?,gender=?,postcode=?,address=?,address_second=?,email=? where user_id=?";	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, users.getPhone());
			pstmt.setDate(2, users.getBirth());
			pstmt.setString(3, users.getGender());
			pstmt.setString(4, users.getPostcode());
			pstmt.setString(5, users.getAddress());
			pstmt.setString(6, users.getAddress_second());
			pstmt.setString(7, users.getEmail());
			pstmt.setString(8, users.getUser_id());
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return updateCount;
	}
	public int updatePwModify(String user_id, String new_pswd_last) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "";
		try {
			sql = "UPDATE users SET passwd=? where user_id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, new_pswd_last);
			pstmt.setString(2, user_id);
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return updateCount;
	}
	public String selectPass(String id){
	String pass = null;
	String sql="SELECT passwd FROM users WHERE user_id=?";
	try{
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			pass = rs.getString("passwd");
		}
	}catch(Exception e){
		e.printStackTrace();		
	}finally{
		close(rs);
		close(pstmt);
	}
	return pass;
}
	public String findUserId(String name, Date birth){
		String findId = null;
		String sql="SELECT user_id FROM users WHERE name=? AND birth=?";
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setDate(2, birth);
			rs = pstmt.executeQuery();
			if(rs.next()){
				findId = rs.getString("user_id");
			}
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			close(rs);
			close(pstmt);
		}
		return findId;
	}
	public String findUserPw(String user_id){
		String email = null;
		String sql="SELECT email FROM users WHERE user_id=?";
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				email = rs.getString("email");
			}
		}catch(Exception e){
			e.printStackTrace();			
		}finally{
			close(rs);
			close(pstmt);
		}
		return email;
	}
	public int deleteUser(String uid){
		String sql="DELETE from users WHERE user_id=?";
		String sql2="DELETE from point WHERE user_id=?";
		
		int deleteCount = 0;
		int deleteCount2 = 0;
		
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, uid);
			deleteCount = pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
			if(deleteCount>0) {
				try{
					pstmt=con.prepareStatement(sql2);
					pstmt.setString(1, uid);
					deleteCount2 = pstmt.executeUpdate();
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					close(pstmt);
				}	
				
			}
			return deleteCount2;
	}
	
	public ArrayList<UserViewBean> searchId(int page, String search_id){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user_list_sql="SELECT * FROM user_view WHERE user_id LIKE '%"+search_id+"%' order by user_id asc limit ?,10";
		ArrayList<UserViewBean> articleList = new ArrayList<UserViewBean>();
		UserViewBean userList = null;
		int startrow=(page-1)*10;
		try{
			pstmt = con.prepareStatement(user_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				userList = new UserViewBean(
				rs.getString("user_id"),
				rs.getString("grade"),
				rs.getString("userpay"));
				articleList.add(userList);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	public ArrayList<UserViewBean> getGradeList(int page, String grade){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user_list_sql="select * from user_view where grade=? limit ?,10 ";
		ArrayList<UserViewBean> userList = null;
		int startrow=(page-1)*10;
		try{
			pstmt = con.prepareStatement(user_list_sql);
			pstmt.setString(1, grade);
			pstmt.setInt(2, startrow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userList = new ArrayList<UserViewBean>();
				do {
					userList.add(new UserViewBean(
							rs.getString("user_id"),
							rs.getString("grade"),
							rs.getString("userpay")
							));
				}while(rs.next());
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		return userList;
	}
	public ArrayList<UserViewBean> getPurchList(int page){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user_list_sql="select * from user_view order by userpay DESC limit ?,10 ";
		ArrayList<UserViewBean> userList = new ArrayList<UserViewBean>();
		UserViewBean user = null;
		int startrow=(page-1)*10;
		try{
			pstmt = con.prepareStatement(user_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				user = new UserViewBean(
				rs.getString("user_id"),
				rs.getString("grade"),
				rs.getString("userpay"));
				userList.add(user);	
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null) close(rs);
			if(pstmt!=null) close(pstmt);
		}
		return userList;
	}
	public int findRecentPoint(String user_id) {
		int balance = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT balance FROM point WHERE user_id = ? AND pt_num = (SELECT MAX(pt_num) FROM point WHERE user_id = ?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) balance = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) close(pstmt);
			if(rs!=null) close(rs);
		}
		return balance;
	}
	public int userPlminusPoint(PointBean point) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		int balance = findRecentPoint(point.getUser_id());
		balance += point.getPlminus()*point.getPoint();
		String sql = "INSERT INTO point VALUES(null,?,?,?,?,?,?,now())";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, point.getUser_id());
			pstmt.setInt(2, point.getOrder_id());
			pstmt.setString(3, point.getState());
			pstmt.setInt(4, point.getPlminus());
			pstmt.setInt(5, point.getPoint());
			pstmt.setInt(6, balance);
			
			updateCount = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) close(pstmt);
		}
		return updateCount;
	}
	public int myPointListCount(String user_id, String startDate, String endDate) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select COUNT(*) from point where user_id = '"+user_id+"' AND pdate between '"+startDate+"' and '"+endDate+"'"; 
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) listCount = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return listCount;
	}
	public ArrayList<PointBean> myPointList(String user_id, String startDate, String endDate, int page) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<PointBean> myPointList = null;
		int startrow = (page-1)*10;
		String sql = "select * from point where user_id = '"+user_id+"' AND pdate between '"+startDate+"' and '"+endDate+"' order by pt_num desc limit ?,10"; 
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				myPointList = new ArrayList<PointBean>();
				do {
					myPointList.add(new PointBean(rs.getInt("pt_num"), rs.getString("user_id"), rs.getInt("order_id"),
							rs.getString("state"), rs.getInt("plminus"), rs.getInt("point"), rs.getInt("balance"),rs.getDate("pdate")));
				}while(rs.next());
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return myPointList;
	}
	public Map<String, Integer> orderPointMap(int order_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Map<String, Integer> orderPointMap = null;
		String sql = "select user_id, plminus, point from point where order_id = ?"; 
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, order_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				orderPointMap = new HashMap<String, Integer>(); 
				do {
					if(rs.getInt("plminus")>0) orderPointMap.put("save", rs.getInt("point"));
					else orderPointMap.put("use", rs.getInt("point"));
				}while(rs.next());
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return orderPointMap;
	}
}
