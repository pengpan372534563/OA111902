package com.pp.oa.controller;

import com.pp.oa.entity.Post;
import com.pp.oa.entity.Post;
import com.pp.oa.exceptions.PostException;
import com.pp.oa.service.PostService;
import com.pp.oa.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/post")
public class PostController {
    @Autowired
    private PostService postService;

    //查询全部
    @RequestMapping("/list.do")
    public String list(Model model){
        List<Post> postList = postService.findAll();
        model.addAttribute("postList",postList);
        return "post/list" ;
    }

    //添加页面
    @RequestMapping("/insert.do")
    public String insert(){
        return "post/save" ;
    }
    //添加保存
    @RequestMapping("/save.do")
    public String save(Post post){
        int i = postService.savePost(post);
        if (i>0) {
            System.out.println("添加成功");
        }
        return "redirect:/post/list.do" ;
    }

    //删除
    @RequestMapping("/delete.do")
    @ResponseBody
    public HashMap<String,String> delete(@RequestParam("pid") Long pid){
        HashMap<String,String> hashMap =new HashMap<String,String>();
        try {
            postService.deletePost(pid);
        } catch (PostException e) {
            hashMap.put("message","删除失败");
            e.printStackTrace();
            return hashMap;
        }
        hashMap.put("message","删除成功");
        return hashMap ;
    }

    //修改页面
    @RequestMapping("/updatePage.do")
    public String updatePage(Model model,@RequestParam("pid") Long pid){
        Post  post= postService.findPostById(pid);
        model.addAttribute("post",post);
        return "post/update" ;
    }
    //修改保存
    @RequestMapping("/update.do")
    @ResponseBody
    public int update(Post post){
        return postService.updatePost(post);
    }

    //ajaxFindName  名称查询
    //修改保存
    @RequestMapping("/ajaxFindName.do")
    @ResponseBody
    public Post ajaxFindName(@RequestParam("pname")String pname){
        return postService.findPostByName(pname);
    }

    //修改名称校验
    @RequestMapping("/checkUpdatePname.do")
    @ResponseBody
    public Post checkUpdatePname(@RequestParam("pid")Long pid ,@RequestParam("pname")String pname){
        return postService.checkUpdatePname(pid, pname);
    }
}