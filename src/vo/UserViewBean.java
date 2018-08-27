package vo;

public class UserViewBean{
	
	private final String user_id;
	private final String grade;
	private final String tot_price;
	
	public UserViewBean(String user_id, String grade, String tot_price) {
		// TODO Auto-generated constructor stub
		this.user_id = user_id;
		this.grade = grade;
		this.tot_price = tot_price;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getGrade() {
		return grade;
	}

	public String getTot_price() {
		return tot_price;
	}

}
