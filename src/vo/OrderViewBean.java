package vo;

public class OrderViewBean {
	private int order_id;
	private String item_name;
	private int price;
	private int amount;
	
	public OrderViewBean(int order_id, String item_name, int price, int amount) {
		super();
		this.order_id = order_id;
		this.item_name = item_name;
		this.price = price;
		this.amount = amount;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
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
	
	
}
