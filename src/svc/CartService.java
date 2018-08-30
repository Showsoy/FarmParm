package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.ItemDAO;
import vo.Cart;
import vo.ItemBean;

public class CartService {
	
	public ItemBean getCartItem(String item_code) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection conn = getConnection();
		itemDAO.setConnection(conn);
		ItemBean item = itemDAO.selectItem(item_code);
		close(conn);
		return item;
	}
	
	public void addCart(HttpServletRequest request, ItemBean cartItem, int qty) {

		HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cartList");
		 
		if(cartList == null) {
			cartList = new ArrayList<Cart>();
			session.setAttribute("cartList", cartList);
		}
		
		boolean isNewCart = true;
		
		for(int i=0;i<cartList.size();i++) {
			if(cartItem.getItem_code().equals(cartList.get(i).getItem_code())) {
				isNewCart = false;
				cartList.get(i).setQty(cartList.get(i).getQty()+1);
				break;
			}
		}
		if(isNewCart) {
			int salePrice = cartItem.getPrice() * (100-cartItem.getSale())/100;
			Cart cart = new Cart(cartItem.getImg_path(), cartItem.getItem_code(), 
					cartItem.getItem_name(), cartItem.getPrice(), salePrice, qty);
			cartList.add(cart);
		}
	}
	public ArrayList<Cart> getCartList(HttpServletRequest request){
		HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cartList");
		if(cartList == null) {
			cartList = new ArrayList<Cart>();
			session.setAttribute("cartList", cartList);
		}
		return cartList;
	}
	public void changeCartQty(HttpServletRequest request, String item_code, int qty) {
		HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cartList");
		System.out.println(item_code);
		for(int i=0;i<cartList.size();i++) {
			if(cartList.get(i).getItem_code().equals(item_code)) {
				System.out.println("일치");
				cartList.get(i).setQty(qty);
				System.out.println(cartList.get(i).getQty());
			}
		}
	}
	public void cartRemove(HttpServletRequest request, String[] codeArray) {
		HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cartList");
		
		for(int i=0;i<codeArray.length;i++) {
			for(int j=0;j<cartList.size();j++) {
				if(cartList.get(j).getItem_code().equals(codeArray[i])) {
					cartList.remove(cartList.get(j));
				}
			}
		}
	}
	public void cartRemove(HttpServletRequest request, String item_code) {
		HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");

		for (int j = 0; j < cartList.size(); j++) {
			if (cartList.get(j).getItem_code().equals(item_code)) {
				cartList.remove(cartList.get(j));
			}
		}
	}
	//서비스는 있지만 미구현.
	public ArrayList<Cart> getCartSearchList(int start_money,int end_money, HttpServletRequest request){
		HttpSession session = request.getSession();
		ArrayList<Cart> oldCartList = (ArrayList<Cart>)session.getAttribute("cartList");
		ArrayList<Cart> cartList = new ArrayList<Cart>();
		
		for(int i = 0;i<oldCartList.size();i++) {
			if(oldCartList.get(i).getPrice()>=start_money&&
					oldCartList.get(i).getPrice()<=end_money) {
				cartList.add(oldCartList.get(i));
			}
		}
		
		return cartList;
	}
}
