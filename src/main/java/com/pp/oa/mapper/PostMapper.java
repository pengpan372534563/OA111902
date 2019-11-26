package com.pp.oa.mapper;

import com.pp.oa.entity.Post;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface PostMapper {
    @Delete("delete from post where pid=#{pid}")
    int deleteByPrimaryKey(Long pid);

    @Insert("insert into post values(null,#{pname},#{description})")
    int insert(Post post);

    @Update("update post set pname=#{pname},description=#{description} where pid=#{pid}")
    int updateByPrimaryKey(Post post);

    @Select("select * from post")
    List<Post> findAll();

    @Select("select * from post where pid=#{pid}")
    Post selectByPrimaryKey(Long pid);

    //添加校验
    @Select("select * from post where pname=#{pname} limit 1")
    Post findPostByName(String pname);

    //修改校验
    @Select("select * from post where pname = #{pname} and pid <> #{pid}")
    Post checkUpdatePname(@Param("pid") Long pid, @Param("pname") String pname);

    //根据用户名查询岗位
    @Select("select * from post where pid in(select post_id from user_post where user_id =#{uid})")
    List<Post> selectPostByUid(Long uid);
}