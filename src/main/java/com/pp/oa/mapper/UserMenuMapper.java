package com.pp.oa.mapper;

import com.pp.oa.entity.UserMenu;
import org.apache.ibatis.annotations.Delete;

public interface UserMenuMapper {
    int insert(UserMenu record);

    int insertSelective(UserMenu record);

    @Delete("delete from user_menu where uid =#{uid}")
    int deleteUserMenuByUid(Long uid);

}