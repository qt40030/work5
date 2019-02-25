package com.qt.work.custcomm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qt.work.custcomm.model.CustcommModel;
import com.qt.work.custcomm.service.CustcommService;
@Controller
@RequestMapping("/custcommController")
public class CustcommController {

	
	@Autowired
	private CustcommService custService;
	
	@RequestMapping("/select.do")
	@ResponseBody
	public String selectGoods(CustcommModel customerModel) {
		return custService.select(customerModel);
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public String update(CustcommModel customerModel) {
		return custService.update(customerModel);
	}
	
	@RequestMapping("/del.do")
	@ResponseBody
	public String del(CustcommModel customerModel) {
		return custService.del(customerModel);
	}
	
	@RequestMapping("/insert.do")
	@ResponseBody
	public String insert(CustcommModel customerModel) {
		return custService.insert(customerModel);
	}
}
