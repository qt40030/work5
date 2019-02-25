package com.qt.work.menu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qt.work.menu.model.MenuModel;
import com.qt.work.menu.service.MenuService;

@Controller
@RequestMapping("/menuController")
public class MenuController {

	@Autowired
	private MenuService menuService;
	
	
	@RequestMapping("/selectMenu.do")
	@ResponseBody
	public String selectMenu(MenuModel menuModel) {
		return menuService.selectMenu(menuModel);
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public String update(MenuModel menuModel) {
		return menuService.update(menuModel);
	}
	
	@RequestMapping("/insert1.do")
	@ResponseBody
	public String insert1(MenuModel menuModel) {
		return menuService.insert1(menuModel);
	}
	
	@RequestMapping("/insert2.do")
	@ResponseBody
	public String insert2(MenuModel menuModel) {
		return menuService.insert2(menuModel);
	}
	
	@RequestMapping("/menu2.do")
	@ResponseBody
	public String menu2(MenuModel menuModel) {
		return menuService.menu2(menuModel);
	}
}
