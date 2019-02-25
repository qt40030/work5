package com.qt.work.menu.model;

import java.util.List;

import com.qt.work.util.Pager;

public class MenuModel extends Pager  {
private Integer id;
private String menu_code;
private String menu_name;
private String menu_url;
private String parent_code;
private String level;
private String orderBy;
private String user_code;
private List<MenuModel> list;


public List<MenuModel> getList() {
	return list;
}
public void setList(List<MenuModel> list) {
	this.list = list;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getMenu_code() {
	return menu_code;
}
public void setMenu_code(String menu_code) {
	this.menu_code = menu_code;
}
public String getMenu_name() {
	return menu_name;
}
public void setMenu_name(String menu_name) {
	this.menu_name = menu_name;
}
public String getMenu_url() {
	return menu_url;
}
public void setMenu_url(String menu_url) {
	this.menu_url = menu_url;
}
public String getParent_code() {
	return parent_code;
}
public void setParent_code(String parent_code) {
	this.parent_code = parent_code;
}
public String getLevel() {
	return level;
}
public void setLevel(String level) {
	this.level = level;
}
public String getOrderBy() {
	return orderBy;
}
public void setOrderBy(String orderBy) {
	this.orderBy = orderBy;
}

public String getUser_code() {
	return user_code;
}
public void setUser_code(String user_code) {
	this.user_code = user_code;
}
@Override
public String toString() {
	return "MenuModel [id=" + id + ", menu_code=" + menu_code + ", menu_name=" + menu_name + ", menu_url=" + menu_url
			+ ", parent_code=" + parent_code + ", level=" + level + ", orderBy=" + orderBy + ", user_code=" + user_code
			+ "]";
}


}
