package com.pp.oa.service.impl;

import com.pp.oa.entity.Menu;
import com.pp.oa.entity.UserMenu;
import com.pp.oa.mapper.MenuMapper;
import com.pp.oa.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> findMenuListByUid(Long uid) {
        return menuMapper.findMenuListByUid(uid);
    }

    @Override
    public List<Menu> findAll() {
        return menuMapper.findAll();
    }

    //根据uid删除菜单
    @Override
    public void deleteByUid(Long uid) {
        menuMapper.deleteUserMenuByUid(uid);
    }

    @Override
    public void saveUserMenu(UserMenu userMenu) {
        menuMapper.insertUserMenu(userMenu);
    }


}
