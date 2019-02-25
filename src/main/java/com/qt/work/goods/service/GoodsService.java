package com.qt.work.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qt.work.goods.mapper.GoodsMapper;
import com.qt.work.goods.model.GoodsModel;
import com.qt.work.util.FormatEmpty;

@Service
public class GoodsService {

	@Autowired
	private GoodsMapper goodsMapper;
	
	public String select(GoodsModel goodsModel) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("goods", goodsMapper.select(goodsModel));
		map.put("count", goodsMapper.selectCount(goodsModel));
		return new JSONObject(map).toString();
	}
	
	public String update(GoodsModel goodsModel) {
		goodsMapper.updateActive(goodsModel);
		return "1";
	}
	
	public String del(GoodsModel goodsModel) {
		goodsMapper.delete(goodsModel);
		return "1";
	}
	
	public String insert(GoodsModel goodsModel) {
		GoodsModel gm=new GoodsModel();
		gm.setGoods_code(goodsModel.getGoods_code());
		List<GoodsModel>list=goodsMapper.select(gm);
		if(!FormatEmpty.isEmpty(list)) {
			return "2";
		}else {
			goodsMapper.insert(goodsModel);
			return "1";	
		}
	}
	
	public String charts(GoodsModel goodsModel) {
		List<GoodsModel> list = goodsMapper.select(goodsModel);
		String[] arry1 = new String[list.size()];
		Integer[] arry2 = new Integer[list.size()];
		for(int i=0;i<list.size();i++) {
			arry1[i]=list.get(i).getGoods_name();
			arry2[i]=list.get(i).getGoods_sum();
		}
		Map<String, Object> map = new HashMap<>();
		map.put("categories", arry1);
		map.put("data", arry2);
		return new JSONObject(map).toString();

	}
}
