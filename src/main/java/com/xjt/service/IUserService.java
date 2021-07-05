package com.xjt.service;

import com.xjt.model.Page;
import com.xjt.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {

    public User selectUser(long userId);
    public List<User> findAll();
    public User findByUserName(String username);
    public int UpdateUser(User user);
    public int Updatepassword(User user);
    public Page<User> findByPager(int page, int size);
    public long count();
    public int insertUser(User user) throws SQLException;
    public int delet(int id);
    public int UpdateUser2(User user);
    public List<User> duty(int id);
    public int dutydelet(int id);
    public Page<User> FuzzyQueryByUsername(int page, int size,String username);
    public long count2(String username);
    public Page<User> findGLByPager(int page, int size);
    public long count3();
    public int editrole(User user);
    public int addUser(User user)throws SQLException;
    public int edituser(User user);
    public Page<User> findGByPager(int page, int size);
    public long count4();
    public Page<User> FQGByname(int page, int size,String username);
    public long count5(String username);
    public Page<User> FQGLByname(int page, int size,String username);
    public long count6(String username);
    public Page<User> findNOTByPager(int page, int size);
    public long count7();
    public int selsctByUsername(String username);
    public int removeroom(int id);
    public int updateroomname(User user);
}
