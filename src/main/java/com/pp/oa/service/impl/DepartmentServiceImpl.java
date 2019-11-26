package com.pp.oa.service.impl;

import com.pp.oa.entity.Department;
import com.pp.oa.mapper.DepartmentMapper;
import com.pp.oa.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DepartmentServiceImpl  implements DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> findAllDepartment() {
        return departmentMapper.findAll();
    }

    @Override
    public Department findDepartmentById(long did) {
        return departmentMapper.selectByPrimaryKey(did);
    }

    @Override
    public int deleteDepartment(long did) {
        return departmentMapper.deleteByPrimaryKey(did);
    }

    @Override
    public int updateDepartment(Department department) {
        return departmentMapper.updateByPrimaryKey(department);
    }

    @Override
    public int saveDepartment(Department department) {
        return departmentMapper.insert(department);
    }
}
