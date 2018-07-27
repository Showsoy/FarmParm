package vo;

import java.sql.Date;

public class UserBean {
	private String user_id;
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
	private String grade;
	

	public UserBean(String user_id, String passwd, String name, String phone, Date birth, String gender,
			String postcode, String address, String address_second, String email, String email_ad, String grade) {
		super();
		this.user_id = user_id;
		this.passwd = passwd;
		this.name = name;
		this.phone = phone;
		this.birth = birth;
		this.gender = gender;
		this.postcode = postcode;
		this.address = address;
		this.address_second = address_second;
		this.email = email;
		this.email_ad = email_ad;
		this.grade = grade;
	}


	public UserBean() {
		// TODO Auto-generated constructor stub
	}


	public UserBean(String phone, Date birth, String gender, String postcode, String address,
			String address_second, String email, String email_ad, String user_id) {
		// TODO Auto-generated constructor stub
		this.phone = phone;
		this.birth = birth;
		this.gender = gender;
		this.postcode = postcode;
		this.address = address;
		this.address_second = address_second;
		this.email = email;
		this.email_ad = email_ad;
		this.user_id = user_id;
	}


	public UserBean(String passwd, String phone, Date birth, String gender, String postcode, String address,
			String address_second, String email, String email_ad, String user_id) {
		// TODO Auto-generated constructor stub
		this.passwd = passwd;
		this.phone = phone;
		this.birth = birth;
		this.gender = gender;
		this.postcode = postcode;
		this.address = address;
		this.address_second = address_second;
		this.email = email;
		this.email_ad = email_ad;
		this.user_id = user_id;
	}


	public UserBean(String passwd, String name, String phone, Date birth,String gender, String postcode,
			String address, String address_second, String email, String email_second, String grade,
		 String id) {
		// TODO Auto-generated constructor stub
		this.user_id = user_id;
		this.passwd = passwd;
		this.name = name;
		this.phone = phone;
		this.birth = birth;
		this.gender = gender;
		this.postcode = postcode;
		this.address = address;
		this.address_second = address_second;
		this.email = email;
		this.email_ad = email_ad;
		this.grade = grade;
	}


	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

}
