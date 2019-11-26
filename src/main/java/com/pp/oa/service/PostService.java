package com.pp.oa.service;

import com.pp.oa.entity.Post;
import com.pp.oa.exceptions.PostException;

import java.util.List;

public interface PostService {

    //查询全部
    List<Post> findAll();
    //根据id查询
    Post  findPostById(long did);
    //删除
    void   deletePost(long did) throws PostException;
    //修改
    int  updatePost(Post post);
    //添加
    int  savePost(Post post);
    //根据name查询
    Post findPostByName(String pname);
    //修改名称校验
    Post checkUpdatePname(Long pid, String pname);
}
