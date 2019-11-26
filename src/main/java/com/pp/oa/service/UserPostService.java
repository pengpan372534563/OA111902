package com.pp.oa.service;

public interface UserPostService {

    //添加岗位关联
    void saveUserPost(Long uid,Long[] pids);

    //修改岗位关联
    void updateUserPost(Long uid,Long[] pids);
}
