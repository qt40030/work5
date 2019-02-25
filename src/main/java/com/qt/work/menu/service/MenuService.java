package com.qt.work.menu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qt.work.menu.mapper.MenuMapper;
import com.qt.work.menu.model.MenuModel;
import com.qt.work.rights.mapper.RightsMapper;
import com.qt.work.rights.model.RightsModel;
import com.qt.work.util.FormatEmpty;

@Service
public class MenuService {

	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private RightsMapper rightsMapper;
	
	public String selectMenu(MenuModel menuModel) {
		Map<String, Object>map=new HashMap<String,Object>();
		map.put("menu",menuMapper.select2(menuModel));
		map.put("count", menuMapper.selectCount(menuModel));
		return new JSONObject(map).toString();
	}
	
	public String update(MenuModel menuModel) {
		menuMapper.update(menuModel);
		return "1";
	}
	
	public String insert1(MenuModel menuModel) {
		List<MenuModel>list=menuMapper.select(menuModel);
		if(!FormatEmpty.isEmpty(list)) {
			return "2";
		}else {
			menuModel.setParent_code("0");
			menuMapper.insert(menuModel);
			return "1";
		}
	}
	
	public String insert2(MenuModel menuModel) {
		MenuModel mm=new MenuModel();
		mm.setMenu_code(menuModel.getMenu_code());
		List<MenuModel>list=menuMapper.select(mm);
		if(!FormatEmpty.isEmpty(list)) {
			return "2";
		}else {
			RightsModel rm=new RightsModel();
			rm.setRole_code("admin");
			rm.setMenu_code(menuModel.getMenu_code());
			rightsMapper.insert(rm);
			menuMapper.insert(menuModel);
			return "1";
		}
	}
	
	public String menu2(MenuModel menuModel) {
		menuModel.setParent_code("0");
		List<MenuModel>mm=menuMapper.select2(menuModel);
		HashMap<String,Object>map=new HashMap<>();
		map.put("menu",mm);
		map.put("count", menuMapper.selectCount(menuModel));
		return new JSONObject(map).toString();
	}
}
