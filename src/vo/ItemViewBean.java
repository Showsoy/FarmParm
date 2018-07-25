package vo;

public class ItemViewBean {
	private String item_code;
	private String category;
	private String img_path;
	private String item_name;
	private int price;
	private int stock;
	private int readcount;
	private int purchase;
	
	public ItemViewBean(String item_code, String category, String img_path, String item_name, int price, int stock,
			int readcount, int purchase) {
		super();
		this.item_code = item_code;
		this.category = category;
		this.img_path = img_path;
		this.item_name = item_name;
		this.price = price;
		this.stock = stock;
		this.readcount = readcount;
		this.purchase = purchase;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
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
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getPurchase() {
		return purchase;
	}
	public void setPurchase(int purchase) {
		this.purchase = purchase;
	}
	
	
}
