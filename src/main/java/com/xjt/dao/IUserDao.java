package com.xjt.dao;

import com.xjt.model.User;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IUserDao {

    User selectUser(long id);
    List<User> findAll();
    User findByUserName(String username);
    int UpdateUser(User user);
    int Updatepassword(User user);
    List<User> findByPager(Map<String, Object> params);
    long count();
    int insertUser(User user)throws SQLException;
    int delet(int id);
    int UpdateUser2(User user);
    List<User> looks(String str);
    List<User> duty(int id);
    int dutydelet(int id);
    //模糊查询
    List<User> FuzzyQueryByUsername(Map<String, Object> param);
    long count2(String username);
    List<User> findGLByPager(Map<String, Object> param);
    long count3();
    int editrole(User user);
    int addUser(User user)throws SQLException;
    int edituser(User user);
    List<User> findGByPager(Map<String, Object> param);
    long count4();
    List<User> FQGByname(Map<String, Object> param);
    long count5(String username);
    List<User> FQGLByname(Map<String, Object> param);
    long count6(String username);
    List<User> findNOTByPager(Map<String, Object> param);
    long count7();
    int selsctByUsername(String username);
    int removeroom(int id);
    int updateroomname(User user);
}
