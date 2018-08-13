package vo;

import java.util.Date;

public class OrderViewBean {
	private int order_id;
	private String item_code;
	private String item_name;
	private int price;
	private int amount;
	private Date dati;
	
	public OrderViewBean(int order_id, String item_code, String item_name, int price, int amount, Date dati) {
		super();
		this.order_id = order_id;
		this.item_code = item_code;
		this.item_name = item_name;
		this.price = price;
		this.amount = amount;
		this.dati = dati;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getDati() {
		return dati;
	}
	public void setDati(Date dati) {
		this.dati = dati;
	}
}
