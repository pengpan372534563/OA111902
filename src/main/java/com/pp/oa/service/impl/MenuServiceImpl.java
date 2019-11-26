package com.pp.oa.service.impl;

import com.pp.oa.entity.Menu;
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
}
