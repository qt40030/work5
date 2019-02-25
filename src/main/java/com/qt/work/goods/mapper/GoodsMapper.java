package com.qt.work.goods.mapper;

import java.util.List;

import com.qt.work.goods.model.GoodsModel;

public interface GoodsMapper {
	  int insert(GoodsModel t);

	    int delete(GoodsModel t);

	    int deleteModel(GoodsModel t);

	    int update(GoodsModel t);

	    int updateActive(GoodsModel t);

	    GoodsModel selectId(Object id);

	    List<GoodsModel> selectAll(GoodsModel t);

	    List<GoodsModel> select(GoodsModel t);

	    int selectCount(GoodsModel t);
}
