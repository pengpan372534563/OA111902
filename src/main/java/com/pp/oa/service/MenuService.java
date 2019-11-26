package com.pp.oa.service;

import com.pp.oa.entity.Menu;
import com.pp.oa.entity.UserMenu;

import java.util.List;

public interface MenuService {
    //根据uid获取meun
    List<Menu> findMenuListByUid(Long uid);

    //查询所以的菜单
    List<Menu> findAll();

    //根据uid删除
    void deleteByUid(Long uid);

    //添加User和Menu的依赖
    void saveUserMenu(UserMenu userMenu);
}
