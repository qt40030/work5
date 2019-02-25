package com.qt.work.custcomm.mapper;

import java.util.List;

import com.qt.work.custcomm.model.CustcommModel;

public interface CustcommMapper {

	
	  int insert(CustcommModel t);

	    int delete(CustcommModel t);

	    int deleteModel(CustcommModel t);

	    int update(CustcommModel t);

	    int updateActive(CustcommModel t);

	    CustcommModel selectId(Object id);

	    List<CustcommModel> selectAll(CustcommModel t);

	    List<CustcommModel> select(CustcommModel t);

	    int selectCount(CustcommModel t);
}
