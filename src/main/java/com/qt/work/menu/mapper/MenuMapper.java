package com.qt.work.menu.mapper;

import java.util.List;

import com.qt.work.menu.model.MenuModel;


public interface MenuMapper {
    int insert(MenuModel t);

    int delete(MenuModel UserModel);

    int deleteModel(MenuModel t);

    int update(MenuModel t);

    int updateActive(MenuModel t);

    MenuModel selectId(Object id);

    List<MenuModel> selectAll(MenuModel t);

    List<MenuModel> select(MenuModel t);
    List<MenuModel> selectList(MenuModel t);
    int selectCount(MenuModel t);
    List<MenuModel> select2(MenuModel t);
    
}