package vo;
import java.sql.Timestamp;

public class UserViewBean{
	
	private final String user_id;
	private final String grade;
	private final String tot_price;
	private final Timestamp edate;
	
	public UserViewBean(String user_id, String grade, String tot_price, Timestamp edate) {
		// TODO Auto-generated constructor stub
		this.user_id = user_id;
		this.grade = grade;
		this.tot_price = tot_price;
		this.edate = edate;
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
	
	public Timestamp getEdate() {
		return edate;
	}

}
