package com.qt.work.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qt.work.menu.model.MenuModel;
import com.qt.work.user.service.UserService;

@Controller
@RequestMapping("/jump")
public class JumpController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/forgotpassword.do")
	public String forgotpassword() {
		return "forgot-password";
	}
	
	@RequestMapping("/create-account.do")
	public String createaccount() {
		return "create-account";
	}
	
	@RequestMapping("/index.do")
	public String index(MenuModel menuModel,Model model,HttpSession session) {
		menuModel.setUser_code(String.valueOf(session.getAttribute("usercode")));
		model.addAttribute("menu",userService.select2(menuModel));
		return "index";
	}
	
	@RequestMapping("/welcome.do")
	public String welcome() {
		return "welcome";
	}
	
	@RequestMapping("/articlelist.do")
	public String articlelist() {
		return "article-list";
	}
	@RequestMapping("/picturelist.do")
	public String picturelist() {
		return "picture-list";
	}
	@RequestMapping("/adminlist.do")
	public String adminlist() {
		return "admin-list";
	}
	@RequestMapping("/adminadd.do")
	public String adminadd() {
		return "admin-add";
	}
	@RequestMapping("/rights.do")
	public String rights() {
		return "rights-list";
	}
	
	@RequestMapping("/menulist.do")
	public String menu() {
		return "menu_list";
	}
	
	@RequestMapping("/menuadd1.do")
	public String menuadd1() {
		return "menuadd1";
	}
	
	@RequestMapping("/menuadd2.do")
	public String menuadd2() {
		return "menuadd2";
	}
	
	@RequestMapping("/goodslist.do")
	public String goodslist() {
		return "goods-list";
	}
	
	@RequestMapping("/goodsadd.do")
	public String goodsadd() {
		return "goods-add";
	}
	
	@RequestMapping("/customerlist.do")
	public String customerlist() {
		return "customer-list";
	}
	
	@RequestMapping("/customeradd.do")
	public String customeradd() {
		return "customer-add";
	}
	
	@RequestMapping("/custcommlist.do")
	public String custcommlist() {
		return "custcomm-list";
	}
	@RequestMapping("/custcommadd.do")
	public String custcommadd() {
		return "custcomm-add";
	}
	
	@RequestMapping("/orderlist.do")
	public String orderlist() {
		return "order-list";
	}
	
	@RequestMapping("/orderadd.do")
	public String orderadd() {
		return "order-add";
	}
	@RequestMapping("/charts.do")
	public String charts() {
		return "charts";
	}
	
	@RequestMapping("/pass.do")
	public String pass() {
		return "pass";
	}
	
	@RequestMapping("/rightsadd.do")
	public String rightsadd(MenuModel menuModel,Model model,HttpSession session) {
		menuModel.setUser_code(String.valueOf(session.getAttribute("usercode")));
		model.addAttribute("menu",userService.select2(menuModel));
		return "rights-add";
	}
}
