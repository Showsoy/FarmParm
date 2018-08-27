package vo;

import java.sql.Timestamp;

public class OrderBean {
	private final int order_id;
	private final String user_id;
	private final Timestamp dati;
	private String del_phone;
	private String del_mail;
	private String del_addr;
	private String del_postcode;
	private int depoint;
	private String state;
	private int pay;
	private String payment;
	private String receiver;
	private int parcel;

	public OrderBean(int order_id, String user_id, Timestamp dati, String del_phone, String del_mail, String del_addr, 
			String del_postcode, int depoint,
			String state, int pay, String payment, String receiver, int parcel) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.dati = dati;
		this.del_phone = del_phone;
		this.del_mail = del_mail;
		this.del_addr = del_addr;
		this.del_postcode = del_postcode;
		this.depoint = depoint;
		this.state = state;
		this.pay = pay;
		this.payment = payment;
		this.receiver = receiver;
		this.parcel = parcel;
	}
	
	public OrderBean(int order_id, String user_id, Timestamp dati, String state, int pay, String payment, String receiver) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.dati = dati;
		this.state = state;
		this.pay = pay;
		this.payment = payment;
		this.receiver = receiver;
	}
	
	public int getOrder_id() {
		return order_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public Timestamp getDati() {
		return dati;
	}
	
	public String getDel_phone() {
		return del_phone;
	}

	public void setDel_phone(String del_phone) {
		this.del_phone = del_phone;
	}

	public String getDel_mail() {
		return del_mail;
	}

	public void setDel_mail(String del_mail) {
		this.del_mail = del_mail;
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

	public int getParcel() {
		return parcel;
	}

	public void setParcel(int parcel) {
		this.parcel = parcel;
	}
}
