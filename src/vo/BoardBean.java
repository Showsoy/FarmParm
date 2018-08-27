package vo;

import java.sql.Date;

public class BoardBean {
	private final int board_num;
	private String code;
	private String user_id;
	private String content;
	private final String subject;
	private String img_path;
	private int has_re;
	private Date date;
	private int readcount;
	private int rgroup;
	private int rstep;
	
	public BoardBean(int board_num, String content, String subject, String img_path, Date date, int readcount) {
		this.board_num = board_num;
		this.content = content;
		this.subject = subject;
		this.img_path = img_path;
		this.date = date;
		this.readcount = readcount;
	}
	
	public BoardBean(int board_num, String code, String user_id, String content, String subject, int has_re, Date date) {
		this.board_num = board_num;
		this.code = code;
		this.user_id = user_id;
		this.content = content;
		this.subject = subject;
		this.has_re = has_re;
		this.date = date;
	}
	
	public BoardBean(int board_num, String code, String user_id, String content, String subject, int has_re, Date date, int readcount) {
		this.board_num = board_num;
		this.code = code;
		this.content = content;
		this.subject = subject;
		this.has_re = has_re;
		this.date = date;
		this.readcount = readcount;
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

	public int getBoard_num() {
		return board_num;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSubject() {
		return subject;
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
