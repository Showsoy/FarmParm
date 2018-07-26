package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static db.JdbcUtil.*;

import vo.ItemBean;
import vo.ItemStockBean;
import vo.ItemViewBean;

public class ItemDAO {
	Connection conn;
	private static ItemDAO itemsDAO;
	
	private ItemDAO() {
		
	}
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public static ItemDAO getInstance() {
		if(itemsDAO==null) {
			itemsDAO = new ItemDAO();
		}
		return itemsDAO;
	}
	//인기많은순 - readcount desc 판매량순 - purchase desc 신상품순 - vdate desc 낮은가격순 - price asc, 높은 가격순 - price desc,  
	public ArrayList<ItemViewBean> userItemList(int page, String category, String standard){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ItemViewBean> itemViewList = null;
		int startrow = (page-1)*10;
		String sql = "";
		
		try {
			if(standard.equals("low")) {
				sql = "SELECT * FROM item_view WHERE category = ? ORDER BY ? ASC LIMIT ?,9";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,category);
				pstmt.setString(2,standard);
				pstmt.setInt(3, startrow);
			}else {
				sql = "SELECT * FROM item_view WHERE category = ? ORDER BY ? DESC LIMIT ?,9";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,category);
				pstmt.setString(2,standard);
				pstmt.setInt(3, startrow);
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				itemViewList = new ArrayList<ItemViewBean>();
				do {
					itemViewList.add(new ItemViewBean(rs.getDate("vdate"), rs.getString("item_code"),rs.getString("category"),
							rs.getString("img_path"),rs.getString("item_name"),rs.getInt("price"),
							rs.getInt("stock"),rs.getInt("readcount"), rs.getInt("purchase")));
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return itemViewList;
	}
	public ArrayList<ItemViewBean> adminItemList(int page){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ItemViewBean> itemViewList = null;
		int startrow = (page-1)*10;
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM item_view LIMIT ?,10");
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				itemViewList = new ArrayList<ItemViewBean>();
				do {
					itemViewList.add(new ItemViewBean(rs.getDate("vdate"), rs.getString("item_code"),rs.getString("category"),
							rs.getString("img_path"),rs.getString("item_name"),rs.getInt("price"),
							rs.getInt("stock"),rs.getInt("readcount"), rs.getInt("purchase")));
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return itemViewList;
	}
	public ArrayList<ItemViewBean> adminItemListIn(String category, int page){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ItemViewBean> itemViewList = null;
		int startrow = (page-1)*10;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM item_view WHERE category = ? LIMIT ?,10");
			pstmt.setString(1, category);
			pstmt.setInt(2, startrow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				itemViewList = new ArrayList<ItemViewBean>();
				do {
					itemViewList.add(new ItemViewBean(rs.getDate("vdate"), rs.getString("item_code"),rs.getString("category"),
							rs.getString("img_path"),rs.getString("item_name"),rs.getInt("price"),
							rs.getInt("stock"),rs.getInt("readcount"), rs.getInt("purchase")));
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return itemViewList;
	}
	public int itemListCount(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		
		try {
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM item_view");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}
	public int itemListCountIn(String category){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		try {
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM item_view WHERE category = ?");
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}
	public int itemStockCount(String item_code){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		
		try {
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM item_stock WHERE item_code = ?");
			pstmt.setString(1, item_code);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}
	public ItemBean selectItem(String item_code) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ItemBean item = null;
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM items WHERE item_code=?");
			pstmt.setString(1, item_code);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				item = new ItemBean(rs.getString("item_code"),rs.getString("item_name"),rs.getInt("price"),
						rs.getString("origin"),rs.getString("category"),rs.getString("img_path"),rs.getInt("sale"),
						rs.getString("content"),rs.getInt("readcount"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return item;
	}
	public ArrayList<ItemStockBean> itemStockList(String item_code,int i_page) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ItemStockBean> itemStockList = null;
		int startrow = (i_page-1)*10;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM item_stock WHERE item_code=? LIMIT ?,10");
			pstmt.setString(1, item_code);
			pstmt.setInt(2, startrow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				itemStockList = new ArrayList<ItemStockBean>();
				do {
					itemStockList.add(new ItemStockBean(rs.getString("item_code"),
							rs.getString("state"),rs.getDate("idate"),rs.getInt("amount"),
							rs.getInt("stock"),rs.getInt("inumber")));
				}while(rs.next());
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return itemStockList;
	}
	public int updateItem(ItemBean item, String item_code) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "UPDATE items SET item_name=?, price=?, origin=?, category=?,"
				+ "img_path=?, sale=?, content=?, readcount=? WHERE item_code=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, item.getItem_name());
			pstmt.setInt(2, item.getPrice());
			pstmt.setString(3, item.getOrigin());
			pstmt.setString(4, item.getCategory());
			pstmt.setString(5, item.getImg_path());
			pstmt.setInt(6, item.getSale());
			pstmt.setString(7, item.getContent());
			pstmt.setInt(8, item.getReadcount());
			pstmt.setString(9, item_code);
			
			updateCount = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return updateCount;
	}
	
	public int deleteItem(String item_code) {
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		
		int updateCount = 0;
		
		try {
			pstmt1 = conn.prepareStatement("DELETE FROM items WHERE item_code=?");
			pstmt1.setString(1, item_code);
			pstmt2 = conn.prepareStatement("UPDATE item_stock SET item_code = 'null' WHERE item_code=?");
			pstmt2.setString(1, item_code);
			
			updateCount = pstmt1.executeUpdate()+pstmt2.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt1);
			close(pstmt2);
		}
		
		return updateCount;
	}
	
	public int updateReadCount(String item_code) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "UPDATE items SET readcount = readcount+1 WHERE item_code = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, item_code);
			updateCount = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return updateCount;
	}
	
	public int insertItem(ItemBean item) {
		PreparedStatement pstmt = null;
		int insertCount = 0;
		String sql = "INSERT INTO items VALUES(?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, item.getItem_code());
			pstmt.setString(2, item.getItem_name());
			pstmt.setInt(3, item.getPrice());
			pstmt.setString(4, item.getOrigin());
			pstmt.setString(5, item.getCategory());
			pstmt.setString(6, item.getImg_path());
			pstmt.setInt(7, item.getSale());
			pstmt.setString(8, item.getContent());
			pstmt.setInt(9, item.getReadcount());
			insertCount = pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return insertCount;
	}
	public int enrollItemStock(ItemStockBean itemS) {
		PreparedStatement pstmt = null;
		int insertCount = 0;
		String sql = "INSERT INTO item_stock VALUES(?,?,now(),?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, itemS.getItem_code());
			pstmt.setString(2, itemS.getState());
			pstmt.setInt(3, itemS.getAmount());
			pstmt.setInt(4, itemS.getStock());
			pstmt.setString(5, null);
			insertCount = pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return insertCount;
	}
	public String makeItemCode(String category) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String item_code = "V";
		if(category.equals("과일")) {
			item_code = "F";
		}else if(category.equals("곡류")) {
			item_code = "G";
		}else if(category.equals("차")) {
			item_code = "T";
		}else if(category.equals("가공")) {
			item_code = "M";
		}
		
		try {
			pstmt = conn.prepareStatement("SELECT item_code FROM items WHERE category = ? ORDER BY item_code ASC");
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			ArrayList<Integer> arry = new ArrayList<Integer>();
			boolean flag = false;
			while(rs.next()) {
				arry.add(Integer.parseInt(rs.getString("item_code").substring(1)));
			}
			System.out.println(arry.size());
			if (arry.size() > 0) {
				for (int i = 1; i <= arry.get(arry.size() - 1); i++) {
					for (int j = i - 1; j < arry.size(); j++) {
						System.out.println(i+","+arry.get(j));
						if (i == arry.get(j)) {
							System.out.println("같다.b");
							break;
						} else if(i != arry.get(j)) {
							System.out.println("다르다.b");
							flag = true;
							break;
						}
					}
					if(i==arry.get(arry.size()-1)) {
						System.out.println("생성1");
						item_code = item_code + String.format("%03d", i+1);
					}else {
						if (!flag) {
							System.out.println("다시.C");
						}
						else {
							System.out.println("생성2");
							item_code = item_code + String.format("%03d", i);
							break;
						}
					}
				}
			} else {
				item_code += "001";
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return item_code;
	}
	public ArrayList<ItemBean> itemSearch(String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ItemBean> iSearchList = null;
		String sql = "SELECT * FROM items WHERE item_name LIKE '%"+keyword+"%' OR category LIKE '%"+keyword+"%'"
				+" OR origin LIKE '%"+keyword+"%'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				iSearchList = new ArrayList<ItemBean>();
				do {
					iSearchList.add(new ItemBean(rs.getString("item_code"),rs.getString("item_name"),rs.getInt("price"),
							rs.getString("origin"),rs.getString("category"),rs.getString("img_path"),rs.getInt("sale"),
							rs.getString("content"),rs.getInt("readcount")));
				}while(rs.next());
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return iSearchList;
	}
	public int insertItemStock(ItemStockBean itemStock, String item_code) {
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		int insertCount = 0;
		int oldStock = 0;
		int inumber = 0;
		String sql1 = "SELECT stock, max(inumber) FROM item_stock WHERE item_code = ? ORDER BY inumber DESC LIMIT 1";
		String sql2 = "INSERT INTO item_stock VALUES(?,?,?,?,?,?)";
		
		try {
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setString(1, item_code);
			rs = pstmt1.executeQuery();

			if(rs.next()) {
				oldStock = rs.getInt(1);
				inumber = rs.getInt(2)+1;
			}
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, itemStock.getItem_code());
			pstmt2.setString(2, itemStock.getState());
			pstmt2.setDate(3, itemStock.getIdate());
			pstmt2.setInt(4, itemStock.getAmount());
			pstmt2.setInt(5, oldStock+itemStock.getAmount());
			pstmt2.setInt(6, inumber);
			insertCount = pstmt2.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt1);
			close(pstmt2);
			close(rs);
		}
		return insertCount;
	}
}
