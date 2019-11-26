package com.pp.oa.controller;

import com.github.pagehelper.PageInfo;
import com.mchange.util.impl.HexAsciiMD5PropertiesPasswordManager;
import com.pp.oa.entity.Department;
import com.pp.oa.entity.Post;
import com.pp.oa.entity.User;
import com.pp.oa.service.DepartmentService;
import com.pp.oa.service.PostService;
import com.pp.oa.service.UserPostService;
import com.pp.oa.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
//用户信息管理
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private PostService postService;

    @Autowired
    private UserPostService userPostService;

    @RequestMapping("/list")
    public String findAll(Model model) {
        List<User> userList = userService.findAll();
        model.addAttribute("userList",userList);
        return "user/list";
    }

    @RequestMapping(value = "/page",produces="application/json;charset=utf-8")
    public String findAll(Model model,Integer pageNum,Integer pageSize) {
        PageInfo<User> pageInfo=userService.findAllByPageTest(pageNum,pageSize);
        model.addAttribute("pageInfo",pageInfo);
        return "user/listPage";
    }

    //删除用户
    @RequestMapping("/delete")
    public String findAll(@RequestParam("uid") Long uid) {
        userService.deleteUserByUid(uid);
        return "redirect:/user/page.do";
    }

    //添加用户
    @RequestMapping("/addPage")
    public String addPage(Model model) {
        //获取所以的部门
        List<Department> departmentList = departmentService.findAllDepartment();
        //获取所以得岗位
        List<Post> postList = postService.findAll();
        //设置域
        model.addAttribute("departmentList",departmentList);
        model.addAttribute("postList",postList);
        return "user/save";
    }

//    ajaxUserFindName
    @RequestMapping("/ajaxUserFindName")
    @ResponseBody
    public User ajaxUserFindName(Model model,@RequestParam("username") String username) {
        User user=userService.findUserByUsername(username);
        return user;
    }


    //添加保存
    @RequestMapping("/saveUser")
    public String  saveUser(User user,Long[] pids){
        //保存用户与部门
        Long uid = userService.saveUser(user);
        //保存用户与岗位
        userPostService.saveUserPost(uid,pids);
        return  "redirect:/user/page.do";
    }

    //去修改页面
    @RequestMapping("/updatePage")
    public String  updatePage(Model model,Long uid){
        //获取所以的部门
        List<Department> departmentList = departmentService.findAllDepartment();
        //获取所以得岗位
        List<Post> postList = postService.findAll();
        //获取当前用户对象
        User user = userService.findUserById(uid);
        //设置域
        model.addAttribute("departmentList",departmentList);
        model.addAttribute("postList",postList);
        model.addAttribute("user",user);

        return  "user/edit";
    }

    //    findUpdateUserName
    @RequestMapping("/findUpdateUserName")
    @ResponseBody
    public User findUpdateUserName(@RequestParam("uid")Long uid, @RequestParam("username") String username) {
        return userService.findUpdateUserName(uid,username);
    }

    //updateUser
    @RequestMapping("/updateUser")
    public String updateUser(User user, @RequestParam("pids")Long[] pids) {
        //修改用户
        userService.updateUser(user);
        //修改岗位关联
        userPostService.updateUserPost(user.getUid(),pids);
        return "redirect:/user/page.do";
    }

    @RequestMapping("/login")
    public String login(HttpSession session,Model model, User user) {
        User existUser=userService.login(user);
        if (existUser!=null){
            session.setAttribute("user",existUser);
            //登录成功
            return "frame/index";
        }else{
            //登录失败
            model.addAttribute("message","账号或者密码错误！");
            return "login";
        }
    }

}
