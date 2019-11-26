package com.pp.oa.controller;

import com.pp.oa.entity.Menu;
import com.pp.oa.entity.User;
import com.pp.oa.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/showMenusByUid",produces="application/json;charset=utf-8")
    @ResponseBody
    public Map<String,List<Menu>> showMenusByUid(HttpSession session){
        //获取session中的user
        User user = (User) session.getAttribute("user");
        //根基uid获取menu对象
        List<Menu> menuitemList =menuService.findMenuListByUid(user.getUid());
        for (Menu menu : menuitemList) {
            menu.setTarget("right");
        }
        //放在map集合中
        HashMap<String ,List<Menu>> hashMap =new HashMap<String ,List<Menu>>();
        hashMap.put("menuitemList",menuitemList);
        return hashMap;
    }
}
