package com.qt.work.custcomm.model;

public class CustcommModel {

	private Integer id;
	private String user_code;
	private String cust_code;
	private String time;
	private String type;
	private String content;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUser_code() {
		return user_code;
	}
	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}
	public String getCust_code() {
		return cust_code;
	}
	public void setCust_code(String cust_code) {
		this.cust_code = cust_code;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "CustcommModel [id=" + id + ", user_code=" + user_code + ", cust_code=" + cust_code + ", time=" + time
				+ ", type=" + type + ", content=" + content + "]";
	}
}
