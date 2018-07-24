package svc;
import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import vo.ItemBean;
import vo.ItemViewBean;
import dao.ItemDAO;

public class ItemService {
	public boolean registItem(ItemBean item) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		boolean isRegistSuccess = false;
		int insertCount = itemDAO.insertItem(item);
		
		if(insertCount>0) {
			commit(conn);
			isRegistSuccess = true;
		}else {
			rollback(conn);
		}
		
		close(conn);
		return isRegistSuccess;
	}
	public ItemBean getItem(String item_code) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		ItemBean item = itemDAO.selectItem(item_code);
		
		return item;
	}
	public boolean updateItem(ItemBean item, String item_code) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		boolean isModifySuccess = false;
		int updateCount = itemDAO.updateItem(item, item_code);
		
		if(updateCount>0) {
			commit(conn);
			isModifySuccess = true;
		}else {
			rollback(conn);
		}
		close(conn);
		return isModifySuccess;
	}
	public int itemListCount() {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		int listCount = itemDAO.itemListCount();
		
		return listCount;
	}
	public ArrayList<ItemViewBean> adminItemList(int page) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		ArrayList<ItemViewBean> itemList = itemDAO.adminItemList(page);
		
		return itemList;
	}
}
