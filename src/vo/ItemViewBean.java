package vo;

import java.sql.Date;

public class ItemViewBean {
	private Date vdate;
	private String item_code;
	private String category;
	private String img_path;
	private String item_name;
	private int price;
	private int sale;
	private int stock;
	private int readcount;
	private int purchase;
	private int ihide;
	
	public ItemViewBean(Date vdate, String item_code, String category, String img_path, String item_name, int price, 
			int sale, int stock, int readcount, int purchase, int ihide) {
		super();
		this.vdate = vdate;
		this.item_code = item_code;
		this.category = category;
		this.img_path = img_path;
		this.item_name = item_name;
		this.price = price;
		this.sale = sale;
		this.stock = stock;
		this.readcount = readcount;
		this.purchase = purchase;
		this.ihide = ihide;
	}
	public Date getVdate() {
		return vdate;
	}
	public void setVdate(Date vdate) {
		this.vdate = vdate;
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
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
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
	public int getIhide() {
		return ihide;
	}
	public void setIhide(int ihide) {
		this.ihide = ihide;
	}
}
