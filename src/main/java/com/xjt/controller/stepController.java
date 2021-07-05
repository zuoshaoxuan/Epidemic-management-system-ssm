package com.xjt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller //注解控制器
@RequestMapping(value="/user")// 定义controller名称
public class stepController {
    @RequestMapping("/go")
    public String go(){
        return "user";
    }
    @RequestMapping("/quanxian")
    public String xiurole(){
        return "lead/quanxian";
    }
    @RequestMapping("/caip")
    public String caip(){
        return "admin/caip";
    }
    @RequestMapping("/fenbu")
    public String fengbu(){
        return "lead/sjksh";
    }
    @RequestMapping("/Approval")
    public String Approval(){
        return "lead/billapproval";
    }
    @RequestMapping("/xiubill")
    public String xiubill(){
        return "lead/xiubill";
    }
    @RequestMapping("/help")
    public String help(){return "/help";}
    @RequestMapping("/abnormal")
    public String abnormal(){return "/admin/abnormal";}
}
