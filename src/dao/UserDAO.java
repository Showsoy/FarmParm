package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
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

	// 로그인
	public String selectLoginId(UserBean users){
		String loginId = null;
		String sql="SELECT user_id FROM users WHERE user_id=? AND passwd=?";
		
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, users.getUser_id());
			pstmt.setString(2, users.getPasswd());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				loginId = rs.getString("user_id");
			}
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return loginId;
	}
	
	// 회원가입
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
			pstmt.setString(11, users.getEmail_ad());
			pstmt.setString(12, users.getGrade()); // 회원등급 어디서 넘어오는지 아직 미지수.
			
			insertCount=pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(pstmt);
		}
		
		return insertCount;
	}
	
	// 회원관리
	public ArrayList<UserViewBean> users(){
		String sql="SELECT * FROM user_view";
		ArrayList<UserViewBean> userViewBean = new ArrayList<UserViewBean>();
		UserViewBean ub = null;
		
		try{
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				do{
					ub = new UserViewBean(
					rs.getString("user_id"),
					rs.getString("grade"),
					rs.getString("userpay")
					);
					userViewBean.add(ub);
				}while(rs.next());
			}
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		return userViewBean;
	}
	
	// 회원목록 전체목록 불러오기 (아직 쓰이는곳 없음..)
	public ArrayList<UserBean> selectUserList(){
		String sql="SELECT * FROM users";
		ArrayList<UserBean> userList = new ArrayList<UserBean>();
		UserBean ub = null;
		try{
			
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				do{
					ub = new UserBean(
					rs.getString("user_id"),
					rs.getString("passwd"),
					rs.getString("name"),
					rs.getString("phone"),
					rs.getDate("birth"),
					rs.getString("gender"),
					rs.getString("postcode"),
					rs.getString("address"),
					rs.getString("address_second"),
					rs.getString("email"),
					rs.getString("email_ad"),
					rs.getString("grade"));
					userList.add(ub);
				}while(rs.next());
			}
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		return userList;
	}
	// 회원정보 수정 form (관리자수정)
	public UserBean AdSelectUser(String user_id){
		String sql="SELECT * FROM users WHERE user_id=?";
		UserBean ub = null;
		try{
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				ub = new UserBean(
						rs.getString("user_id"),
						rs.getString("passwd"),
						rs.getString("name"),
						rs.getString("phone"),
						rs.getDate("birth"),
						rs.getString("gender"),
						rs.getString("postcode"),
						rs.getString("address"),
						rs.getString("address_second"),
						rs.getString("email"),
						rs.getString("email_ad"),
						rs.getString("grade"));
			}
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return ub;
	}
	
	// 회원정보 수정 (관리자수정)
	public int updateUserModify(UserBean users) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "";
		
		try {
			sql = "UPDATE users SET passwd=?,name=?,phone=?,birth=?,gender=?,postcode=?,address=?,address_second=?,email=?,email_ad=?,grade=? where user_id=?";
								
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, users.getPasswd());
			pstmt.setString(2, users.getName());
			pstmt.setString(3, users.getPhone());
			pstmt.setDate(4, users.getBirth());
			pstmt.setString(5, users.getGender());
			pstmt.setString(6, users.getPostcode());
			pstmt.setString(7, users.getAddress());
			pstmt.setString(8, users.getAddress_second());
			pstmt.setString(9, users.getEmail());
			pstmt.setString(10, users.getEmail_ad());
			pstmt.setString(11, users.getGrade());
			pstmt.setString(12, users.getUser_id());
			updateCount = pstmt.executeUpdate();
			
			System.out.println(users.getGrade() + " dao에서 등급값");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return updateCount;
	}
	
	// 마이페이지
	public UserBean selectUser(String user_id){
		String sql="SELECT * FROM users WHERE user_id=?";
		UserBean ub = null;
		try{
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				ub = new UserBean(
						rs.getString("user_id"),
						rs.getString("passwd"),
						rs.getString("name"),
						rs.getString("phone"),
						rs.getDate("birth"),
						rs.getString("gender"),
						rs.getString("postcode"),
						rs.getString("address"),
						rs.getString("address_second"),
						rs.getString("email"),
						rs.getString("email_ad"),
						rs.getString("grade"));
			}
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return ub;
	}
	
	// 개인정보 수정 비밀번호 확인절차
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
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return modifyPw;
	}
	// 개인정보수정
	public int updateMyModify(UserBean users) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "";
		
		try {
			sql = "UPDATE users SET phone=?,birth=?,gender=?,postcode=?,address=?,address_second=?,email=?,email_ad=? where user_id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, users.getPhone());
			pstmt.setDate(2, users.getBirth());
			pstmt.setString(3, users.getGender());
			pstmt.setString(4, users.getPostcode());
			pstmt.setString(5, users.getAddress());
			pstmt.setString(6, users.getAddress_second());
			pstmt.setString(7, users.getEmail());
			pstmt.setString(8, users.getEmail_ad());
			pstmt.setString(9, users.getUser_id());
			updateCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}
	
	// 비밀번호 수정
	public int updatePwModify(String user_id, String old_pswd, String new_pswd_re) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "";
		
		try {
			sql = "UPDATE users SET passwd=? where user_id=? and passwd=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, new_pswd_re);
			pstmt.setString(2, user_id);
			pstmt.setString(3, old_pswd);
			updateCount = pstmt.executeUpdate();
			
			System.out.println(updateCount + " 수정은 됨?");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}
			
	// 아이디 찾기
	public String findUserId(UserBean users){
		String findId = null;
		String sql="SELECT user_id FROM users WHERE name=? AND birth=?";
		
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, users.getName());
			pstmt.setDate(2, users.getBirth());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				findId = rs.getString("user_id");
			}
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return findId;
	}
	
	// 비밀번호 찾기
	public String findUserPw(UserBean users){
		String findPw = null;
		String sql="SELECT passwd FROM users WHERE user_id=? AND email=?";
		
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, users.getName());
			pstmt.setDate(2, users.getBirth());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				findPw = rs.getString("passwd");
			}
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return findPw;
	}
	
	// 회원정보삭제
	public int deleteUser(String user_id){
		String sql="DELETE users WHERE user_id=?";
		int deleteCount = 0;

		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			deleteCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("deleteMember 에러: " + ex);	
		}finally{
			close(pstmt);
		}
		
		return deleteCount;
	}
	

}
