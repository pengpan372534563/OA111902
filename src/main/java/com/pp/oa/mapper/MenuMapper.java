package com.pp.oa.mapper;

import com.pp.oa.entity.Menu;
import com.pp.oa.entity.UserMenu;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MenuMapper {
    @Select("select * from  menu where mid  in (select mid from user_menu where uid=#{uid}) ")
    List<Menu> findMenuListByUid(Long uid);

    @Select("select * from menu")
    List<Menu> findAll();

    @Select("delete from user_menu where uid =#{uid}")
    void deleteUserMenuByUid(Long uid);

    @Insert("insert into user_menu values(#{uid},#{mid})")
    void insertUserMenu(UserMenu userMenu);
}