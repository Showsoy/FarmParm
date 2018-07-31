package vo;

public class Cart {
	private String image;
	private String item_code;
	private String item_name;
	private int price;
	private int sprice;
	private int qty;
	
	
	
	public Cart(String image, String item_code, String item_name, int price, int sprice, int qty) {
		super();
		this.image = image;
		this.item_code = item_code;
		this.item_name = item_name;
		this.price = price;
		this.sprice = sprice;
		this.qty = qty;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
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
	public int getSprice() {
		return sprice;
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
}
