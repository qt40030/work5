package com.qt.work.user.model;

import com.qt.work.util.Pager;

public class UserModel extends Pager {
private Integer id;
private String user_code;//账号
private String user_pass;//密码
private String user_name;//姓名
private String role_code;//权限
private String parent_code;//上级
private String role_name;//角色
private String role_sex;
private String role_age;//状态
private String code;

public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
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
public String getUser_pass() {
	return user_pass;
}
public void setUser_pass(String user_pass) {
	this.user_pass = user_pass;
}
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
public String getRole_code() {
	return role_code;
}
public void setRole_code(String role_code) {
	this.role_code = role_code;
}
public String getParent_code() {
	return parent_code;
}
public void setParent_code(String parent_code) {
	this.parent_code = parent_code;
}
@Override
public String toString() {
	return "UserModel [id=" + id + ", user_code=" + user_code + ", user_pass=" + user_pass + ", user_name=" + user_name
			+ ", role_code=" + role_code + ", parent_code=" + parent_code + ", role_name=" + role_name + ", role_sex="
			+ role_sex + ", role_age=" + role_age + "]";
}
}
