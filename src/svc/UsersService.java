package svc;

import vo.UserBean;
import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.UsersDAO;

public class UsersService {
	
	// 로그인
	public boolean login(UserBean users) {
		Connection con = getConnection();
		UsersDAO usersDAO = UsersDAO.getInstance();
		usersDAO.setConnection(con);
		boolean loginResult = false;
		String loginId = usersDAO.selectLoginId(users);
		if(loginId != null){
			loginResult = true;
		}
		close(con);
		return loginResult;
	}
	
	
	// 회원가입
	public boolean joinUser(UserBean users) {
		boolean joinSuccess = false;
		UsersDAO usersDAO = UsersDAO.getInstance();
		Connection con = getConnection();
		usersDAO.setConnection(con);
		int insertCount = usersDAO.insertUser(users);
		if(insertCount>0) {
			joinSuccess = true;
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return joinSuccess;
	}
	
	// 회원관리 *뷰페이지 없음
	public ArrayList<UserBean> userList() {
		Connection con = getConnection();
		UsersDAO usersDAO = UsersDAO.getInstance();
		usersDAO.setConnection(con);
		ArrayList<UserBean> userList = usersDAO.users();
		close(con);
		return userList;
	}
	
	// 회원정보 수정 form (관리자 수정)
	public UserBean modifyUserForm(String user_id) {
		UsersDAO usersDAO = UsersDAO.getInstance();
		Connection con = getConnection();
		usersDAO.setConnection(con);
		UserBean user = usersDAO.selectUser(user_id);
		close(con);
		return user;
	}
	
	// 회원정보 수정 (관리자 수정)
	public boolean modifyUsers(UserBean users) {
		UsersDAO usersDAO = UsersDAO.getInstance();
		Connection con = getConnection();
		usersDAO.setConnection(con);		
		boolean isModifySuccess = false;
		int insertCount = usersDAO.updateUserModify(users);
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
		UsersDAO usersDAO = UsersDAO.getInstance();
		usersDAO.setConnection(con);
		UserBean user = usersDAO.selectUser(user_id);
		close(con);
		return user;
	}
	
	// 개인정보 수정 비밀번호 확인절차
	public boolean myPwCheck(UserBean users) {
		Connection con = getConnection();
		UsersDAO usersDAO = UsersDAO.getInstance();
		usersDAO.setConnection(con);
		boolean modifyPw = false;
		String loginId = usersDAO.modifyPwCheck(users);
		if(loginId != null){
			modifyPw = true;
		}
		close(con);
		return modifyPw;
	}
	
	// 개인정보수정
	public boolean modifyMy(UserBean users) {
		UsersDAO usersDAO = UsersDAO.getInstance();
		Connection con = getConnection();
		usersDAO.setConnection(con);		
		boolean isModifySuccess = false;
		int insertCount = usersDAO.updateMyModify(users);
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
	public boolean modifyPw(UserBean users) {
		UsersDAO usersDAO = UsersDAO.getInstance();
		Connection con = getConnection();
		usersDAO.setConnection(con);		
		boolean isModifySuccess = false;
		int insertCount = usersDAO.updatePwModify(users);
		if(insertCount>0){
			commit(con);
			isModifySuccess=true;
		}else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
	}
	
	// 아이디찾기
	public boolean findId(UserBean users) {
		Connection con = getConnection();
		UsersDAO usersDAO = UsersDAO.getInstance();
		usersDAO.setConnection(con);
		boolean findResult = false;
		String loginId = usersDAO.findUserId(users);
		if(loginId != null){
			findResult = true;
		}
		close(con);
		return findResult;
	}
	
	// 비밀번호찾기
	public boolean findPw(UserBean users) {
		Connection con = getConnection();
		UsersDAO usersDAO = UsersDAO.getInstance();
		usersDAO.setConnection(con);
		boolean findResult = false;
		String loginPw = usersDAO.findUserPw(users);
		if(loginPw != null){
			findResult = true;
		}
		close(con);
		return findResult;
	}
	
	// 회원정보삭제
	public boolean deleteMember(String user_id) {
		boolean deleteResult = false;
		Connection con = getConnection();
		UsersDAO usersDAO = UsersDAO.getInstance();
		usersDAO.setConnection(con);
		int deleteCount = usersDAO.deleteUser(user_id);
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
