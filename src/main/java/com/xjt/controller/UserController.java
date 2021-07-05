package com.xjt.controller;

import com.xjt.model.Page;
import com.xjt.model.Room;
import com.xjt.model.User;
import com.xjt.service.IRoomService;
import com.xjt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;


@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private IUserService userService;
    @Autowired
    private IRoomService roomService;
    /*查询用户信息*/
    @RequestMapping("/select")
    public ModelAndView selectUser(HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView();
        int x=Integer.parseInt(session.getId());
        User user = userService.selectUser(x);
        mv.addObject("user", user);
        mv.setViewName("Xinfo");
        return mv;
    }
    /*查询所有用户*/
    @RequestMapping("/findAll")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<User> users = userService.findAll();
        mv.addObject("user", users);
        mv.setViewName("finduser");
        return mv;
    }
    /*用户登录*/
    @RequestMapping("/login")
    public String login(HttpSession session, @RequestParam String username, @RequestParam String password) {
        //前台传递的数据作为参数传递给后台
        User user = userService.findByUserName(username);
        if (user == null) {
            //如果users为空 说明用户不存在，那么重定向到登录页面
            return "login";
        }
        if (username.equals(user.getUsername()) && password.equals(user.getPassword())) {
            //反之成功， 那么将用户放在session
            String userclass=String.valueOf(user.getUserclass());
            if(userclass.equals("G")){
                session.setAttribute("users", user);
                String us=user.getUsername();
                long uid=user.getId();
                session.removeAttribute("x");
                session.setAttribute("x",us);
                session.setAttribute("uid",uid);
                //登录成功 跳转到用户界面
                return "usersuccess";
            }else if (userclass.equals("A")){
                session.setAttribute("users", user);
                session.setAttribute("size",7);
                session.setAttribute("page",1);//登录成功 跳转到管理员界面
                return "adminsuccess";
            }else{
                session.setAttribute("users", user);
                //登录成功 跳转到领导界面
                return "leadsuccess";
            }
        }
        //不成功就跳转到登录页面
        return "login";
    }
    @RequestMapping("/xiugai")
    /*修改*/
    public String xiugai(
            HttpSession session,  String username,  String sex, Date birth, String phonenum,
            String email, String qq, String address, String realname, String idnum) {
        User user = (User)session.getAttribute("users");
        user.setUsername(username);
        user.setSex(sex);
        user.setBirth(birth);
        user.setPhonenum(phonenum);
        user.setEmail(email);
        user.setQq(qq);
        user.setAddress(address);
        user.setRealname(realname);
        user.setIdnum(idnum);
        int s=userService.UpdateUser(user);
        if(s==1){
            User usernew = userService.findByUserName(username);
            session.removeAttribute("users");
            session.setAttribute("users",usernew);
            return "page/success";
        }else {
            return "page/d";
        }
    }
    @RequestMapping("/changpass")
    public String changpass(HttpSession session, @RequestParam String password) {
        User user = (User)session.getAttribute("users");
        user.setPassword(password);
        int flag=userService.Updatepassword(user);
        if (flag==1){
            session.setAttribute("changpassinfo","修改成功！");
        }else {
            session.setAttribute("changpassinfo","修改失败！");
        }
        return "userpage/changpass";
    }
    /*分页查询*/
    @RequestMapping("/findByPager")
    public ModelAndView findByPager(int page, int size,String info){
        ModelAndView mv = new ModelAndView();
        Page<User> pager = userService.findByPager(page, size);
        if (info != null) {
            mv.addObject("info", info);
        }
        mv.addObject("pager", pager);
        mv.setViewName("admin/alluser");
        return mv;
    }
    /*添加用户*/
    @RequestMapping("/insert")
    public String insert(String username, String password, String sex, Date birth, String phonenum,
                         String email, String qq, String address, String realname, String idnum, RedirectAttributes redirectAttributes) throws SQLException {
        User user = new User();
        User users = new User();
        Room rooms = new Room();
        user.setUsername(username);
        user.setSex(sex);
        user.setBirth(birth);
        user.setPassword(password);
        user.setPhonenum(phonenum);
        user.setEmail(email);
        user.setQq(qq);
        user.setAddress(address);
        user.setRealname(realname);
        user.setIdnum(idnum);
        try {
            userService.insertUser(user);
            int id =userService.selsctByUsername(username);
            List<Room> room = roomService.findNoneRoom();
            if (room!=null){
                int roomid=room.get(0).getId();
                String roomname = room.get(0).getRoomname();
                users.setId(id);
                users.setCadd(roomname);
                userService.updateroomname(users);
                rooms.setId(roomid);
                rooms.setUserid(id);
                roomService.updateuser(rooms);
                redirectAttributes.addAttribute("info", "添加用户成功");
            }else {
                redirectAttributes.addAttribute("info", "添加失败，没有房间了！");
            }

        }
        catch (Exception e) {
            redirectAttributes.addAttribute("info", "添加用户失败");
        }
        finally {
            redirectAttributes.addAttribute("page", 1);
            redirectAttributes.addAttribute("size", 7);
            return "redirect:/user/findByPager";
        }
    }
    //删除用户
    @RequestMapping("/delet")
    public String delet(int id, RedirectAttributes redirectAttributes) {
        int flag = userService.delet(id);
        if (flag >=1){
            redirectAttributes.addAttribute("info", "删除成功");
        }else{
            redirectAttributes.addAttribute("info", "删除失败");
        }     redirectAttributes.addAttribute("page", 1);
        redirectAttributes.addAttribute("size", 7);
        return "redirect:/user/findByPager";
    }
    /*修改用户*/
    @RequestMapping("/edit")
    public String xiugai2(int id ,String username,  String sex, Date birth, String phonenum,
                          String email, String qq, String address, String realname, String idnum,RedirectAttributes redirectAttributes) {
        User user = new User();
        user.setId(id);
        user.setUsername(username);
        user.setSex(sex);
        user.setBirth(birth);
        user.setPhonenum(phonenum);
        user.setEmail(email);
        user.setQq(qq);
        user.setAddress(address);
        user.setRealname(realname);
        user.setIdnum(idnum);
        int s=userService.UpdateUser2(user);
        if (s >=1){
            redirectAttributes.addAttribute("info", "修改成功");
        }else{
            redirectAttributes.addAttribute("info", "修改失败");
        }     redirectAttributes.addAttribute("page", 1);
        redirectAttributes.addAttribute("size", 7);
        return "redirect:/user/findByPager";
    }

    /*负责用户信息*/
    @RequestMapping("/duty")
    public ModelAndView duty(int id,HttpSession session){
        session.setAttribute("uid",id);
        ModelAndView mv =new ModelAndView();
        int uid = (int)session.getAttribute("uid");
        List<User> user = userService.duty(uid);
        System.out.println(user);
        mv.addObject("userduty", user);
        mv.setViewName("admin/duty");
        return mv;
    }
    //删除职责用户
    @RequestMapping("/dutydelet")
    public String dutydelet(int id, RedirectAttributes redirectAttributes) {
        int flag = userService.dutydelet(id);
        if (flag >=1){
            redirectAttributes.addAttribute("info", "删除成功");
        }else{
            redirectAttributes.addAttribute("info", "删除失败");
        }
        redirectAttributes.addAttribute("page", 1);
        redirectAttributes.addAttribute("size", 7);
        return "redirect:/user/duty";
    }

    //模糊查询
    @RequestMapping("/FuzzyQueryByUsername")
    public ModelAndView FuzzyQueryByUsername(int page, int size,String info,String username){
        ModelAndView mv = new ModelAndView();
        Page<User> pager = userService.FuzzyQueryByUsername(page,size,username);
        if (info != null) {
            mv.addObject("info", info);
        }
        mv.addObject("pager", pager);
        mv.setViewName("/mojuxian");
        return mv;
    }
    /*查询管理员与领导*/
    @RequestMapping("/findGLByPager")
    public ModelAndView findGLByPager(int page, int size,String info){
        ModelAndView mv = new ModelAndView();
        Page<User> pager = userService.findGLByPager(page, size);
        if (info != null) {
            mv.addObject("info", info);
        }
        mv.addObject("pager", pager);
        mv.setViewName("lead/xiurole");
        return mv;
    }
    /*修改角色*/
    @RequestMapping("/editrole")
    public String xiugai2(int id ,char userclass,RedirectAttributes redirectAttributes) {
        User user = new User();
        user.setId(id);
        user.setUserclass(userclass);
        int s=userService.editrole(user);
        if (s >=1){
            redirectAttributes.addAttribute("info", "修改成功");
        }else{
            redirectAttributes.addAttribute("info", "修改失败");
        }     redirectAttributes.addAttribute("page", 1);
        redirectAttributes.addAttribute("size", 7);
        return "redirect:/user/findGLByPager";
    }
    /*领导添加角色*/
    @RequestMapping("/addUser")
    public String addUser(String username, String password, Date birth, char userclass, RedirectAttributes redirectAttributes) throws SQLException {
        User user = new User();
        user.setUsername(username);
        user.setBirth(birth);
        user.setPassword(password);
        user.setUserclass(userclass);
        try {
            userService.addUser(user);
            redirectAttributes.addAttribute("info", "添加用户成功");
        }
        catch (Exception e) {
            redirectAttributes.addAttribute("info", "添加用户失败");
        }
        finally {
            redirectAttributes.addAttribute("page", 1);
            redirectAttributes.addAttribute("size", 7);
            return "redirect:/user/findGLByPager";
        }
    }
    /*领导查找管理员*/
    @RequestMapping("/findGByPager")
    public ModelAndView findGByPager(int page, int size,String info){
        ModelAndView mv = new ModelAndView();
        Page<User> pager = userService.findGByPager(page, size);
        if (info != null) {
            mv.addObject("info", info);
        }
        mv.addObject("pager", pager);
        mv.setViewName("lead/editadmin");
        return mv;
    }
    /*领导修改角户*/
    @RequestMapping("/edituser")
    public String edituser(int id ,String username,String password,String sex, Date birth,RedirectAttributes redirectAttributes) {
        User user = new User();
        user.setId(id);
        user.setUsername(username);
        user.setPassword(password);
        user.setBirth(birth);
        user.setSex(sex);
        int s=userService.edituser(user);
        if (s >=1){
            redirectAttributes.addAttribute("info", "修改成功");
        }else{
            redirectAttributes.addAttribute("info", "修改失败");
        }     redirectAttributes.addAttribute("page", 1);
        redirectAttributes.addAttribute("size", 7);
        return "redirect:/user/findGByPager";
    }
    /*一线人员模糊搜索*/
    @RequestMapping("/FQGByname")
    public ModelAndView FQGByname(int page, int size,String info,String username){
        ModelAndView mv = new ModelAndView();
        Page<User> pager = userService.FQGByname(page,size,username);
        if (info != null) {
            mv.addObject("info", info);
        }
        mv.addObject("pager", pager);
        mv.addObject("username", username);
        mv.setViewName("/lead/editadminmohu");
        return mv;
    }
    /*角色模糊搜索*/
    @RequestMapping("/FQGLByname")
    public ModelAndView FQGLByname(int page, int size,String info,String username){
        ModelAndView mv = new ModelAndView();
        Page<User> pager = userService.FQGLByname(page,size,username);
        if (info != null) {
            mv.addObject("info", info);
        }
        mv.addObject("pager", pager);
        mv.addObject("username", username);
        mv.setViewName("/lead/xiurolemohu");
        return mv;
    }
    /*查询未退房的*/
    @RequestMapping("/findNOTByPager")
    public ModelAndView findNOTByPager(int page, int size,String info){
        ModelAndView mv = new ModelAndView();
        Page<User> pager = userService.findNOTByPager(page, size);
        if (info != null) {
            mv.addObject("info", info);
        }
        mv.addObject("pager", pager);
        mv.setViewName("admin/exit");
        return mv;
    }
}
