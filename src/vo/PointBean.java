package vo;

import java.util.Date;

public class PointBean {
	private int pt_num;
	private final String user_id;
	private final int order_id;
	private String state;
	private int plminus;
	private int point;
	private int balance;
	private Date pdate;
	
	
	
	public PointBean(int pt_num, String user_id, int order_id, String state, int plminus, int point, int balance,
			Date pdate) {
		super();
		this.pt_num = pt_num;
		this.user_id = user_id;
		this.order_id = order_id;
		this.state = state;
		this.plminus = plminus;
		this.point = point;
		this.balance = balance;
		this.pdate = pdate;
	}

	public PointBean(String user_id, int order_id, String state, int plminus, int point) {
		super();
		this.user_id = user_id;
		this.order_id = order_id;
		this.state = state;
		this.plminus = plminus;
		this.point = point;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getPlminus() {
		return plminus;
	}

	public void setPlminus(int plminus) {
		this.plminus = plminus;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public int getPt_num() {
		return pt_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public Date getPdate() {
		return pdate;
	}


	
}
