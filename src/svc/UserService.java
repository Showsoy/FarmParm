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
	
	public boolean userIdTest(String id) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		boolean result = userDAO.userIdTest(id);
		
		close(con);
		return result;
	}
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
	public ArrayList<UserViewBean> userList(int page) throws Exception{
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		ArrayList<UserViewBean> userList = userDAO.users(page);
		
		close(con);
		return userList;
	}
	public String email(String id) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		String loginSalt = userDAO.selectEmail(id);
		
		close(con);
		return loginSalt;
	}
	public UserBean modifyUserForm(String user_id) {
		UserDAO userDAO = UserDAO.getInstance();
		Connection con = getConnection();
		userDAO.setConnection(con);
		UserBean user = userDAO.AdSelectUser(user_id);
		
		close(con);
		return user;
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
	public UserBean myPage(String user_id) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		UserBean user = userDAO.selectUser(user_id);
		
		close(con);
		return user;
	}
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
	public UserBean myModForm(String ub) {
		UserDAO userDAO = UserDAO.getInstance();
		Connection con = getConnection();
		userDAO.setConnection(con);
		UserBean user = userDAO.myModForm(ub);
		
		close(con);
		return user;
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
	public String passwd(String id) {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		String pass = userDAO.selectPass(id);
		
		close(con);
		return pass;
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
	public ArrayList<UserViewBean> searchId(int page, String search_id) throws Exception{
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		ArrayList<UserViewBean> userList = userDAO.searchId(page, search_id);
		
		close(con);
		return userList;
	}
	public ArrayList<UserViewBean> getGradeList(int page, String grade) throws Exception{
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		ArrayList<UserViewBean> userList = userDAO.getGradeList(page, grade);
		
		close(con);
		return userList;
	}
	public ArrayList<UserViewBean> getPurchList(int page) throws Exception{
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		ArrayList<UserViewBean> userList = userDAO.getPurchList(page);
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
	public int userDeductPoint(String id, int depoint) {
		Connection conn = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(conn);
		int updateCount = userDAO.userDeductPoint(id, depoint);
		if(updateCount > 0){
			commit(conn);
		}
		else{
			rollback(conn);
		}
		close(conn);
		return updateCount;
	}
	public int userPlusPoint(String id, int point) {
		Connection conn = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(conn);
		int updateCount = userDAO.userPlusPoint(id, point);
		if(updateCount > 0){
			commit(conn);
		}
		else{
			rollback(conn);
		}
		close(conn);
		return updateCount;
	}
}
