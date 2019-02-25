package com.qt.work.goods.model;

public class GoodsModel {
private Integer id;
private String goods_code;
private String goods_name;
private Integer goods_sum;
private String goods_cost;
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getGoods_code() {
	return goods_code;
}
public void setGoods_code(String goods_code) {
	this.goods_code = goods_code;
}
public String getGoods_name() {
	return goods_name;
}
public void setGoods_name(String goods_name) {
	this.goods_name = goods_name;
}
public Integer getGoods_sum() {
	return goods_sum;
}
public void setGoods_sum(Integer goods_sum) {
	this.goods_sum = goods_sum;
}
public String getGoods_cost() {
	return goods_cost;
}
public void setGoods_cost(String goods_cost) {
	this.goods_cost = goods_cost;
}
@Override
public String toString() {
	return "GoodsModel [id=" + id + ", goods_code=" + goods_code + ", goods_name=" + goods_name + ", goods_sum="
			+ goods_sum + ", goods_cost=" + goods_cost + "]";
}


}
