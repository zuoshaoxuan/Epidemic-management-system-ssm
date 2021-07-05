package com.xjt.model;

import java.sql.Date;

public class User {

    private long id;
    private String username;
    private String password;
    private Date birth;
    private String sex;
    private String phonenum;
    private String email;
    private String qq;
    private String address;
    private String realname;
    private String idnum;
    private char userclass;
    private char userpower;
    private String cadd;
    private int tl;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getIdnum() {
        return idnum;
    }

    public void setIdnum(String idnum) {
        this.idnum = idnum;
    }

    public char getUserclass() {
        return userclass;
    }

    public void setUserclass(char userclass) {
        this.userclass = userclass;
    }

    public char getUserpower() {
        return userpower;
    }

    public void setUserpower(char userpower) {
        this.userpower = userpower;
    }

    public String getCadd() {
        return cadd;
    }

    public void setCadd(String cadd) {
        this.cadd = cadd;
    }

    public int getTl() {
        return tl;
    }

    public void setTl(int tl) {
        this.tl = tl;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", birth=" + birth +
                ", sex='" + sex + '\'' +
                ", phonenum='" + phonenum + '\'' +
                ", email='" + email + '\'' +
                ", qq='" + qq + '\'' +
                ", address='" + address + '\'' +
                ", realname='" + realname + '\'' +
                ", idnum='" + idnum + '\'' +
                ", userclass=" + userclass +
                ", userpower=" + userpower +
                ", cadd='" + cadd + '\'' +
                '}';
    }
}
