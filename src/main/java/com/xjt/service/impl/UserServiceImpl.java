package com.xjt.service.impl;

import com.xjt.dao.IUserDao;
import com.xjt.model.Page;
import com.xjt.model.User;
import com.xjt.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    public User selectUser(long userId) {
        return userDao.selectUser(userId);
    }
    public List<User> findAll(){return userDao.findAll();};

    public User findByUserName(String username) { return userDao.findByUserName(username); }

    public int UpdateUser(User user) {
        return userDao.UpdateUser(user); }
    public int Updatepassword(User user) {
        return userDao.Updatepassword(user);
    }

    @Override
    public Page<User> findByPager(int page, int size) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("page", (page-1)*size);
        params.put("size", size);
        Page<User> pager = new Page<User>();
        List<User> list = userDao.findByPager(params);
        pager.setRows(list);
        pager.setTotal(userDao.count());
        return pager;
    }
    @Override
    public long count() {
        return userDao.count();
    }

    @Override
    public int insertUser(User user)throws SQLException {
        return userDao.insertUser(user);
    }

    @Override
    public int delet(int id) {
        return userDao.delet(id);
    }

    @Override
    public int UpdateUser2(User user) {
        return userDao.UpdateUser2(user);
    }
    public List<User> looks(String str) {
        return userDao.looks(str);
    }

    @Override
    public List<User> duty(int id) {
        return userDao.duty(id);
    }
    public int dutydelet(int id){
        return userDao.dutydelet(id);
    }

    @Override
    public Page<User> FuzzyQueryByUsername(int page, int size,String username) {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("page", (page-1)*size);
        param.put("size", size);
        param.put("username",username);
        System.out.println(username);
        Page<User> pager = new Page<User>();
        List<User> list = userDao.FuzzyQueryByUsername(param);
        pager.setRows(list);
        pager.setTotal(userDao.count2(username));
        return pager;
    }

    @Override
    public long count2(String username) {
        return userDao.count2(username);
    }

    @Override
    public Page<User> findGLByPager(int page, int size) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("page", (page-1)*size);
        params.put("size", size);
        Page<User> pager = new Page<User>();
        List<User> list = userDao.findGLByPager(params);
        pager.setRows(list);
        pager.setTotal(userDao.count3());
        return pager;
    }

    @Override
    public long count3() {
        return userDao.count3();
    }

    @Override
    public int editrole(User user) {
        return userDao.editrole(user);
    }

    @Override
    public int addUser(User user) throws SQLException {
        return userDao.addUser(user);
    }

    @Override
    public int edituser(User user) {
        return userDao.edituser(user);
    }

    @Override
    public Page<User> findGByPager(int page, int size) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("page", (page-1)*size);
        params.put("size", size);
        Page<User> pager = new Page<User>();
        List<User> list = userDao.findGByPager(params);
        pager.setRows(list);
        pager.setTotal(userDao.count4());
        return pager;
    }

    @Override
    public long count4() {
        return userDao.count4();
    }

    @Override
    public Page<User> FQGByname(int page, int size, String username) {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("page", (page-1)*size);
        param.put("size", size);
        param.put("username",username);
        System.out.println(username);
        Page<User> pager = new Page<User>();
        List<User> list = userDao.FQGByname(param);
        pager.setRows(list);
        pager.setTotal(userDao.count5(username));
        return pager;
    }

    @Override
    public long count5(String username) {
        return userDao.count5(username);
    }

    @Override
    public Page<User> FQGLByname(int page, int size, String username) {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("page", (page-1)*size);
        param.put("size", size);
        param.put("username",username);
        Page<User> pager = new Page<User>();
        List<User> list = userDao.FQGLByname(param);
        pager.setRows(list);
        pager.setTotal(userDao.count6(username));
        return pager;
    }

    @Override
    public long count6(String username) {
        return userDao.count6(username);
    }

    @Override
    public Page<User> findNOTByPager(int page, int size) {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("page", (page-1)*size);
        param.put("size", size);
        Page<User> pager = new Page<User>();
        List<User> list = userDao.findNOTByPager(param);
        pager.setRows(list);
        pager.setTotal(userDao.count7());
        return pager;
    }

    @Override
    public long count7() {
        return userDao.count7();
    }

    @Override
    public int selsctByUsername(String username) {
        return userDao.selsctByUsername(username);
    }

    @Override
    public int removeroom(int id) {
        return userDao.removeroom(id);
    }

    @Override
    public int updateroomname(User user) {
        return userDao.updateroomname(user);
    }

}
