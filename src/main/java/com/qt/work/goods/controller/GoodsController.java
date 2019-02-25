package com.qt.work.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qt.work.goods.model.GoodsModel;
import com.qt.work.goods.service.GoodsService;

@Controller
@RequestMapping("/goodsController")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("/selectGoods.do")
	@ResponseBody
	public String selectGoods(GoodsModel goodsModel) {
		return goodsService.select(goodsModel);
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public String update(GoodsModel goodsModel) {
		return goodsService.update(goodsModel);
	}
	
	@RequestMapping("/del.do")
	@ResponseBody
	public String del(GoodsModel goodsModel) {
		return goodsService.del(goodsModel);
	}
	
	@RequestMapping("/insert.do")
	@ResponseBody
	public String insert(GoodsModel goodsModel) {
		return goodsService.insert(goodsModel);
	}
	
	@RequestMapping("/charts.do")
	@ResponseBody
	public String charts(GoodsModel goodsModel) {
		return goodsService.charts(goodsModel);
	}
}
