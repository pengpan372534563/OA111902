package com.pp.oa.service.impl;

import com.pp.oa.entity.UserPost;
import com.pp.oa.mapper.UserPostMapper;
import com.pp.oa.service.UserPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserPostServiceImpl implements UserPostService{

    @Autowired
    UserPostMapper userPostMapper;

    @Override
    public void saveUserPost(Long uid, Long[] pids){
        for (Long pid : pids) {
            userPostMapper.saveUserPost(new UserPost(uid,pid));
        }
    }

    @Override
    public void updateUserPost(Long uid,Long[] pids) {
        //先删除在添加
        userPostMapper.deleteUserPostByUid(uid);
        //在添加
        for (Long pid : pids) {
            userPostMapper.saveUserPost(new UserPost(uid,pid));
        }
    }
}
