package vo;

import java.sql.Date;

public class BoardBean {
	private int board_num;
	private String code;
	private String user_id;
	private String content;
	private String subject;
	private String img_path;
	private int has_re;
	private Date date;
	private int readcount;
	private int rgroup;
	private int rstep;
	
	public BoardBean(int board_num, int rgroup, int rstep, String subject, String content, String user_id, String img_path, int has_re, Date date) {
		// TODO Auto-generated constructor stub
		this.board_num = board_num;
		this.rgroup = rgroup;
		this.rstep = rstep;
		this.subject = subject;
		this.content = content;
		this.user_id = user_id;
		this.img_path = img_path;
		this.has_re = has_re;
		this.date = date;
	}
	
	public BoardBean(int board_num, String code, String user_id, String content, String subject, String img_path,
			int has_re, Date date, int readcount, int rgroup, int rstep) {
		super();
		this.board_num = board_num;
		this.code = code;
		this.user_id = user_id;
		this.content = content;
		this.subject = subject;
		this.img_path = img_path;
		this.has_re = has_re;
		this.date = date;
		this.readcount = readcount;
		this.rgroup = rgroup;
		this.rstep = rstep;
	}
	
	
	public BoardBean() {
		// TODO Auto-generated constructor stub
	}

	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
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
	
}
