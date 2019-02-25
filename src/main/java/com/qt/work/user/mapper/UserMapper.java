package com.qt.work.user.mapper;

import java.util.List;

import com.qt.work.user.model.UserModel;

public interface UserMapper {
    int insert(UserModel t);

    int delete(UserModel UserModel);

    int deleteModel(UserModel t);

    int update(UserModel t);

    int updateActive(UserModel t);

    UserModel selectId(Object id);

    List<UserModel> selectAll(UserModel t);

    List<UserModel> select(UserModel t);
    List<UserModel> selectList(UserModel t);
    int selectCount(UserModel t);
}