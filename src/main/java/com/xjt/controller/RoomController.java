package com.xjt.controller;

import com.xjt.model.Bill;
import com.xjt.model.Caip;
import com.xjt.model.Page;
import com.xjt.model.Room;
import com.xjt.service.IBillService;
import com.xjt.service.IRoomService;
import com.xjt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@Controller
@RequestMapping("/room")
public class RoomController {
    @Autowired
    private IRoomService roomService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IBillService billService;
    /*分页查找*/
    @RequestMapping("/findroomByPager")
    public ModelAndView findroomByPager(int page, int size, String info){
        ModelAndView mv = new ModelAndView();
        Page<Room> pager = roomService.findroomByPager(page, size);
        if (info != null) {
            mv.addObject("info", info);
        }
        mv.addObject("pager", pager);
        mv.setViewName("admin/room");
        return mv;
    }
    /*添加房间*/
    @RequestMapping("/addRoom")
    public String insert(String roomname,String roomadd, int userd, RedirectAttributes redirectAttributes) throws SQLException {
        Room room =new Room();
        room.setRoomname(roomname);
        room.setRoomadd(roomadd);
        room.setUserd(userd);
        try{
            roomService.insertRoom(room);
            redirectAttributes.addAttribute("info", "添加成功");
        }
        catch (Exception e) {
            redirectAttributes.addAttribute("info", "添加失败");
        }
        finally {
            redirectAttributes.addAttribute("page", 1);
            redirectAttributes.addAttribute("size", 7);
            return "redirect:/room/findroomByPager";
        }
    }
    /*修改房间*/
    @RequestMapping("/editroom")
    public String editroom(int id , String roomname, String roomadd, int userd,RedirectAttributes redirectAttributes) throws UnsupportedEncodingException {
        Caip caip = new Caip();
        Room room= new Room();
        room.setId(id);
        String roomname2 = new String(roomname.getBytes("iso-8859-1"),"utf-8");
        room.setRoomname(roomname2);
        room.setRoomadd(roomadd);
        room.setUserd(userd);
        int s=roomService.editroom(room);
        if (s >=1){
            redirectAttributes.addAttribute("info", "修改成功");
        }else{
            redirectAttributes.addAttribute("info", "修改失败");
        }     redirectAttributes.addAttribute("page", 1);
        redirectAttributes.addAttribute("size", 7);
        return "redirect:/room/findroomByPager";
    }
    /*删除房间*/
    @RequestMapping("/deletroom")
    public String deletroom(int id, RedirectAttributes redirectAttributes) {
        int flag = roomService.deletroom(id);
        if (flag >=1){
            redirectAttributes.addAttribute("info", "删除成功");
        }else{
            redirectAttributes.addAttribute("info", "删除失败");
        }     redirectAttributes.addAttribute("page", 1);
        redirectAttributes.addAttribute("size", 7);
        return "redirect:/room/findroomByPager";
    }
    /*退订操作*/
    @RequestMapping("/roomtl")
    public String roomtl(int userid,String creater,int money,int money1,  RedirectAttributes redirectAttributes){
        Bill bill=new Bill();
        int id= userid;
        int orderuser = userid;
        money = money+money1;
        Timestamp date =new java.sql.Timestamp(new java.util.Date().getTime());
        Timestamp createtime = date;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String billno = formatter.format(createtime);
        bill.setBillno(billno);
        bill.setOrderuser(orderuser);
        bill.setMoney(money);
        bill.setCreater(creater);
        bill.setCreatetime(createtime);
        try{
            roomService.updateuserd(userid);
            userService.removeroom(id);
            billService.insertBill(bill);
            redirectAttributes.addAttribute("info", "退成功");
        }catch (Exception e) {
            redirectAttributes.addAttribute("info", "退失败");
            System.out.println(e);
        }
        finally {
            redirectAttributes.addAttribute("page", 1);
            redirectAttributes.addAttribute("size", 7);
            return "redirect:/user/findNOTByPager";
        }
    }
    /*修改住户*/
    @RequestMapping("/xiuroomuser")
    public void xiuroomuser(int id){
        Room room =new Room();
        room.setUserd(id);
        try{
            roomService.insertRoom(room);
        }
        catch (Exception e) {
            System.out.println("添加失败，原因"+e);
        }
    }
}
