package com.qt.work.custcomm.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qt.work.custcomm.mapper.CustcommMapper;
import com.qt.work.custcomm.model.CustcommModel;

@Service
public class CustcommService {

	@Autowired
	private CustcommMapper custMapper;
	
	public String select(CustcommModel custModel) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cust", custMapper.select(custModel));
		map.put("count", custMapper.selectCount(custModel));
		return new JSONObject(map).toString();
	}
	
	public String update(CustcommModel custModel) {
		custMapper.updateActive(custModel);
		return "1";
	}
	
	public String del(CustcommModel custModel) {
		custMapper.delete(custModel);
		return "1";
	}
	
	public String insert(CustcommModel custModel) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
	      String date=df.format(new Date()).toString();
		  custModel.setTime(date);
		  custModel.setTime(date);
		  custModel.setType("1");
		custMapper.insert(custModel);
			return "1";	

	}
}
