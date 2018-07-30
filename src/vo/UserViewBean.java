package vo;

import java.sql.Date;

public class UserViewBean{
	
	private String user_id;
	private String grade;
	private String tot_price;
	private String passwd;
	private String name;
	private String phone;
	private Date birth;
	private String gender;
	private String postcode;
	private String address;
	private String address_second;
	private String email;
	private String email_ad;
	
	public UserViewBean(String user_id, String grade, String tot_price) {
		// TODO Auto-generated constructor stub
		this.user_id = user_id;
		this.grade = grade;
		this.tot_price = tot_price;
	}
	
	public UserViewBean(String passwd, String name, String grade, String phone, Date birth, String gender, 
			String email, String email_ad, String postcode,
			String address, String address_second, 
			 String user_id){
			// TODO Auto-generated constructor stub
			this.passwd = passwd;
			this.name = name;
			this.grade = grade;
			this.phone = phone;
			this.birth = birth;
			this.gender = gender;
			this.email = email;
			this.email_ad = email_ad;
			this.postcode = postcode;
			this.address = address;
			this.address_second = address_second;
			this.user_id = user_id;
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

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress_second() {
		return address_second;
	}

	public void setAddress_second(String address_second) {
		this.address_second = address_second;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail_ad() {
		return email_ad;
	}

	public void setEmail_ad(String email_ad) {
		this.email_ad = email_ad;
	}

	
	
	

}
