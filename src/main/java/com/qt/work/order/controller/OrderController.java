package com.qt.work.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.qt.work.order.model.OrderModel;
import com.qt.work.order.service.OrderService;
@Controller
@RequestMapping("/orderController")
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/select.do")
	@ResponseBody
	public String selectGoods(OrderModel customerModel) {
		return orderService.select(customerModel);
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public String update(OrderModel customerModel) {
		return orderService.update(customerModel);
	}
	
	@RequestMapping("/del.do")
	@ResponseBody
	public String del(OrderModel customerModel) {
		return orderService.del(customerModel);
	}
	
	@RequestMapping("/insert.do")
	@ResponseBody
	public String insert(OrderModel customerModel) {
		return orderService.insert(customerModel);
	}
}
