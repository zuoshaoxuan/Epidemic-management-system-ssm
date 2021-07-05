package com.xjt.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller //注解控制器
@RequestMapping(value="/login")// 定义controller名称
public class loginController {
    @RequestMapping("/login")
    public String gotest(){ return "login"; }
    @RequestMapping("/right")
    public String goindex(){ return "right-index"; }
    @RequestMapping("/Xinfo")
    public String goceshi(){
        return "Xinfo";
    }
    /*退出*/
    @RequestMapping("/exit")
    public String logout(){
        return "logout";
    }
    @RequestMapping("/ceshi2")
    public String goceshi2(){
        return "ceshi2";
    }
    @RequestMapping("/changpass")
    public String changpass(){
        return "userpage/changpass";
    }
    @RequestMapping("/addsu")
    public String addsu(){
        return "admin/alluser";
    }
    @RequestMapping("/xiu")
    public String xiurole(){
        return "lead/xiurole";
    }
}



