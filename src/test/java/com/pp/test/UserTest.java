package com.pp.test;

import com.pp.oa.entity.User;
import com.pp.oa.mapper.UserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext-*.xml"})
public class UserTest {

    @Autowired
    private UserMapper userMapper;

    @Test
    public void findAll(){
        List<User> userList = userMapper.findAll();
        System.out.println(userList.size());
    }

    @Test
    public void insert(){
        User user =new User();
        user.setUsername("彭盼");
        user.setPassword("123564");
        user.setEmail("pengpan@163.com");
        user.setSex("男");
        user.setDepartmentId(6);
        int a = userMapper.insert(user);
        System.out.println(a);
    }


    @Test
    public void deleteByPrimaryKey(){
        System.out.println(userMapper.deleteUserByUid(23L));
    }
}
