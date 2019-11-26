package com.pp.oa.mapper;

import com.pp.oa.entity.UserPost;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

public interface UserPostMapper {

    @Delete("delete from user_post where user_id =#{uid}")
    int deleteUserPostByUid(Long uid);

    @Insert("insert into user_post values(#{userId},#{postId})")
    void saveUserPost(UserPost userPost);
}