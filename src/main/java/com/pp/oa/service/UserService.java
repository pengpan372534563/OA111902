package com.pp.oa.service;

import com.github.pagehelper.PageInfo;
import com.pp.oa.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface UserService {
    void deleteUserByUid(Long uid);
    int insert(User user);
    List<User> findAll();
    //分页查询
    PageInfo findAllByPage(Integer pageNum, Integer pageSize);
    //分页查询  pageHelper
    public PageInfo findAllByPageTest(Integer pageNum, Integer pageSize);
    //根据name查询
    User findUserByUsername(String username);
    //保存
    Long saveUser(User user);
    //根据id获取数据
    User findUserById(Long uid);
    //修改验证
    User findUpdateUserName(Long uid, String username);
    //修改用户
    void updateUser(User user);
    //登录验证
    User login(User user);
}
