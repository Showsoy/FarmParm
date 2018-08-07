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
				user = new UserBean(rs.getString("user_id"), "", rs.getString("name"), rs.getString("phone"), rs.getDate("birth"), rs.getString("gender"), rs.getString("postcode"), rs.getString("address"), rs.getString("address_second"), rs.getString("email"), rs.getString("grade"), "", rs.getInt("point"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
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
	
	// 로그인 시 salt값 불러옴
	public String selectLoginSalt(String id){
		String loginSalt = null;
		String sql="SELECT usalt FROM users WHERE user_id=?";
		
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				loginSalt = rs.getString("usalt");
			}
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		
		return loginSalt;
	}
	
	// 회원가입
	public int insertUser(UserBean users){
		String sql="INSERT INTO users VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
			pstmt.setString(11, users.getGrade()); // 회원등급 어디서 넘어오는지 아직 미지수.
			pstmt.setString(12, users.getUsalt());
			pstmt.setInt(13, 0);
			insertCount=pstmt.executeUpdate();
			
			System.out.println(insertCount + " :등록되나?");
			
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(pstmt);
		}
		
		return insertCount;
	}
	
	// 회원관리_1
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
		}catch(Exception ex){
			System.out.println("getListCount 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	
	// 회원관리_1_2(검색 내용 불러오기, id값 사용)
	public int getSearchList(String user_id) {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			pstmt=con.prepareStatement("select count(*) from user_view where=?");
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("getListCount 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	
	// 회원관리_1_3(검색 내용 불러오기, grade값 사용)
	public int getSearchList_2(String grade) {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			pstmt=con.prepareStatement("select count(*) from grade where=?");
			pstmt.setString(1, grade);
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("getListCount 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	
	// 회원관리_2
	public ArrayList<UserViewBean> users(int page,int limit){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user_list_sql="select * from user_view order by user_id asc limit ?,5";
		ArrayList<UserViewBean> articleList = new ArrayList<UserViewBean>();
		UserViewBean userList = null;
		int startrow=(page-1)*5; //읽기 시작할 row 번호..	

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

		}catch(Exception ex){
			System.out.println("에러 : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	
	// 회원정보 수정 form 에서 email값 받아오기 (관리자 수정)
	public String selectEmail(String id){
		String email = null;
		String sql="SELECT email FROM users WHERE user_id=?";
		
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				email = rs.getString("email");
			}
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return email;
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
						rs.getString("grade"),
						rs.getString("phone"),
						rs.getDate("birth"),
						rs.getString("gender"),
						rs.getString("email"),
						rs.getString("postcode"),
						rs.getString("address"),
						rs.getString("address_second"));
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
	public int updateUserModify(UserViewBean user) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "";
		
		try {
			sql = "UPDATE users SET name=?,grade=?,phone=?,birth=?,gender=?,email=?,postcode=?,address=?,address_second=? where user_id=?";
								
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
	
	// 개인정보수정 form
	public UserBean myModForm(String user_id){
		String sql="SELECT * FROM users WHERE user_id=?";
		UserBean ub = null;
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				ub = new UserBean(
						rs.getString("user_id"),
						rs.getString("name"),
						rs.getString("phone"),
						rs.getDate("birth"),
						rs.getString("gender"),
						rs.getString("email"),
						rs.getString("postcode"),
						rs.getString("address"),
						rs.getString("address_second"));
			}
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		
		return ub;
	}
	
	// 개인정보수정
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
	
	// 비밀번호 수정
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
	// 비밀번호 가져오기
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
	}catch(Exception ex){
		System.out.println(" 에러: " + ex);			
	}finally{
		close(rs);
		close(pstmt);
	}
	
	
	return pass;
}
			
	// 아이디 찾기
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
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		
		return findId;
	}
	
	// 비밀번호 찾기
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
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return email;
	}
	
	// 회원정보삭제
	public int deleteUser(String uid){
		String sql="DELETE from users WHERE user_id=?";
		int deleteCount = 0;

		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, uid);
			deleteCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("deleteMember 에러: " + ex);	
		}finally{
			close(pstmt);
		}
		
		return deleteCount;
	}
	
	// 회원관리에서 아이디로 검색하기
	public ArrayList<UserViewBean> searchId(int page,int limit, String search_id){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user_list_sql="SELECT * FROM user_view WHERE user_id LIKE '%?%' order by user_id asc limit ?,5";
		// SELECT * FROM user_view WHERE user_id LIKE '%?%' order by user_id asc limit ?,5
		//select * from user_view where user_id=? order by user_id asc limit ?,5
		ArrayList<UserViewBean> articleList = new ArrayList<UserViewBean>();
		UserViewBean userList = null;
		int startrow=(page-1)*5; //읽기 시작할 row 번호..	

		try{
			pstmt = con.prepareStatement(user_list_sql);
			pstmt.setString(1, search_id);
			pstmt.setInt(2, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				userList = new UserViewBean(
				rs.getString("user_id"),
				rs.getString("grade"),
				rs.getString("userpay"));
				
				articleList.add(userList);
			}

		}catch(Exception ex){
			System.out.println("에러 : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

			System.out.println(search_id);
		return articleList;

	}

	// 회원관리에서 등급으로 검색하기
	public ArrayList<UserViewBean> searchGrade(int page,int limit, String grade){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user_list_sql="select * from user_view where grade=? order by user_id asc limit ?,5 ";
		ArrayList<UserViewBean> articleList = new ArrayList<UserViewBean>();
		UserViewBean userList = null;
		int startrow=(page-1)*5; //읽기 시작할 row 번호..	

		try{
			pstmt = con.prepareStatement(user_list_sql);
			pstmt.setString(1, grade);
			pstmt.setInt(2, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				userList = new UserViewBean(
				rs.getString("user_id"),
				rs.getString("grade"),
				rs.getString("userpay"));
				
				articleList.add(userList);	
			}

		}catch(Exception ex){
			System.out.println("에러 : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}
	
	

}
