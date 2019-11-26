package com.pp.oa.service;

import com.pp.oa.entity.Department;

import java.util.List;

public interface DepartmentService {

    //查询全部
    List<Department> findAllDepartment();
    //根据id查询
    Department  findDepartmentById(long did);
    //删除
    int   deleteDepartment(long did);
    //修改
    int  updateDepartment(Department department);
    //添加
    int  saveDepartment(Department department);
}
