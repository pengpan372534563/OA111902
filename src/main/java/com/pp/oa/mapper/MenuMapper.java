package com.pp.oa.mapper;

import com.pp.oa.entity.Menu;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MenuMapper {
    int deleteByPrimaryKey(Long mid);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Long mid);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    @Select("select * from  menu where mid  in (select mid from user_menu where uid=#{uid}) ")
    List<Menu> findMenuListByUid(Long uid);
}