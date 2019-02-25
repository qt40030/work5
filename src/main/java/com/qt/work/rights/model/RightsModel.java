package com.qt.work.rights.model;

public class RightsModel {
private Integer id;
private String role_code;
private String menu_code;
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
public String getMenu_code() {
	return menu_code;
}
public void setMenu_code(String menu_code) {
	this.menu_code = menu_code;
}
@Override
public String toString() {
	return "RightsModel [id=" + id + ", role_code=" + role_code + ", menu_code=" + menu_code + "]";
}
}
