package vo;

public class UserViewBean{
	
	private String user_id;
	private String grade;
	private String tot_price;
	
	public UserViewBean(String user_id, String grade, String tot_price) {
		// TODO Auto-generated constructor stub
		this.user_id = user_id;
		this.grade = grade;
		this.tot_price = tot_price;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getTot_price() {
		return tot_price;
	}

	public void setTot_price(String tot_price) {
		this.tot_price = tot_price;
	}

}
