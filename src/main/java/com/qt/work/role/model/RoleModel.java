package com.qt.work.role.model;

public class RoleModel {

	private Integer id;
	private String role_code;
	private String role_name;
	private String role_sex;
	private String role_age;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRole_code() {
		return role_code;
	}
	public void setRole_code(String role_code) {
		this.role_code = role_code;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getRole_sex() {
		return role_sex;
	}
	public void setRole_sex(String role_sex) {
		this.role_sex = role_sex;
	}
	public String getRole_age() {
		return role_age;
	}
	public void setRole_age(String role_age) {
		this.role_age = role_age;
	}
	@Override
	public String toString() {
		return "RoleModel [id=" + id + ", role_code=" + role_code + ", role_name=" + role_name + ", role_sex="
				+ role_sex + ", role_age=" + role_age + "]";
	}
	
	
}
