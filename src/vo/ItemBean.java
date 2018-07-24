package vo;

public class ItemBean {
	private String item_code;
	private String item_name;
	private int price;
	private String origin;
	private String category;
	private String img_path;
	private int sale;
	private String content;
	private int is_hot;

	public ItemBean(String item_code, String item_name, int price, String origin, String category, String img_path,
			int sale, String content, int is_hot) {
		super();
		this.item_code = item_code;
		this.item_name = item_name;
		this.price = price;
		this.origin = origin;
		this.category = category;
		this.img_path = img_path;
		this.sale = sale;
		this.content = content;
		this.is_hot = is_hot;
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
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
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
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getIs_hot() {
		return is_hot;
	}
	public void setIs_hot(int is_hot) {
		this.is_hot = is_hot;
	}
	
}
