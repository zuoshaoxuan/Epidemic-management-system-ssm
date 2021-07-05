package com.xjt.model;

import java.sql.Timestamp;

public class Bill {
    private  int id ;
    private  String billno;
    private  int orderuser;
    private int money ;
    private String creater;
    private Timestamp createtime;
    private String orderusername;
    private  int sp;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBillno() {
        return billno;
    }

    public void setBillno(String billno) {
        this.billno = billno;
    }

    public int getOrderuser() {
        return orderuser;
    }

    public void setOrderuser(int orderuser) {
        this.orderuser = orderuser;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public String getOrderusername() {
        return orderusername;
    }

    public void setOrderusername(String orderusername) {
        this.orderusername = orderusername;
    }

    public int getSp() {
        return sp;
    }

    public void setSp(int sp) {
        this.sp = sp;
    }
}
