package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static db.JdbcUtil.*;

import vo.ItemBean;
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

	public ArrayList<ItemViewBean> userItemList(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ItemViewBean> itemViewList = null;
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM items");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				itemViewList = new ArrayList<ItemViewBean>();
				do {
					itemViewList.add(new ItemViewBean(rs.getString("item_code"),rs.getString("category"),
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
					itemViewList.add(new ItemViewBean(rs.getString("item_code"),rs.getString("category"),
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
		PreparedStatement pstmt = null;
		int updateCount = 0;
		
		try {
			pstmt = conn.prepareStatement("DELETE FROM items WHERE item_code=?");
			pstmt.setString(1, item_code);
			
			updateCount = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return updateCount;
	}
	
	public int updateReadCount(String item_code) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "";
		
		try {
			sql = "UPDATE items SET readcount = readcount+1 WHERE item_code = ?";
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
		String sql = "";
		
		try {
			sql = "INSERT INTO Items VALUES(?,?,?,?,?,?,?,?,?)";
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
	public String makeItemCode(String category) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String item_code = category.substring(0,1);
		
		try {
			pstmt = conn.prepareStatement("SELECT item_code FROM items WHERE category = ?");
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			
			for(int i=1;i<1000;i++) {
				while(rs.next()) {
					if(i==Integer.parseInt(rs.getString("item_code").substring(1, 3)))
						continue;
					else {
						item_code = item_code+String.format("%03d", i);
						break;
					}
				}
				if(i==1) {
					item_code = item_code+"001";
				}else {
					item_code = "over";
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return item_code;
	}
}
