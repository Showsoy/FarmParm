package svc;

import vo.UserBean;
import vo.UserViewBean;
import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import dao.BoardDAO;
import dao.UserDAO;

public class UserService {
	
	// 로그인
	public boolean login(UserBean users) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		boolean loginResult = false;
		String loginId = userDAO.selectLoginId(users);
		
		if(loginId != null){
			loginResult = true;
		}
		close(con);
		return loginResult;
	}
	
	// 로그인시 salt값 받아오기
	public String salt(String id) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		String loginSalt = userDAO.selectLoginSalt(id);
		
		close(con);
		return loginSalt;
		
	}
	
	
	// 회원가입
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
	
	// 회원 수 불러오기
	public int getListCount() throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		listCount = userDAO.selectListCount();
		close(con);
		return listCount;
		
	}
	
	// 회원관리
	public ArrayList<UserViewBean> userList(int page, int limit) throws Exception{
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		ArrayList<UserViewBean> userList = userDAO.users(page,limit);
		close(con);
		return userList;
	}
	
	// 회원정보 수정 form 에서 email값 받아오기 (관리자 수정)
	public String email(String id) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		String loginSalt = userDAO.selectEmail(id);
		close(con);
		
		return loginSalt;
		
	}
	
	// 회원정보 수정 form (관리자 수정)
	public UserBean modifyUserForm(String user_id) {
		UserDAO userDAO = UserDAO.getInstance();
		Connection con = getConnection();
		userDAO.setConnection(con);
		UserBean user = userDAO.AdSelectUser(user_id);
		close(con);
		return user;
	}
	
	// 회원정보 수정 (관리자 수정)
	public boolean modifyUsers(UserViewBean user) {
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
	
	// 마이페이지
	public UserBean myPage(String user_id) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		UserBean user = userDAO.selectUser(user_id);
		close(con);
		return user;
	}
	
	// 개인정보 수정 비밀번호 확인절차
	public boolean myPwCheck(String users, String pw) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		boolean modifyPw = false;
		boolean loginPw = userDAO.modifyPwCheck(users,pw);
		if(loginPw){
			modifyPw = true;
		}
		close(con);
		return modifyPw;
	}
	
	// 개인정보수정 form
	public UserBean myModForm(String ub) {
		UserDAO userDAO = UserDAO.getInstance();
		Connection con = getConnection();
		userDAO.setConnection(con);
		UserBean user = userDAO.myModForm(ub);
		close(con);
		return user;
	}
	
	// 개인정보수정
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
	
	// 비밀번호수정
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
	
	//비밀번호 가져오기
	public String passwd(String id) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		String pass = userDAO.selectPass(id);
		close(con);
		
		return pass;
	}
	
	// 아이디찾기
	public String findId(String name, Date birth){
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		String loginId = userDAO.findUserId(name,birth);

		close(con);
		
		return loginId;
	}
	
	// 비밀번호찾기
	public String findPw(String user_id) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		String email = userDAO.findUserPw(user_id);
		close(con);
		
		return email;
	}
	
	// 회원정보삭제
	public boolean deleteMember(String uid) {
		boolean deleteResult = false;
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		int deleteCount = userDAO.deleteUser(uid);
		if(deleteCount > 0){
			commit(con);
			deleteResult = true;
		}
		else{
			rollback(con);
		}
		close(con);
		return deleteResult;
	}
	
}
