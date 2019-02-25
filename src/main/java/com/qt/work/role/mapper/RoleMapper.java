package com.qt.work.role.mapper;

import java.util.List;

import com.qt.work.role.model.RoleModel;

public interface RoleMapper {
    int insert(RoleModel t);

    int delete(RoleModel t);

    int deleteModel(RoleModel t);

    int update(RoleModel t);

    int updateActive(RoleModel t);

    RoleModel selectId(Object id);

    List<RoleModel> selectAll(RoleModel t);

    List<RoleModel> select(RoleModel t);

    int selectCount(RoleModel t);
}
