package com.xjt.controller;


import com.xjt.model.Caip;
import com.xjt.model.Caiporder;
import com.xjt.model.Page;
import com.xjt.model.User;
import com.xjt.service.ICaipService;
import com.xjt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("/caip")
public class CaipController {
    @Autowired
    private ICaipService caipService;
    @Autowired
    private IUserService userService;

    @RequestMapping("/caiporder")
    public String go(){
        return "userpage/caiporder";
    }
    /*菜品分页查询*/
    @RequestMapping("/findcaipByPager")
    public ModelAndView findcaipByPager(int page, int size, String info){
        ModelAndView mv = new ModelAndView();
        Page<Caip> pager = caipService.findcaipByPager(page, size);
        if (info != null) {
            mv.addObject("info", info);
        }
        mv.addObject("pager", pager);
        mv.setViewName("userpage/caiporder");
        return mv;
    }
    /*全部分页查询*/
    @RequestMapping("/findAllCaipByPager")
    public ModelAndView findAllCaipByPager(int page, int size, String info){
        ModelAndView mv = new ModelAndView();
        Page<Caip> pager = caipService.findAllCaipByPager(page, size);
        if (info != null) {
            mv.addObject("info", info);
        }
        mv.addObject("pager", pager);
        mv.setViewName("admin/caip");
        return mv;
    }
    /*添加菜品/日用品*/
    @RequestMapping("/addCaip")
    public String insert(String cpname,String cpdescribe, int caipy, RedirectAttributes redirectAttributes) throws SQLException {
        Caip caip = new Caip();
        caip.setCpname(cpname);
        caip.setCpdescribe(cpdescribe);
        caip.setCaipy(caipy);
        try{
            caipService.insertCaip(caip);
            redirectAttributes.addAttribute("info", "添加成功");
        }
        catch (Exception e) {
            redirectAttributes.addAttribute("info", "添加失败");
        }
        finally {
            redirectAttributes.addAttribute("page", 1);
            redirectAttributes.addAttribute("size", 7);
            return "redirect:/caip/findAllCaipByPager";
        }
    }
    /*修改菜品/日用品*/
    @RequestMapping("/editcaip")
    public String editcaip(int id , String cpname, String cpdescribe, int caipy,RedirectAttributes redirectAttributes) {
        Caip caip = new Caip();
        caip.setId(id);
        caip.setCpname(cpname);
        caip.setCpdescribe(cpdescribe);
        caip.setCaipy(caipy);
        int s=caipService.editcaip(caip);
        if (s >=1){
            redirectAttributes.addAttribute("info", "修改成功");
        }else{
            redirectAttributes.addAttribute("info", "修改失败");
        }     redirectAttributes.addAttribute("page", 1);
        redirectAttributes.addAttribute("size", 7);
        return "redirect:/caip/findAllCaipByPager";
    }
    /*删除菜品/日用品*/
    @RequestMapping("/deletcaip")
    public String deletcaip(int id, RedirectAttributes redirectAttributes) {
        int flag = caipService.deletcaip(id);
        if (flag >=1){
            redirectAttributes.addAttribute("info", "删除成功");
        }else{
            redirectAttributes.addAttribute("info", "删除失败");
        }     redirectAttributes.addAttribute("page", 1);
        redirectAttributes.addAttribute("size", 7);
        return "redirect:/caip/findAllCaipByPager";
    }
    /*模糊搜索菜品/日用品*/
    @RequestMapping("/FuzzyQueryBycpname")
    public ModelAndView FuzzyQueryBycpname(int page, int size,String info,String cpname){
        ModelAndView mv = new ModelAndView();
        Page<Caip> pager = caipService.FuzzyQueryBycpname(page,size,cpname);
        if (info != null) {
            mv.addObject("info", info);
        }
        mv.addObject("pager", pager);
        mv.setViewName("/admin/mohucaip");
        mv.addObject("cpname",cpname);
        return mv;
    }
    /*插入到菜品订单*/
    @RequestMapping("/orderCaip")
    public String orderCaip(String Username, String temp, RedirectAttributes redirectAttributes, HttpSession session){
        Caiporder caiporder = new Caiporder();
        long uid= (long) session.getAttribute("uid");
        System.out.println(uid);
        long id=uid;
        Timestamp date =new java.sql.Timestamp(new java.util.Date().getTime());
        caiporder.setUid(id);
        caiporder.setCdate(date);
        caiporder.setTemp(temp);
        try{
            caipService.orderCaip(caiporder);
            redirectAttributes.addAttribute("info", "选购成功");
        }
        catch (Exception e) {
            redirectAttributes.addAttribute("info", "选购失败");
        }
        finally {
            redirectAttributes.addAttribute("page", 1);
            redirectAttributes.addAttribute("size", 7);
            return "redirect:/caip/findcaipByPager";
        }
    }
    /*查询菜单信息*/
    @RequestMapping("/findAllorderByPager")
    public ModelAndView findAllorderByPager(int page, int size, HttpSession session, String info){
        ModelAndView mv = new ModelAndView();
        long uid= (long) session.getAttribute("uid");
        System.out.println(uid);
        Page<Caiporder> pager = caipService.findAllorderByPager(page, size,uid);
        if (info != null) {
            mv.addObject("info", info);
        }
        List<Caiporder> caiporders = pager.getRows();
        for (int i = 0; i < caiporders.size(); i++) {
            int a=caiporders.get(i).getSend();
            if (a==1){
                caiporders.get(i).setSendYN("已送达");
            }else {
                caiporders.get(i).setSendYN("未送达");
            }
        }
        mv.addObject("pager", pager);
        mv.setViewName("userpage/Myorder");
        return mv;
    }
    /*管理员查找所有订单*/
    @RequestMapping("/adfindAllorderByPager")
    public ModelAndView adfindAllorderByPager(int page, int size, String info){
        ModelAndView mv = new ModelAndView();
        User user=new User();
        Page<Caiporder> pager = caipService.findAllByPager(page,size);
        if (info != null) {
            mv.addObject("info", info);
        }
        List<Caiporder> caiporders = pager.getRows();
        for (int i = 0; i < caiporders.size(); i++) {
            int a=caiporders.get(i).getSend();
            long id=caiporders.get(i).getUid();
            user = userService.selectUser(id);
            String username=user.getUsername();
            if (a==1){
                caiporders.get(i).setSendYN("已送达");
                caiporders.get(i).setUsername(username);
            }else {
                caiporders.get(i).setSendYN("未送达");
                caiporders.get(i).setUsername(username);
            }
        }
        mv.addObject("pager", pager);
        mv.setViewName("admin/caisend");
        return mv;
    }
    /*已送达*/
    @RequestMapping("/sended")
    public String sended(int id,RedirectAttributes redirectAttributes){
        int flag = caipService.sended(id);
        if (flag >=1){
            redirectAttributes.addAttribute("info", "成功送达");
        }else{
            redirectAttributes.addAttribute("info", "修改失败");
        }     redirectAttributes.addAttribute("page", 1);
        redirectAttributes.addAttribute("size", 7);
        return "redirect:/caip/adfindAllorderByPager";
    }
    /*查询日用品*/
    @RequestMapping("/findAllGoodsByPager")
    public ModelAndView findAllGoodsByPager(int page, int size, String info){
        ModelAndView mv = new ModelAndView();
        Page<Caip> pager = caipService.findAllGoodsByPager(page, size);
        if (info != null) {
            mv.addObject("info", info);
        }
        mv.addObject("pager", pager);
        mv.setViewName("userpage/goodsorder");
        return mv;
    }
    /*插入日用品*/
    @RequestMapping("/orderGoods")
    public String orderGoods(String Username, String temp, RedirectAttributes redirectAttributes, HttpSession session){
        Caiporder caiporder = new Caiporder();
        long uid= (long) session.getAttribute("uid");
        long id=uid;
        Timestamp date =new java.sql.Timestamp(new java.util.Date().getTime());
        caiporder.setUid(id);
        caiporder.setCdate(date);
        caiporder.setTemp(temp);
        try{
            caipService.orderCaip(caiporder);
            redirectAttributes.addAttribute("info", "选购成功");
        }
        catch (Exception e) {
            redirectAttributes.addAttribute("info", "选购失败");
        }
        finally {
            redirectAttributes.addAttribute("page", 1);
            redirectAttributes.addAttribute("size", 7);
            return "redirect:/caip/findAllGoodsByPager";
        }
    }
}
