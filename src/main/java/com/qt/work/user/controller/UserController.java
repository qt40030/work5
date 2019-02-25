package com.qt.work.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qt.work.user.model.UserModel;
import com.qt.work.user.service.UserService;
import com.qt.work.util.FormatEmpty;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("/login.do")
	@ResponseBody
	public String login(UserModel userModel,HttpSession session) {
		List<UserModel> list = userService.select(userModel);
            if (!FormatEmpty.isEmpty(list)) {
			session.setAttribute("username", list.get(0).getUser_name());
			session.setAttribute("usercode", list.get(0).getUser_code());
			return "1";
		} else {
			return "2";
		}
	}
	@RequestMapping("/selectUser.do")
	@ResponseBody
	public String selectUser(UserModel userModel) {
		return userService.selectUser(userModel);
	}
	@RequestMapping("/regUser.do")
	@ResponseBody
	public String regUser(UserModel userModel) {
		return userService.reg(userModel);
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public String update(UserModel userModel,HttpSession session) {
		return userService.update(userModel, session);
	}
	
	@RequestMapping("/del.do")
	@ResponseBody
	public String del(UserModel userModel) {
		return userService.del(userModel);
	}
	
	@RequestMapping("/sel.do")
	@ResponseBody
	public String sel(UserModel userModel) {
		return userService.sel(userModel);
	}
	
	@Autowired
	JavaMailSender jms;
	
	@RequestMapping("/send.do")
	@ResponseBody
	public String send(UserModel userModel,HttpSession session){
		//建立邮件消息
		SimpleMailMessage mainMessage = new SimpleMailMessage();
		//发送者
		mainMessage.setFrom("1175940030@qq.com");
		//接收者
		mainMessage.setTo(userModel.getUser_code());
		//发送的标题
		mainMessage.setSubject("验证码");
		//发送的内容
		mainMessage.setText("1175");
		jms.send(mainMessage);
		session.setAttribute("user", userModel.getUser_code());
		session.setAttribute("code","1175");
		return "1";
	}
	@RequestMapping("/update2.do")
	@ResponseBody
	public String update2(UserModel userModel,HttpSession session) {
		return userService.update2(userModel, session);
	}
}
