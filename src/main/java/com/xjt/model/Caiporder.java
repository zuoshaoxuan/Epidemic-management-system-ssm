package com.xjt.model;

import java.sql.Timestamp;

public class Caiporder {
    private int id;
    private long uid;
    private Timestamp cdate;
    private String temp;
    private int send;
    private String sendYN;
    private String username;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }

    public Timestamp getCdate() {
        return cdate;
    }

    public void setCdate(Timestamp cdate) {
        this.cdate = cdate;
    }

    public String getTemp() {
        return temp;
    }

    public void setTemp(String temp) {
        this.temp = temp;
    }

    public int getSend() {
        return send;
    }

    public void setSend(int send) {
        this.send = send;
    }

    public String getSendYN() {
        return sendYN;
    }

    public void setSendYN(String sendYN) {
        this.sendYN = sendYN;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Caiporder{" +
                "id=" + id +
                ", uid=" + uid +
                ", cdate=" + cdate +
                ", temp='" + temp + '\'' +
                ", send=" + send +
                '}';
    }
}
