package com.xjt.controller;

import com.xjt.model.Bill;
import com.xjt.model.Page;
import com.xjt.model.User;
import com.xjt.service.IBillService;
import com.xjt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/bill")
public class BillController {
    @Autowired
    private IBillService billService;
    @Autowired
    private IUserService userService;
    /*全部分页查询*/
    @RequestMapping("/findAllBillByPager")
    public ModelAndView findAllCaipByPager(int page, int size, String info){
        ModelAndView mv = new ModelAndView();
        Page<Bill> pager = billService.findAllBillByPager(page, size);
        List<Bill> bill =pager.getRows();
        for (int i=0;i<bill.size();i++) {
            int id= bill.get(i).getOrderuser();
            System.out.println(id);
            User user =  userService.selectUser(id);
              String username = user.getUsername();
            System.out.println(username);
              bill.get(i).setOrderusername(username);
        }
        pager.setRows(bill);
        if (info != null) {
            mv.addObject("info", info);
        }
        mv.addObject("pager", pager);
        mv.setViewName("lead/quanxian");
        return mv;
    }
    /*修改分页查询*/
    @RequestMapping("/xiufindAllBillByPager")
    public ModelAndView xiufindAllCaipByPager(int page, int size, String info){
        ModelAndView mv = new ModelAndView();
        Page<Bill> pager = billService.findAllBillByPager(page, size);
        List<Bill> bill =pager.getRows();
        for (int i=0;i<bill.size();i++) {
            int id= bill.get(i).getOrderuser();
            System.out.println(id);
            User user =  userService.selectUser(id);
            String username = user.getUsername();
            bill.get(i).setOrderusername(username);
        }
        pager.setRows(bill);
        if (info != null) {
            mv.addObject("info", info);
        }
        mv.addObject("pager", pager);
        mv.setViewName("lead/xiubill");
        return mv;
    }
    /*修改单据*/
    @RequestMapping("/editbill")
    public String editbill(int id , int money, RedirectAttributes redirectAttributes) {
        Bill bill= new Bill();
        bill.setId(id);
        bill.setMoney(money);
        int s= billService.editbill(bill);
        if (s >=1){
            redirectAttributes.addAttribute("info", "修改成功");
        }else{
            redirectAttributes.addAttribute("info", "修改失败");
        }     redirectAttributes.addAttribute("page", 1);
        redirectAttributes.addAttribute("size", 7);
        return "redirect:/bill/xiufindAllBillByPager";

    }
    /*审批查询*/
    @RequestMapping("/spfindAllBillByPager")
    public ModelAndView spfindAllCaipByPager(int page, int size, String info){
        ModelAndView mv = new ModelAndView();
        Page<Bill> pager = billService.spfindAllBillByPager(page, size);
        List<Bill> bill =pager.getRows();
        for (int i=0;i<bill.size();i++) {
            int id= bill.get(i).getOrderuser();
            System.out.println(id);
            User user =  userService.selectUser(id);
            String username = user.getUsername();
            bill.get(i).setOrderusername(username);
        }
        pager.setRows(bill);
        if (info != null) {
            mv.addObject("info", info);
        }
        mv.addObject("pager", pager);
        mv.setViewName("lead/billapproval");
        return mv;
    }
    /*通过审批*/
    @RequestMapping("/billsp")
    public String billsp(int id,RedirectAttributes redirectAttributes) {
        int s=billService.billsp(id);
        if (s >=1){
            redirectAttributes.addAttribute("info", "审批成功");
        }else{
            redirectAttributes.addAttribute("info", "审批失败");
        }     redirectAttributes.addAttribute("page", 1);
        redirectAttributes.addAttribute("size", 7);
        return "redirect:/bill/spfindAllBillByPager";
    }
    /*驳回审批*/
    @RequestMapping("/billno")
    public String billno(int id,RedirectAttributes redirectAttributes) {
        int s=billService.billno(id);
        if (s >=1){
            redirectAttributes.addAttribute("info", "驳回成功");
        }else{
            redirectAttributes.addAttribute("info", "驳回失败");
        }     redirectAttributes.addAttribute("page", 1);
        redirectAttributes.addAttribute("size", 7);
        return "redirect:/bill/spfindAllBillByPager";
    }

}
