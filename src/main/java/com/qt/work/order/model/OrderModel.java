package com.qt.work.order.model;

public class OrderModel {

	private Integer id;
	private String user_code;
	private String cust_code;
	private String goods_code;
	private Integer count;
	private String time;
	private String status;
	private String ordercode;
	
	public String getOrdercode() {
		return ordercode;
	}
	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
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
	public String getCust_code() {
		return cust_code;
	}
	public void setCust_code(String cust_code) {
		this.cust_code = cust_code;
	}
	public String getGoods_code() {
		return goods_code;
	}
	public void setGoods_code(String goods_code) {
		this.goods_code = goods_code;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "OrderModel [id=" + id + ", user_code=" + user_code + ", cust_code=" + cust_code + ", goods_code="
				+ goods_code + ", count=" + count + ", time=" + time + ", status=" + status + ", ordercode=" + ordercode
				+ "]";
	}

	
	
}
