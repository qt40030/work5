package com.qt.work.rights.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qt.work.rights.model.RightsModel;
import com.qt.work.rights.service.RightsService;

@Controller
@RequestMapping("/rightsController")
public class RightsController {

	@Autowired
	private RightsService rightsService;
	
	@RequestMapping("/select.do")
	@ResponseBody
	private String select(RightsModel rightsModel){
		return rightsService.select(rightsModel);
	}
	
	@RequestMapping("/reg.do")
	@ResponseBody
	private String reg(RightsModel rightsModel,String[] aa){
		return rightsService.reg(rightsModel, aa);
	}
}
