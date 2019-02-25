package com.qt.work.order.mapper;

import java.util.List;

import com.qt.work.order.model.OrderModel;

public interface OrderMapper {

	  int insert(OrderModel t);

	    int delete(OrderModel t);

	    int deleteModel(OrderModel t);

	    int update(OrderModel t);

	    int updateActive(OrderModel t);

	    OrderModel selectId(Object id);

	    List<OrderModel> selectAll(OrderModel t);

	    List<OrderModel> select(OrderModel t);

	    int selectCount(OrderModel t);
}
