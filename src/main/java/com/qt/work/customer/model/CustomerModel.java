package com.qt.work.customer.model;

public class CustomerModel {

	private Integer id;
	private String cust_code;
	private String cust_name;
	private String email;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCust_code() {
		return cust_code;
	}
	public void setCust_code(String cust_code) {
		this.cust_code = cust_code;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "CustomerModel [id=" + id + ", cust_code=" + cust_code + ", cust_name=" + cust_name + ", email=" + email
				+ "]";
	}
	
	
}
