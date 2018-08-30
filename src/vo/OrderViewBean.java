package vo;

import java.util.Date;

public class OrderViewBean {
	private int order_id;
	private final String item_code;
	private final String item_name;
	private int price;
	private int amount;
	private Date dati;
	private int profit;
	private int sales;
	
	public OrderViewBean(String item_code, String item_name, int price, int amount) {
		this.item_code = item_code;
		this.item_name = item_name;
		this.price = price;
		this.amount = amount;
	}
	public OrderViewBean(int order_id, String item_code, String item_name, int price, int amount, Date dati) {
		super();
		this.order_id = order_id;
		this.item_code = item_code;
		this.item_name = item_name;
		this.price = price;
		this.amount = amount;
		this.dati = dati;
	}
	public OrderViewBean(int order_id, String item_code, String item_name, int price, int amount, Date dati, int profit,
			int sales) {
		super();
		this.order_id = order_id;
		this.item_code = item_code;
		this.item_name = item_name;
		this.price = price;
		this.amount = amount;
		this.dati = dati;
		this.profit = profit;
		this.sales = sales;
	}

	public int getOrder_id() {
		return order_id;
	}
	public String getItem_code() {
		return item_code;
	}
	public String getItem_name() {
		return item_name;
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
	public int getProfit() {
		return profit;
	}
	public void setProfit(int profit) {
		this.profit = profit;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	
}
