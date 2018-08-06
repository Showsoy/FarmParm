package vo;

import java.sql.Date;

public class OrderBean {
	private int order_id;
	private String user_id;
	private Date dati;
	private String del_addr;
	private String del_postcode;
	private int depoint;
	private String state;
	private int pay;
	private String payment;
	private String receiver;

	public OrderBean(int order_id, String user_id, Date dati, String del_addr, String del_postcode, int depoint,
			String state, int pay, String payment, String receiver) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.dati = dati;
		this.del_addr = del_addr;
		this.del_postcode = del_postcode;
		this.depoint = depoint;
		this.state = state;
		this.pay = pay;
		this.payment = payment;
		this.receiver = receiver;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getDati() {
		return dati;
	}

	public void setDati(Date dati) {
		this.dati = dati;
	}

	public String getDel_addr() {
		return del_addr;
	}

	public void setDel_addr(String del_addr) {
		this.del_addr = del_addr;
	}

	public String getDel_postcode() {
		return del_postcode;
	}

	public void setDel_postcode(String del_postcode) {
		this.del_postcode = del_postcode;
	}

	public int getDepoint() {
		return depoint;
	}

	public void setDepoint(int depoint) {
		this.depoint = depoint;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
}
