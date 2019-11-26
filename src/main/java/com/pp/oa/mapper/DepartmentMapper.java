package com.pp.oa.mapper;

import com.pp.oa.entity.Department;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface DepartmentMapper {
    @Delete("delete from department where did=#{did}")
    int deleteByPrimaryKey(Long did);

    @Insert("insert into department values(null,#{dname},#{description})")
    int insert(Department record);

    @Select("select * from department where did =#{did}")
    Department selectByPrimaryKey(Long did);

    @Update("update department set dname=#{dname},description=#{description} where did =#{did}")
    int updateByPrimaryKey(Department record);

    @Select("select * from department")
    List<Department> findAll();
}