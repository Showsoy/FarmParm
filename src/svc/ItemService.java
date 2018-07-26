package svc;
import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import vo.ItemBean;
import vo.ItemStockBean;
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
	public boolean enrollItemStock(ItemStockBean itemS) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		boolean isEnrollSuccess = false;
		int insertCount = itemDAO.enrollItemStock(itemS);
		
		if(insertCount>0) {
			commit(conn);
			isEnrollSuccess = true;
		}else {
			rollback(conn);
		}
		
		close(conn);
		return isEnrollSuccess;
	}
	public ItemBean getItem(String item_code) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		ItemBean item = itemDAO.selectItem(item_code);
		
		close(conn);
		return item;
	}
	public ArrayList<ItemStockBean> getItemStockList(String item_code,int i_page) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		ArrayList<ItemStockBean> itemStockList = itemDAO.itemStockList(item_code, i_page);
		
		close(conn);
		return itemStockList;
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
		
		close(conn);
		return listCount;
	}
	public int itemListCountIn(String category) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		int listCount = itemDAO.itemListCountIn(category);
		
		close(conn);
		return listCount;
	}
	public int itemStockCount(String item_code) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		int listCount = itemDAO.itemStockCount(item_code);
		
		close(conn);
		return listCount;
	}
	public ArrayList<ItemViewBean> adminItemList(int page) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		ArrayList<ItemViewBean> itemList = itemDAO.adminItemList(page);
		
		close(conn);
		return itemList;
	}
	public ArrayList<ItemViewBean> adminItemListIn(String category, int page) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		ArrayList<ItemViewBean> itemList = itemDAO.adminItemListIn(category, page);
		
		close(conn);
		return itemList;
	}
	public ArrayList<ItemBean> searchItem(String keyword){
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		ArrayList<ItemBean> iSearchList = itemDAO.itemSearch(keyword);
		
		close(conn);
		return iSearchList;
	}
	public int itemEnter(ItemStockBean itemStock, String item_code) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		int insertCount = itemDAO.insertItemStock(itemStock, item_code);

		if(insertCount>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return insertCount;
	}
	public String makeItemCode(String category) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		String item_code = itemDAO.makeItemCode(category);
		
		close(conn);
		return item_code;
	}
	public int deleteItem(String item_code) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		int deleteCount = itemDAO.deleteItem(item_code);
		if(deleteCount>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return deleteCount;
	}
}
