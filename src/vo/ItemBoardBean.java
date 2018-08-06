package vo;

import java.sql.Date;

public class ItemBoardBean {
	private String bnum;
	private String item_code;
	private String user_id;
	private String content;
	private String subject;
	private String img_path;
	private int has_re;
	private Date qdate;
	private int rgroup;
	private int rstep;
	

	public ItemBoardBean() {
		// TODO Auto-generated constructor stub
	}


	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public int getHas_re() {
		return has_re;
	}
	public void setHas_re(int has_re) {
		this.has_re = has_re;
	}
	public Date getQdate() {
		return qdate;
	}
	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}
	public int getRgroup() {
		return rgroup;
	}
	public void setRgroup(int rgroup) {
		this.rgroup = rgroup;
	}
	public int getRstep() {
		return rstep;
	}
	public void setRstep(int rstep) {
		this.rstep = rstep;
	}
	public String getBnum() {
		return bnum;
	}
	public void setBnum(String bnum) {
		this.bnum = bnum;
	}
	
}
