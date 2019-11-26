package com.pp.oa.service.impl;

import com.pp.oa.entity.Post;
import com.pp.oa.exceptions.PostException;
import com.pp.oa.mapper.PostMapper;
import com.pp.oa.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PostServiceImpl implements PostService {

    @Autowired
    private PostMapper postMapper;

    @Override
    public List<Post> findAll() {
        return postMapper.findAll();
    }

    @Override
    public Post findPostById(long pid) {
        return postMapper.selectByPrimaryKey(pid);
    }

    @Override
    public void deletePost(long pid) throws PostException {
        int i = postMapper.deleteByPrimaryKey(pid);
        if (i<1){
            throw new PostException("pid错误，删除失败："+pid);
        }
    }

    @Override
    public int updatePost(Post post) {
        return postMapper.updateByPrimaryKey(post);
    }

    @Override
    public int savePost(Post post) {
        return postMapper.insert(post);
    }

    @Override
    public Post findPostByName(String pname) {
        return postMapper.findPostByName(pname);
    }

    @Override
    public Post checkUpdatePname(Long pid, String pname) {
        return postMapper.checkUpdatePname(pid,pname);
    }
}
