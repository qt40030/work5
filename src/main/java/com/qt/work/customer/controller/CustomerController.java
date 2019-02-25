package com.qt.work.customer.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.qt.work.customer.model.CustomerModel;
import com.qt.work.customer.service.CustomerService;

@Controller
@RequestMapping("/customerController")
public class CustomerController {

	@Autowired
	private CustomerService customeService;
	
	@RequestMapping("/select.do")
	@ResponseBody
	public String selectGoods(CustomerModel customerModel) {
		return customeService.select(customerModel);
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public String update(CustomerModel customerModel) {
		return customeService.update(customerModel);
	}
	
	@RequestMapping("/del.do")
	@ResponseBody
	public String del(CustomerModel customerModel) {
		return customeService.del(customerModel);
	}
	
	@RequestMapping("/insert.do")
	@ResponseBody
	public String insert(CustomerModel customerModel) {
		return customeService.insert(customerModel);
	}
}
