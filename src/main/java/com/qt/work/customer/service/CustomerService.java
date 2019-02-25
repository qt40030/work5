package com.qt.work.customer.service;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qt.work.customer.mapper.CustomerMapper;
import com.qt.work.customer.model.CustomerModel;
import com.qt.work.util.FormatEmpty;
@Service
public class CustomerService {

	@Autowired
	private CustomerMapper customerMapper;
	
	public String select(CustomerModel customerModel) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cust", customerMapper.select(customerModel));
		map.put("count", customerMapper.selectCount(customerModel));
		return new JSONObject(map).toString();
	}
	
	public String update(CustomerModel customerModel) {
		customerMapper.updateActive(customerModel);
		return "1";
	}
	
	public String del(CustomerModel customerModel) {
		customerMapper.delete(customerModel);
		return "1";
	}
	
	public String insert(CustomerModel customerModel) {
		CustomerModel gm=new CustomerModel();
		gm.setCust_code(customerModel.getCust_code());
		List<CustomerModel>list=customerMapper.select(gm);
		if(!FormatEmpty.isEmpty(list)) {
			return "2";
		}else {
			customerMapper.insert(customerModel);
			return "1";	
		}
	}
}
