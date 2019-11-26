package com.pp.oa.controller;

import com.pp.oa.entity.Menu;
import com.pp.oa.entity.UserMenu;
import com.pp.oa.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/usermenu")
public class UserMenuController {

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/showMenus",produces="application/json;charset=utf-8")
    @ResponseBody
    public HashMap<String, List<Menu>> showMenus(Long uid){
        //获取所有的权限
        List<Menu> menuList = menuService.findAll();

        //获取uid的权限菜单
        List<Menu> menuListByUid = menuService.findMenuListByUid(uid);

        //把uid绑定的权限checked设置为true
        for (Menu menuByUid : menuListByUid) {
            Long mid = menuByUid.getMid();
            for (Menu menu : menuList) {
                if (menu.getMid() ==mid) {
                    menu.setChecked(true);
                }
            }
        }

        HashMap<String, List<Menu>> hashMap =new HashMap<String, List<Menu>>();
        hashMap.put("menuitemList",menuList);
        return hashMap;
    }


    @RequestMapping(value = "/save",produces="application/json;charset=utf-8")
    @ResponseBody
    public HashMap<String,String> save(Long uid,String mids){
        //先删除与uid相关的菜单
        menuService.deleteByUid(uid);
        //获取所有的mid
        String[] split = mids.split(",");
        for (String mid : split) {
            menuService.saveUserMenu(new UserMenu(uid,Long.parseLong(mid)));
        }
        HashMap<String,String> hashMap =new HashMap<String,String>();
        hashMap.put("message","操作成功！");
        return hashMap;
    }

}
