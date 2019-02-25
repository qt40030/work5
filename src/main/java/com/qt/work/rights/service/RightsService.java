package com.qt.work.rights.service;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qt.work.rights.mapper.RightsMapper;
import com.qt.work.rights.model.RightsModel;
import com.qt.work.role.mapper.RoleMapper;
import com.qt.work.role.model.RoleModel;

@Service
public class RightsService {

	@Autowired
	private RightsMapper rightasMapper;
	@Autowired
	private RoleMapper roleMapper;

	public String select(RightsModel rightsModel) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("rights", rightasMapper.select(rightsModel));
		return new JSONObject(map).toString();
	}

	public String reg(RightsModel rightsModel, String[] aa) {
		RoleModel rml=new RoleModel();
		rml.setRole_code(rightsModel.getRole_code());
		List<RoleModel>list=roleMapper.select(rml);
		if(list.get(0).getRole_age().equals("0")){
			System.out.println(list.get(0).getRole_age());
			return "0";
		}else {
			for(String ss : aa) {
				RightsModel rm = new RightsModel();
				rm.setRole_code(rightsModel.getRole_code());
				rm.setMenu_code(ss);
				rightasMapper.delete(rm);	
			}
			for (String ss : aa) {
				RightsModel rm = new RightsModel();
				rm.setRole_code(rightsModel.getRole_code());
				rm.setMenu_code(ss);
				rightasMapper.insert(rm);
			}
			return "1";
		}
		

	}
}
