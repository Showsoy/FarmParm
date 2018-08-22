package svc;
import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import dao.ItemDAO;
import vo.ItemBean;
import vo.ItemStockBean;
import vo.ItemViewBean;
import vo.OrderViewBean;

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
	public ItemBean getItemWithStock(String item_code) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		ItemBean item = itemDAO.selectItemWithStock(item_code);
		
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
		int updateCount2 = 0;
		if(updateCount>0) {
			if(!item.getItem_code().equals(item_code)) {
				updateCount2 = itemDAO.updateItemStock(item_code, item.getItem_code());
				if(updateCount2>0) {
					commit(conn);
					isModifySuccess = true;
				}
			}else {
				commit(conn);
				isModifySuccess = true;
			}
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
	public HashMap<String, Integer> findRecentStock(String item_code){
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		HashMap<String, Integer> imap = itemDAO.findRecentStock(item_code);
		
		close(conn);
		return imap;
	}
	public int findItemStock(String item_code){
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		int stock = itemDAO.findItemStock(item_code);
		
		close(conn);
		return stock;
	}
	public int itemStockInOut(ItemStockBean itemStock, HashMap<String, Integer> imap) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		int insertCount = itemDAO.itemStockInOut(itemStock, imap);

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
	public int iSearchStockCount(String startDate, String endDate) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		int listCount = itemDAO.iSearchStockCount(startDate, endDate);
		
		close(conn);
		return listCount;
	}
	public ArrayList<ItemViewBean> iSearchStockList(String startDate, String endDate, int page) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		ArrayList<ItemViewBean> itemList = itemDAO.iSearchStockList(startDate, endDate, page);
		
		close(conn);
		return itemList;
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
	public int hideItem(String item_code) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		int updateCount = itemDAO.hideItem(item_code);
		
		if(updateCount>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateCount;
	}
	public int unhideItem(String item_code) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		int updateCount = itemDAO.unhideItem(item_code);
		
		if(updateCount>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateCount;
	}
	public int updateReadCount(String item_code) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		int updateCount = itemDAO.updateReadCount(item_code);
		
		if(updateCount>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateCount;
	}
	public ArrayList<ItemViewBean> userItemList(int page, String category, String standard) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		ArrayList<ItemViewBean> itemList = itemDAO.userItemList(page,category,standard);
		
		close(conn);
		return itemList;
	}
	public ArrayList<ItemViewBean> bestItemList(int limit) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		ArrayList<ItemViewBean> itemList = itemDAO.bestItemList(limit);
		
		close(conn);
		return itemList;
	}
	public ArrayList<ItemViewBean> newItemList(int limit) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		ArrayList<ItemViewBean> itemList = itemDAO.newItemList(limit);
		
		close(conn);
		return itemList;
	}
	public int takeOrderItem(ArrayList<OrderViewBean> orderList) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		int insertCount = itemDAO.takeOrderItem(orderList);

		if(insertCount>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return insertCount;
	}
}
