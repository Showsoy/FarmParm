package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import dao.UserDAO;
import vo.BoardBean;
import vo.PointBean;

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
	public int selectListCount(String bName, String item_code) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int listCount = boardDAO.selectListCount(bName, item_code);
		
		close(conn);
		return listCount;
	}
	public int searchListCount(String category, String keyword) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int listCount = boardDAO.searchListCount(category, keyword);
		
		close(conn);
		return listCount;
	}
	public int searchReviewCount(String keyword,String review_search) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int listCount = boardDAO.searchReviewCount(keyword, review_search);
		
		close(conn);
		return listCount;
	}
	public int searchQnACount(String keyword, String qna_search) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int listCount = boardDAO.searchQnACount(keyword, qna_search);
		
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
	public ArrayList<BoardBean> searchCsBoardList(String category, String keyword, int page) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		ArrayList<BoardBean> articleList = boardDAO.searchCsBoardList(category, keyword, page);
		
		close(conn);
		return articleList;
	}
	public ArrayList<BoardBean> selectReviewList(int page, String item_code) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		ArrayList<BoardBean> articleList = boardDAO.selectReviewList(page, item_code);
		
		close(conn);
		return articleList;
	}
	public ArrayList<BoardBean> selectReviewList(int page) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		ArrayList<BoardBean> articleList = boardDAO.selectReviewList(page);
		
		close(conn);
		return articleList;
	}
	public ArrayList<BoardBean> selectQnAList(int page, String item_code, String user_id) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		ArrayList<BoardBean> articleList = boardDAO.selectQnAList(page, item_code, user_id);
		
		close(conn);
		return articleList;
	}
	public ArrayList<BoardBean> selectQnAList(int page) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		ArrayList<BoardBean> articleList = boardDAO.selectQnAList(page);
		close(conn);
		return articleList;
	}
	public int myQnaListCount(String bName, String id) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int listCount = boardDAO.myQnaListCount(bName, id);
		close(conn);
		return listCount;
	}
	public ArrayList<BoardBean> myQnAList(int page, String id) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		ArrayList<BoardBean> articleList = boardDAO.myQnAList(page, id);
		
		close(conn);
		return articleList;
	}
	public ArrayList<BoardBean> searchReviewList(String keyword, int page, String review_search) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		ArrayList<BoardBean> articleList = boardDAO.searchReviewList(keyword, page, review_search);
		
		close(conn);
		return articleList;
	}
	public ArrayList<BoardBean> searchQnAList(String keyword, int page, String qna_search) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		ArrayList<BoardBean> articleList = boardDAO.searchQnAList(keyword, page, qna_search);
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
	public BoardBean selectArticle(String bName, String item_code, int board_num) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		BoardBean board = boardDAO.selectArticle(bName, item_code, board_num);
		
		close(conn);
		return board;
	}
	public BoardBean selectReply(int bgroup) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		BoardBean board = boardDAO.selectReply(bgroup);
		
		close(conn);
		return board;
	}
	public BoardBean selectReply(String bName, int bgroup, String item_code) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		BoardBean board = boardDAO.selectReply(bName, bgroup, item_code);
		
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
	public boolean testReviewBoard(String item_code, String id, int order_id) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		boolean result = boardDAO.testReviewBoard(item_code, id, order_id);
		
		close(conn);
		return result;
	}
	public int testReviewBoard(String item_code, String id) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int result = 0;
		OrderService orderService = new OrderService();
		ArrayList<Integer> od_result = orderService.orderIdList(item_code, id);
		if(od_result==null) result = -1;//구매내역없음
		else {
			result = boardDAO.findOrderId(od_result, item_code, id);
			//0이면 더 이상 쓸 수 있는 주문 없음, 1 이상이면 주문 아이디.
		}
		
		close(conn);
		return result;
	}
	public boolean writeReview(BoardBean board, PointBean point) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		boolean isWriteSuccess = false;
		int insertCount = boardDAO.writeReview(board);
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(conn);
		int updateCount = userDAO.userPlminusPoint(point);
		
		if(insertCount>0&&updateCount>0) {
			commit(conn);
			isWriteSuccess = true;
		}else {
			rollback(conn);
		}
		
		close(conn);
		return isWriteSuccess;
	}
	public boolean writeQnA(BoardBean board) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		boolean isWriteSuccess = false;
		int insertCount = boardDAO.writeQnA(board);
		
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
	public int searchBNum(String bName, String item_code) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int bnum = boardDAO.searchBNum(bName, item_code);
		
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
	public boolean replyReview(BoardBean board) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		boolean isReplySuccess = false;
		int insertCount = boardDAO.replyReview(board);
		
		if(insertCount>0) {
			commit(conn);
			isReplySuccess = true;
		}else {
			rollback(conn);
		}
		
		close(conn);
		return isReplySuccess;
	}
	public boolean replyQnA(BoardBean board) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		boolean isReplySuccess = false;
		int insertCount = boardDAO.replyQnA(board);
		
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
	public int removeCsBoard(int board_num) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int deleteCount = boardDAO.removeCsBoard(board_num);
		if(deleteCount>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return deleteCount;
	}
	public int removeArticle(String bName, int board_num, String item_code) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		int deleteCount = boardDAO.removeArticle(bName, board_num, item_code);
		if(deleteCount>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return deleteCount;
	}
	public boolean hasReply(String bName, String item_code, int board_num) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		boolean result = boardDAO.hasReply(bName, item_code, board_num);
		
		close(conn);
		return result;
	}
	public String findItemName(String item_code) {
		BoardDAO boardDAO = BoardDAO.getInstance();
		Connection conn = getConnection();
		boardDAO.setConnection(conn);
		String item_name = boardDAO.findItemName(item_code);
		
		close(conn);
		return item_name;
	}
}
