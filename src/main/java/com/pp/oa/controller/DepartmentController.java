package com.pp.oa.controller;

import com.pp.oa.entity.Department;
import com.pp.oa.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/department")
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    //查询全部
    @RequestMapping("/list.do")
    public String list(Model model){
        List<Department> departmentList = departmentService.findAllDepartment();
        model.addAttribute("departmentList",departmentList);
        return "department/list" ;
    }

    //添加页面
    @RequestMapping("/insert.do")
    public String insert(){
        return "department/save" ;
    }
    //添加保存
    @RequestMapping("/save.do")
    public String save(Department department){
        int i = departmentService.saveDepartment(department);
        if (i>0) {
            System.out.println("添加成功");
        }
        return "redirect:/department/list.do" ;
    }

    //删除
    @RequestMapping("/delete.do")
    public String delete(@RequestParam("did") Long did){
        int i = departmentService.deleteDepartment(did);
        if (i>0) {
            System.out.println("删除成功");
        }
        return "redirect:/department/list.do" ;
    }

    //修改页面
    @RequestMapping("/updatePage.do")
    public String updatePage(Model model,@RequestParam("did") Long did){
        Department department = departmentService.findDepartmentById(did);
        model.addAttribute("department",department);
        return "department/update" ;
    }
    //修改保存
    @RequestMapping("/update.do")
    public String update(Department department){
        int i = departmentService.updateDepartment(department);
        if (i>0) {
            System.out.println("修改成功");
        }
        return "redirect:/department/list.do" ;
    }
}