package com.pp.oa.mapper;

import com.pp.oa.entity.PageBean;
import com.pp.oa.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface UserMapper {

    @Insert("insert into user " +
            "values(null,#{username},#{password},#{email},#{sex},#{departmentId})")
    int insert(User user);

    @Select("select * from user where uid =#{uid}")
    @Results(
            @Result(column = "department_id",property = "departmentId")
    )
    User selectByPrimaryKey(Long uid);

    @Update("update user set username=#{username},password=#{password}" +
            ",email=#{email},sex=#{sex},department_id=#{departmentId} " +
            "where uid =#{uid}")
    int updateByPrimaryKey(User user);

    @Select("select * from user")
    @Results({
            @Result(column = "department_id",property = "departmentId"),
            @Result(column = "department_id",property = "department",
                    one = @One(select = "com.pp.oa.mapper.DepartmentMapper.selectByPrimaryKey")),
            @Result(column = "uid",property = "postList",
                    many=@Many(select = "com.pp.oa.mapper.PostMapper.selectPostByUid"))
    })
    List<User> findAll();

    @Select("select * from user limit #{startRow},#{pageSize}")
    @Results({
            @Result(column = "department_id",property = "departmentId"),
            @Result(column = "department_id",property = "department",
                    one = @One(select = "com.pp.oa.mapper.DepartmentMapper.selectByPrimaryKey")),
            @Result(column = "uid",property = "postList",
                    many=@Many(select = "com.pp.oa.mapper.PostMapper.selectPostByUid"))
    })
    List<User> findAllByPage(PageBean pageBean);

    //获取总条数  分页测试
    @Select("select * from user")
    @Results({
            @Result(column = "uid",property = "uid"),
            @Result(column = "department_id",property = "departmentId"),
            @Result(column = "department_id",property = "department",
                    one = @One(select = "com.pp.oa.mapper.DepartmentMapper.selectByPrimaryKey")),
            @Result(column = "uid",property = "postList",
                    many=@Many(select = "com.pp.oa.mapper.PostMapper.selectPostByUid"))
    })
    List<User> findAllByPageTest();


    @Delete("delete from user where uid = #{uid}")
    int deleteUserByUid(Long uid);

    //根据name查询
    @Select("select * from user where username =#{username} limit 1")
    User findUserByUsername(String username);

    @Insert("insert into  user values(null,#{username},#{password},#{email},#{sex},#{departmentId})")
    @Options(useGeneratedKeys=true,keyProperty="uid")
    void saveUser(User user);

    @Select("select * from user where uid =#{uid} limit 1")
    @Results({
            @Result(column = "uid",property = "uid"),
            @Result(column = "department_id",property = "departmentId"),
            @Result(column = "department_id",property = "department",
                    one = @One(select = "com.pp.oa.mapper.DepartmentMapper.selectByPrimaryKey")),
            @Result(column = "uid",property = "postList",
                    many=@Many(select = "com.pp.oa.mapper.PostMapper.selectPostByUid"))
    })
    User findUserById(Long uid);

    //修改验证
    @Select("select * from  user where username=#{username} and uid!=#{uid}")
    User findUpdateUserName(@Param("uid")Long uid, @Param("username")String username);

    //登录验证
    @Select("select * from user where username=#{username} and password=#{password}")
    User login(User user);
}