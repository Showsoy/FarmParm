package vo;

public class OrderItemBean {
	private String item_code;
	private int order_id;
	private int amount;
	private int price;
	
	
	public OrderItemBean(String item_code, int order_id, int amount, int price) {
		super();
		this.item_code = item_code;
		this.order_id = order_id;
		this.amount = amount;
		this.price = price;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
