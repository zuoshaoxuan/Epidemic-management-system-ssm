package com.xjt.controller;

import com.xjt.model.Abnormal;
import com.xjt.model.Page;
import com.xjt.service.IAbnormalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;


@Controller
@RequestMapping("/ab")
public class abnormalController {
    @Autowired
    private IAbnormalService abnormalService;
    /*插入报告单*/
    @RequestMapping("/addab")
    public String insert(String username, String symptom0, String symptom1, String symptom2, String symptom3,
                         String symptom4, String symptom5, String reporter, Date reportertime, HttpSession session) throws SQLException, ParseException {
        Abnormal abnormal=new Abnormal();
        Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        Timestamp time = date;
        abnormal.setUsername(username);
        abnormal.setSymptom0(symptom0);
        abnormal.setSymptom1(symptom1);
        abnormal.setSymptom2(symptom2);
        abnormal.setSymptom3(symptom3);
        abnormal.setSymptom4(symptom4);
        abnormal.setSymptom5(symptom5);
        abnormal.setReporter(reporter);
        abnormal.setReportertime(reportertime);
        abnormal.setTime(time);
        try{
            abnormalService.insertab(abnormal);
            System.out.println("执行了");
            session.setAttribute("info", "提交成功");
            System.out.println("插入数据ok");
        }
        catch (Exception e) {
            session.setAttribute("info", "提交失败");;
        }
        finally {
            return "/admin/abnormal";
        }
    }
    /*查询报告单*/
    @RequestMapping("/findabByPager")
    public ModelAndView findabByPager(int page, int size, String info){
        ModelAndView mv = new ModelAndView();
        Page<Abnormal> pager = abnormalService.findabByPager(page, size);
        if (info != null) {
            mv.addObject("info", info);
        }
        mv.addObject("pager", pager);
        mv.setViewName("lead/abnormalsp");
        return mv;
    }
    /*报告单审批*/
    @RequestMapping("/abnormalsp")
    public String abnormalsp(int id,RedirectAttributes redirectAttributes) {
        int s=abnormalService.abnormalsp(id);
        if (s >=1){
            redirectAttributes.addAttribute("info", "审批成功");
        }else{
            redirectAttributes.addAttribute("info", "审批失败");
        }     redirectAttributes.addAttribute("page", 1);
        redirectAttributes.addAttribute("size", 7);
        return "redirect:/ab/findabByPager";
    }
    /*报告单驳回*/
    @RequestMapping("/abnormalno")
    public String abnormalno(int id,RedirectAttributes redirectAttributes) {
        int s=abnormalService.abnormalno(id);
        if (s >=1){
            redirectAttributes.addAttribute("info", "已驳回");
        }else{
            redirectAttributes.addAttribute("info", "驳回失败");
        }     redirectAttributes.addAttribute("page", 1);
        redirectAttributes.addAttribute("size", 7);
        return "redirect:/ab/findabByPager";
    }

}
