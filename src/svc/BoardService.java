package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import vo.BoardBean;

public class BoardService {
	public int selectNoticeCount() {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int listCount = boardDAO.selectNoticeCount();
		
		close(conn);
		return listCount;
	}
	public int searchNoticeCount(String keyword) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int listCount = boardDAO.searchNoticeCount(keyword);
		
		close(conn);
		return listCount;
	}
	public int selectListCount(String bName) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int listCount = boardDAO.selectListCount(bName);
		
		close(conn);
		return listCount;
	}
	public int searchListCount(String keyword) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int listCount = boardDAO.searchListCount(keyword);
		
		close(conn);
		return listCount;
	}
	public String selectWriter(String bName, int board_num) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		String writer = boardDAO.selectWriter(bName, board_num);
		
		close(conn);
		return writer;
	}
	public ArrayList<BoardBean> selectNoticeList(int page) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		ArrayList<BoardBean> articleList = boardDAO.selectNoticeList(page);
		
		close(conn);
		return articleList;
	}
	public ArrayList<BoardBean> searchNoticedList(String keyword, int page) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		ArrayList<BoardBean> articleList = boardDAO.searchNoticeList(keyword, page);
		
		close(conn);
		return articleList;
	}
	public ArrayList<BoardBean> selectCsBoardList(int page) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		ArrayList<BoardBean> articleList = boardDAO.selectCsBoardList(page);
		
		close(conn);
		return articleList;
	}
	public ArrayList<BoardBean> searchCsBoardList(String keyword, int page) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		ArrayList<BoardBean> articleList = boardDAO.searchCsBoardList(keyword, page);
		
		close(conn);
		return articleList;
	}
	public ArrayList<BoardBean> selectArticleList(String bName, int page) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		ArrayList<BoardBean> articleList = boardDAO.selectArticleList(bName, page);
		
		close(conn);
		return articleList;
	}
	public BoardBean selectNotice(int board_num) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		BoardBean board = boardDAO.selectNotice(board_num);
		
		close(conn);
		return board;
	}
	public BoardBean selectCsBoard(int board_num) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		BoardBean board = boardDAO.selectCsBoard(board_num);
		
		close(conn);
		return board;
	}
	public BoardBean selectArticle(String bName, int board_num) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		BoardBean board = boardDAO.selectArticle(bName, board_num);
		
		close(conn);
		return board;
	}
	public BoardBean selectReply(String bName, int bgroup) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		BoardBean board = boardDAO.selectReply(bName, bgroup);
		
		close(conn);
		return board;
	}
	public boolean writeNotice(BoardBean board) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		boolean isWriteSuccess = false;
		int insertCount = boardDAO.writeNotice(board);
		
		if(insertCount>0) {
			commit(conn);
			isWriteSuccess = true;
		}else {
			rollback(conn);
		}
		
		close(conn);
		return isWriteSuccess;
	}
	public boolean writeCsBoard(BoardBean board) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		boolean isWriteSuccess = false;
		int insertCount = boardDAO.writeCsBoard(board);
		
		if(insertCount>0) {
			commit(conn);
			isWriteSuccess = true;
		}else {
			rollback(conn);
		}
		
		close(conn);
		return isWriteSuccess;
	}
	// 상품문의 글 리스트
	public int qnaListCount() throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.qnaListCount();
		close(con);
		return listCount;
		
	}
	// 문의글 삭제
	public boolean deleteQnaArticle(String bnum) {
		boolean deleteResult = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int deleteCount = boardDAO.deleteQnaArticle(bnum);
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
	// 상품문의 글 리스트_2
	public ArrayList<BoardBean> qna_list(int page, int limit) throws Exception{
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		ArrayList<BoardBean> userList = boardDAO.qna_list(page,limit);
		close(con);
		return userList;
	}
	public boolean testReviewBoard(String item_code, String id) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		boolean result = boardDAO.testReviewBoard(item_code, id);
		
		close(conn);
		return result;
	}
	public boolean writeArticle(String bName, BoardBean board) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		boolean isWriteSuccess = false;
		int insertCount = boardDAO.writeArticle(bName, board);
		
		if(insertCount>0) {
			commit(conn);
			isWriteSuccess = true;
		}else {
			rollback(conn);
		}
		
		close(conn);
		return isWriteSuccess;
	}
	public boolean writeArticle1(String id, BoardBean board) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		boolean isWriteSuccess = false;
		int insertCount = boardDAO.writeArticle1(id, board);
		
		if(insertCount>0) {
			commit(conn);
			isWriteSuccess = true;
		}else {
			rollback(conn);
		}
		
		close(conn);
		return isWriteSuccess;
	}
	public int searchBNum(String bName) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int bnum = boardDAO.searchBNum(bName);
		
		close(conn);
		return bnum;
	}
	public int updateReadCount(int board_num) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int updateCount = boardDAO.updateReadCount(board_num);
		
		if(updateCount>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateCount;
	}
	public boolean replyCsBoard(BoardBean board) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		boolean isReplySuccess = false;
		int insertCount = boardDAO.replyCsBoard(board);
		
		if(insertCount>0) {
			commit(conn);
			isReplySuccess = true;
		}else {
			rollback(conn);
		}
		
		close(conn);
		return isReplySuccess;
	}
	public boolean replyArticle(String bName, BoardBean board) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		boolean isReplySuccess = false;
		int insertCount = boardDAO.replyArticle(bName, board);
		
		if(insertCount>0) {
			commit(conn);
			isReplySuccess = true;
		}else {
			rollback(conn);
		}
		
		close(conn);
		return isReplySuccess;
	}
	public boolean modifyNotice(BoardBean board) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		boolean isModifySuccess = false;
		int updateCount = boardDAO.modifyNotice(board);
		
		if(updateCount>0) {
			commit(conn);
			isModifySuccess = true;
		}else {
			rollback(conn);
		}
		close(conn);
		return isModifySuccess;
	}
	public int removeNotice(int board_num) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int deleteCount = boardDAO.removeNotice(board_num);
		if(deleteCount>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return deleteCount;
	}
	public int removeArticle(String bName, int board_num) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int deleteCount = boardDAO.removeArticle(bName, board_num);
		if(deleteCount>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return deleteCount;
	}
}
