package com.pp.oa.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pp.oa.entity.PageBean;
import com.pp.oa.entity.User;
import com.pp.oa.mapper.UserMapper;
import com.pp.oa.mapper.UserMenuMapper;
import com.pp.oa.mapper.UserPostMapper;
import com.pp.oa.service.UserService;
import com.pp.oa.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional  //事物 对所有的方法实现
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserPostMapper userPostMapper;
    @Autowired
    private UserMenuMapper userMenuMapper;

    @Override
    public void deleteUserByUid(Long uid) {
    //        删除与岗位
        userPostMapper.deleteUserPostByUid(uid);
    //        删除职责
        userMenuMapper.deleteUserMenuByUid(uid);
//        删除用户
        userMapper.deleteUserByUid(uid);
    }

    @Override
    public int insert(User user) {
        return userMapper.insert(user);
    }

    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }

    @Override
    public PageInfo findAllByPage(Integer pageNum, Integer pageSize) {
        //设置当前页和每页条数
        PageBean pageBean =new PageBean();
        if(pageNum==null){
            pageNum=1;
        }
        pageBean.setPageIndex(pageNum);
        if (pageSize!=null) {
            pageBean.setPageSize(pageSize);
        }
        //获取分页数据
        List<User> userList = userMapper.findAllByPage(pageBean);
        //把数据放在pageInfo
        //当前页，每页条数，总条数，数据
        PageInfo pageInfo =new PageInfo(
//                pageBean.getPageIndex(),
//                pageBean.getPageSize(),
//                userMapper.findAllCount(),
                userList);
        return pageInfo;
    }

    @Override
    public PageInfo findAllByPageTest(Integer pageNum, Integer pageSize) {
        //设置当前页和每页条数
        if(pageNum==null){
            pageNum=1;
        }
        if (pageSize==null) {
            pageSize=3;
        }
        PageHelper.startPage(pageNum,pageSize);
        //获取分页数据
        List<User> userList = userMapper.findAllByPageTest();
        //把数据放在pageInfo
        //当前页，每页条数，总条数，数据
        PageInfo pageInfo =new PageInfo(userList);
        return pageInfo;
    }

    //根据name查询
    @Override
    public User findUserByUsername(String username) {
        return userMapper.findUserByUsername(username);
    }

    @Override
    public Long saveUser(User user) {
        userMapper.saveUser(user);
        return user.getUid();
    }

    @Override
    public User findUserById(Long uid) {
        return userMapper.findUserById(uid);
    }

    //修改验证
    @Override
    public User findUpdateUserName(Long uid, String username) {
        return userMapper.findUpdateUserName(uid, username);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateByPrimaryKey(user);
    }

    @Override
    public User login(User user) {
        //MD5加密
        user.setPassword(MD5Utils.md5(user.getPassword()));
        return userMapper.login(user);
    }


}
