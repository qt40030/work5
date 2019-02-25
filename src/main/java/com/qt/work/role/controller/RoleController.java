package com.qt.work.role.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qt.work.role.service.RoleService;

@Controller
@RequestMapping("/roleController")
public class RoleController {
	@Autowired
	private RoleService roleService;
}
