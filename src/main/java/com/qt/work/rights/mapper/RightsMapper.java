package com.qt.work.rights.mapper;

import java.util.List;

import com.qt.work.rights.model.RightsModel;

public interface RightsMapper {
    int insert(RightsModel t);

    int delete(RightsModel t);

    int deleteModel(RightsModel t);

    int update(RightsModel t);

    int updateActive(RightsModel t);

    RightsModel selectId(Object id);

    List<RightsModel> selectAll(RightsModel t);

    List<RightsModel> select(RightsModel t);

    int selectCount(RightsModel t);
}
