package com.pp.oa.service;

import com.pp.oa.entity.Menu;

import java.util.List;

public interface MenuService {
    //根据uid获取meun
    List<Menu> findMenuListByUid(Long uid);
}
