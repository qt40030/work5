package com.qt.work.order.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qt.work.order.mapper.OrderMapper;
import com.qt.work.order.model.OrderModel;

@Service
public class OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	public String select(OrderModel orderModel) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cust", orderMapper.select(orderModel));
		map.put("count", orderMapper.selectCount(orderModel));
		return new JSONObject(map).toString();
	}
	
	public String update(OrderModel custModel) {
		orderMapper.updateActive(custModel);
		return "1";
	}
	
	public String del(OrderModel custModel) {
		orderMapper.delete(custModel);
		return "1";
	}
	
	public String insert(OrderModel custModel) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
	      String date=df.format(new Date()).toString();
		  custModel.setTime(date);
		  custModel.setTime(date);
		  String ordercode=UUID.randomUUID().toString();
		  custModel.setOrdercode(ordercode);
		  orderMapper.insert(custModel);
			return "1";	

	}
}
