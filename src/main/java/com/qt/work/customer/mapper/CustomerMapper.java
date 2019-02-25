package com.qt.work.customer.mapper;

import java.util.List;

import com.qt.work.customer.model.CustomerModel;



public interface CustomerMapper {
	  int insert(CustomerModel t);

	    int delete(CustomerModel t);

	    int deleteModel(CustomerModel t);

	    int update(CustomerModel t);

	    int updateActive(CustomerModel t);

	    CustomerModel selectId(Object id);

	    List<CustomerModel> selectAll(CustomerModel t);

	    List<CustomerModel> select(CustomerModel t);

	    int selectCount(CustomerModel t);
}
